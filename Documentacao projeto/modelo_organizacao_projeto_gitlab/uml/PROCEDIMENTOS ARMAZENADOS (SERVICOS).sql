INSERT INTO Tipo_cobranca (Tipo) values
('Por Hora'),
('Por Serviço');

insert into categorias (cate_tipo, cate_qtd) values
("Informatica", 0),
("Jardinagem", 0),
("Eletrica", 0);

select * from Tipo_cobranca;
select * from categorias;

DELIMITER @@
CREATE PROCEDURE pc_Insert_Servico(
    -- Parâmetros de Saída
    OUT ps_msg VARCHAR(255),
    OUT ps_new_serv_id INT, -- Retorna o ID do serviço criado
    
    -- Parâmetros de Entrada (IN)
    IN ps_titulo VARCHAR(45),
    IN ps_descricao VARCHAR(255),
    IN ps_valor FLOAT,
    IN ps_tipo_cobranca_id INT,
    IN ps_categoria_id INT,
    IN ps_usuario_id INT -- O ID do usuário (prestador) dono do serviço
)
BEGIN
    -- Variáveis para validar as Chaves Estrangeiras (FKs)
    DECLARE v_user_count INT DEFAULT 0;
    DECLARE v_cat_count INT DEFAULT 0;
    DECLARE v_tipo_count INT DEFAULT 0;

    -- 1. DECLARE do HANDLER (DEVE VIR ANTES DE QUALQUER 'SET' ou 'IF')
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET ps_new_serv_id = NULL;
        SET ps_msg = 'Erro inesperado. A transação foi revertida.';
        ROLLBACK; -- (Embora não haja transação explícita, é uma boa prática)
    END;
    
    -- 2. Lógica (IFs de validação de entrada)
    IF ps_titulo IS NULL OR ps_titulo = '' THEN
        SET ps_msg = 'ERRO! O título não pode ser vazio.';
    ELSEIF ps_descricao IS NULL OR ps_descricao = '' THEN
        SET ps_msg = 'ERRO! A descrição não pode ser vazia.';
    ELSEIF ps_valor IS NULL OR ps_valor < 0 THEN
        SET ps_msg = 'ERRO! O valor do serviço é inválido.';
    ELSEIF ps_usuario_id IS NULL OR ps_categoria_id IS NULL OR ps_tipo_cobranca_id IS NULL THEN
        SET ps_msg = 'ERRO! IDs de usuário, categoria ou cobrança não podem ser nulos.';
    ELSE
        -- 3. Validar a existência das Chaves Estrangeiras (FKs)
        SELECT COUNT(*) INTO v_user_count FROM Usuario WHERE user_id = ps_usuario_id;
        SELECT COUNT(*) INTO v_cat_count FROM categorias WHERE cate_id = ps_categoria_id;
        SELECT COUNT(*) INTO v_tipo_count FROM Tipo_cobranca WHERE cobranca_id = ps_tipo_cobranca_id;

        IF v_user_count = 0 THEN
            SET ps_msg = 'ERRO! O Usuário (prestador) fornecido não existe.';
        ELSEIF v_cat_count = 0 THEN
            SET ps_msg = 'ERRO! A Categoria fornecida não existe.';
        ELSEIF v_tipo_count = 0 THEN
            SET ps_msg = 'ERRO! O Tipo de Cobrança fornecido não existe.';
        ELSE
            -- 4. Tudo válido, INSERIR o serviço
            INSERT INTO Servico(
                serv_titulo,
                serv_descricao,
                serv_valor,
                Tipo_cobranca_PK,
                categorias_FK,
                Usuario_FK,
                `status` -- (Status 0 = Pendente, conforme seu script)
            ) VALUES (
                ps_titulo,
                ps_descricao,
                ps_valor,
                ps_tipo_cobranca_id,
                ps_categoria_id,
                ps_usuario_id,
                0 -- (Padrão: 0 = Pendente de aprovação)
            );
            
            -- 5. Retornar a mensagem de sucesso e o novo ID
            SET ps_new_serv_id = LAST_INSERT_ID();
            SET ps_msg = 'Serviço cadastrado com sucesso. Aguardando aprovação.';
            
        END IF;
    END IF;

END @@
DELIMITER ;



DELIMITER @@
DROP TRIGGER IF EXISTS tg_Update_Categoria;
create TRIGGER  tg_Update_Categoria AFTER INSERT ON Servico
for each row
begin

UPDATE categorias
    SET cate_qtd = cate_qtd + 1 
    WHERE cate_id = NEW.categorias_FK; 
end @@
DELIMITER ;

