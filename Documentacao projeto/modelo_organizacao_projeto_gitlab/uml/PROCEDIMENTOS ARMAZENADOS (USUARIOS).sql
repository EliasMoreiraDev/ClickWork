set autocommit = 0;

#PROCEDIMENTO INSERT DE PESSOA FISICA USUARIO, ENDERECO E SOCIAL
DELIMITER @@
CREATE PROCEDURE pc_Insert_User_PF(
    -- Saída
    OUT ps_msg VARCHAR(255),
    
    -- Tabela Pessoa_Fisica
    IN ps_nome VARCHAR(45), 
    IN ps_cpf VARCHAR(11), 
    IN ps_data_nascimento DATE,
    
    -- Tabela Usuario (Comum)
    IN ps_email VARCHAR(45), 
    IN ps_senha VARCHAR(255),
    IN ps_telefone VARCHAR(11),
    
    -- Tabela Endereco
    IN ps_ende_rua VARCHAR(45), 
    IN ps_ende_bairro VARCHAR(45), 
    IN ps_ende_numero VARCHAR(45),
    IN ps_ende_complemento VARCHAR(45), 
    IN ps_cep VARCHAR(8),
    
    -- Tabela Social
    IN ps_instagram VARCHAR(45), 
    IN ps_facebook VARCHAR(45), 
    IN ps_whatsapp VARCHAR(45), 
    IN ps_telegram VARCHAR(45)
)
BEGIN
    -- Variáveis para armazenar os novos IDs
    DECLARE endeID INT;
    DECLARE socialID INT;
    DECLARE userID INT;
    
    -- Variáveis de Validação
    -- CORREÇÃO: Nomes de variáveis e WHERE
    SET @cpf_count = (SELECT COUNT(*) FROM Pessoa_Fisica WHERE pf_cpf = ps_cpf);
    SET @email_count = (SELECT COUNT(*) FROM Usuario WHERE user_email = ps_email);


    
    -- VALIDACAO DOS DADOS (CORRIGIDO NOME DAS VARIÁVEIS)
    IF @cpf_count > 0 THEN
        SET ps_msg = 'ERRO! Esse CPF já existe no cadastro.';
    ELSEIF @email_count > 0 THEN
        SET ps_msg = 'ERRO! Esse E-mail já existe no cadastro.';
    ELSEIF ps_nome IS NULL OR ps_nome = '' THEN
        SET ps_msg = 'ERRO! O campo nome não pode estar em branco.';
    ELSEIF ps_email IS NULL OR ps_email = '' THEN
        SET ps_msg = 'ERRO! O campo e-mail não pode estar em branco.';
    ELSEIF ps_senha IS NULL OR ps_senha = '' THEN
        SET ps_msg = 'ERRO! O campo senha não pode estar em branco.';
    ELSEIF ps_data_nascimento IS NULL THEN
        SET ps_msg = 'ERRO! O campo data de nascimento não pode estar em branco.';
    ELSEIF ps_ende_rua IS NULL OR ps_ende_rua = '' THEN
        SET ps_msg = 'ERRO! O campo rua do endereço não pode estar em branco.';
    ELSE
    
        -- insert nas tabelas Endereco, Social, Usuario
        START TRANSACTION;
        
            INSERT INTO Endereco(ende_rua, ende_bairro, ende_numero, ende_complemento, ende_cep) 
            VALUES (ps_ende_rua, ps_ende_bairro, ps_ende_numero, ps_ende_complemento, ps_cep);
            SET endeID = LAST_INSERT_ID();
                                
            INSERT INTO Social(Instagram, Facebook, Whatsapp, Telegram) 
            VALUES (ps_instagram, ps_facebook, ps_whatsapp, ps_telegram);
            SET socialID = LAST_INSERT_ID();
            
            -- Seu INSERT de Usuario (AGORA CORRETO!)
            INSERT INTO Usuario(
                user_telefone, Endereco_FK, user_email, 
                user_senha, Social_FK, service_enable
            ) VALUES (
                ps_telefone, endeID, ps_email, 
                ps_senha, socialID, 0
            );
            SET userID = LAST_INSERT_ID();
            
            -- Inserir na tabela 'Pessoa_Fisica'
            INSERT INTO Pessoa_Fisica(Usuario_FK, pf_nome, pf_cpf, pf_data_nascimento) 
            VALUES (userID, ps_nome, ps_cpf, ps_data_nascimento);
                                
        COMMIT;
        SET ps_msg = "Usuário (Pessoa Física) cadastrado com sucesso!";
    END IF;
END @@
DELIMITER ;

#PROCEDIMENTO INSERT DE PESSOA JURIDICA USUARIO, ENDERECO E SOCIAL
DELIMITER @@
CREATE PROCEDURE pc_Insert_User_PJ(
    -- Saída
    OUT ps_msg VARCHAR(255),
    
    -- Tabela Pessoa_Juridica
    IN ps_razao_social VARCHAR(45), 
    IN ps_nome_fantasia VARCHAR(45),
    IN ps_cnpj VARCHAR(14),
        
    -- Tabela Usuario (Comum)
    IN ps_email VARCHAR(45), 
    IN ps_senha VARCHAR(255),
    IN ps_telefone VARCHAR(45),
    
    -- Tabela Endereco
    IN ps_ende_rua VARCHAR(45), 
    IN ps_ende_bairro VARCHAR(45), 
    IN ps_ende_numero VARCHAR(45),
    IN ps_ende_complemento VARCHAR(45), 
    IN ps_cep VARCHAR(8),
    
    -- Tabela Social
    IN ps_instagram VARCHAR(45), 
    IN ps_facebook VARCHAR(45), 
    IN ps_whatsapp VARCHAR(45), 
    IN ps_telegram VARCHAR(45)
)
BEGIN
    -- Variáveis para armazenar os novos IDs
    DECLARE endeID INT;
    DECLARE socialID INT;
    DECLARE userID INT;
    
    -- Variáveis de Validação
    -- CORREÇÃO: Nomes de variáveis e WHERE
    SET @cnpj_count = (SELECT COUNT(*) FROM Pessoa_Juridica WHERE pj_cnpj = ps_cnpj);
    SET @email_count = (SELECT COUNT(*) FROM Usuario WHERE user_email = ps_email);


    
    -- VALIDACAO DOS DADOS (TODA A LÓGICA FOI CORRIGIDA)
    IF @cnpj_count > 0 THEN
        SET ps_msg = 'ERRO! Esse CNPJ já existe no cadastro.'; -- Corrigido (era CPF)
    ELSEIF @email_count > 0 THEN
        SET ps_msg = 'ERRO! Esse E-mail já existe no cadastro.';
    ELSEIF ps_razao_social IS NULL OR ps_razao_social = '' THEN -- Corrigido (era ps_nome)
        SET ps_msg = 'ERRO! O campo Razão Social não pode estar em branco.';
    ELSEIF ps_email IS NULL OR ps_email = '' THEN
        SET ps_msg = 'ERRO! O campo e-mail não pode estar em branco.';
    ELSEIF ps_senha IS NULL OR ps_senha = '' THEN
        SET ps_msg = 'ERRO! O campo senha não pode estar em branco.';
    -- CORREÇÃO: Removida a validação de data de nascimento
    ELSEIF ps_ende_rua IS NULL OR ps_ende_rua = '' THEN
        SET ps_msg = 'ERRO! O campo rua do endereço não pode estar em branco.';
    ELSE
        
        -- insert nas tabelas Endereco, Social, Usuario
        START TRANSACTION;
        
            INSERT INTO Endereco(ende_rua, ende_bairro, ende_numero, ende_complemento, ende_cep) 
            VALUES (ps_ende_rua, ps_ende_bairro, ps_ende_numero, ps_ende_complemento, ps_cep);
            SET endeID = LAST_INSERT_ID();
                                
            INSERT INTO Social(Instagram, Facebook, Whatsapp, Telegram) 
            VALUES (ps_instagram, ps_facebook, ps_whatsapp, ps_telegram);
            SET socialID = LAST_INSERT_ID();
            
            -- Seu INSERT de Usuario (AGORA CORRETO!)
            INSERT INTO Usuario(
                user_telefone, Endereco_FK, user_email, 
                user_senha, Social_FK, service_enable
            ) VALUES (
                ps_telefone, endeID, ps_email, 
                ps_senha, socialID, 0
            );
            SET userID = LAST_INSERT_ID();
            
            -- Inserir na tabela 'Pessoa_Juridica'
            -- CORREÇÃO: usar 'userID' (não 'newUserID')
            INSERT INTO Pessoa_Juridica(Usuario_FK, pj_nome_fantasia, pj_razao_social, pj_cnpj) 
            VALUES (userID, ps_nome_fantasia, ps_razao_social, ps_cnpj);
                                
        COMMIT;
        SET ps_msg = "Usuário (Pessoa Jurídica) cadastrado com sucesso!";
    END IF;
END @@
DELIMITER ;


#PROCEDIMENTO DELETE DE PESSOA FISICA
DELIMITER @@
CREATE PROCEDURE pc_Delete_User_PF(
    OUT ps_msg VARCHAR(255), -- Aumentado o tamanho para mensagens de erro/sucesso
    IN ps_cpf VARCHAR(11)
)
BEGIN
    -- Variáveis para guardar os IDs
    DECLARE v_user_id INT;
    DECLARE v_ende_id INT;
    DECLARE v_social_id INT;

    -- 2. Validação inicial (input nulo)
    IF ps_cpf IS NULL OR ps_cpf = "" THEN
        SET ps_msg = "ERRO! O CPF não pode ser nulo ou vazio.";
    ELSE
        -- 3. Encontrar o usuário e seus IDs principais
        -- (Esta é a melhor forma de validar se ele existe)
        SELECT  pf.Usuario_FK, u.Endereco_FK, u.Social_FK
        INTO v_user_id, v_ende_id, v_social_id
        FROM Pessoa_Fisica pf -- Alias 'pf'
        JOIN Usuario u ON pf.Usuario_FK = u.user_id -- Alias 'u'
        WHERE pf.pf_cpf = ps_cpf;

        -- 4. Verificar se o usuário foi encontrado
        IF v_user_id IS NULL THEN
            SET ps_msg = 'ERRO! Usuário não encontrado com este CPF.';
        ELSE
            -- 5. Iniciar a Transação de Exclusão
            START TRANSACTION;

            -- 5.1 Deletar o que o usuário FEZ (referências diretas a Usuario_FK)
            DELETE FROM Avaliacao WHERE Usuario_FK = v_user_id;
            DELETE FROM Denuncias WHERE Usuario_FK = v_user_id;

            -- 5.2 Deletar o que está ligado aos SERVIÇOS do usuário
            -- (Usamos JOINs para encontrar o que deletar)
            
            -- Imagens dos serviços do usuário
            DELETE img FROM ImagensServico img
                JOIN Servico s ON img.Servico_PK = s.serv_id
                WHERE s.Usuario_FK = v_user_id;
		
            -- Avaliações SOBRE os serviços do usuário
            DELETE aval FROM Avaliacao aval
                JOIN Servico s ON aval.Servico_FK = s.serv_id
                WHERE s.Usuario_FK = v_user_id;
                
            -- Denúncias SOBRE os serviços do usuário
            DELETE den FROM Denuncias den
                JOIN Servico s ON den.Servico_FK = s.serv_id
                WHERE s.Usuario_FK = v_user_id;

            -- 5.3 Deletar os SERVIÇOS do usuário
            DELETE FROM Servico WHERE Usuario_FK = v_user_id;
            -- 5.4 Deletar o registro "tipo" (filho)
            DELETE FROM Pessoa_Fisica WHERE Usuario_FK = v_user_id;
            -- 5.5 Deletar o registro "pai"
            DELETE FROM Usuario WHERE user_id = v_user_id;

            -- 5.6 Deletar os dados "pertencentes" (que agora estão órfãos)
            DELETE FROM Endereco WHERE ende_id = v_ende_id;
            DELETE FROM Social WHERE idSocial = v_social_id;
            
            COMMIT;
            SET ps_msg = 'Todos os dados do usuario foram apagados.';
            
        END IF;
    END IF;

END @@
DELIMITER ;


#PROCEDIMENTO DELETE DE PESSOA JURIDICA
DELIMITER @@
CREATE PROCEDURE pc_Delete_User_PJ(
    OUT ps_msg VARCHAR(255), -- Aumentado o tamanho para mensagens de erro/sucesso
    IN ps_cnpj VARCHAR(14)
)
BEGIN
    -- Variáveis para guardar os IDs
    DECLARE v_user_id INT;
    DECLARE v_ende_id INT;
    DECLARE v_social_id INT;

    -- 2. Validação inicial (input nulo)
    IF ps_cnpj IS NULL OR ps_cnpj = "" THEN
        SET ps_msg = "ERRO! O CPF não pode ser nulo ou vazio.";
    ELSE
        -- 3. Encontrar o usuário e seus IDs principais
        -- (Esta é a melhor forma de validar se ele existe)
        SELECT  pj.Usuario_FK, u.Endereco_FK, u.Social_FK
        INTO v_user_id, v_ende_id, v_social_id
        FROM Pessoa_Juridica pj -- Alias 'pj'
        JOIN Usuario u ON pj.Usuario_FK = u.user_id -- Alias 'u'
        WHERE pj.pj_cnpj = ps_cnpj;

        -- 4. Verificar se o usuário foi encontrado
        IF v_user_id IS NULL THEN
            SET ps_msg = 'ERRO! Usuário não encontrado com este CPF.';
        ELSE
            -- 5. Iniciar a Transação de Exclusão
            START TRANSACTION;

            -- 5.1 Deletar o que o usuário FEZ (referências diretas a Usuario_FK)
            DELETE FROM Avaliacao WHERE Usuario_FK = v_user_id;
            DELETE FROM Denuncias WHERE Usuario_FK = v_user_id;

            -- 5.2 Deletar o que está ligado aos SERVIÇOS do usuário
            -- (Usamos JOINs para encontrar o que deletar)
            
            -- Imagens dos serviços do usuário
            DELETE img FROM ImagensServico img
                JOIN Servico s ON img.Servico_PK = s.serv_id
                WHERE s.Usuario_FK = v_user_id;
		
            -- Avaliações SOBRE os serviços do usuário
            DELETE aval FROM Avaliacao aval
                JOIN Servico s ON aval.Servico_FK = s.serv_id
                WHERE s.Usuario_FK = v_user_id;
                
            -- Denúncias SOBRE os serviços do usuário
            DELETE den FROM Denuncias den
                JOIN Servico s ON den.Servico_FK = s.serv_id
                WHERE s.Usuario_FK = v_user_id;

            -- 5.3 Deletar os SERVIÇOS do usuário
            DELETE FROM Servico WHERE Usuario_FK = v_user_id;
            -- 5.4 Deletar o registro "tipo" (filho)
            DELETE FROM Pessoa_Juridica WHERE Usuario_FK = v_user_id;
            -- 5.5 Deletar o registro "pai"
            DELETE FROM Usuario WHERE user_id = v_user_id;

            -- 5.6 Deletar os dados "pertencentes" (que agora estão órfãos)
            DELETE FROM Endereco WHERE ende_id = v_ende_id;
            DELETE FROM Social WHERE idSocial = v_social_id;
            
            COMMIT;
            SET ps_msg = 'Todos os dados do usuario foram apagados.';
            
        END IF;
    END IF;

END @@
DELIMITER ;




