CALL pc_Insert_User_PF(
    @msg_teste1, 
    'Lucas Coimbra Teste',      -- ps_name
    '11122239344',            -- ps_cpf (use um CPF novo)
    '2025-10-5',             -- ps_dateNascimento
    
    'lucas.testePF@email.com',  -- ps_email
    'senhaForte123',          -- ps_senha
	'69992162902',            -- ps_telefone
    
    'Rua das Flores',         -- ps_ende_rua
    'Bairro Centro',          -- ps_ende_bairro
    '123',                    -- ps_ende_numero
    'Apto 101',               -- ps_ende_complemento
    '01001000',               -- ps_cep
    
    'lucas_insta',            -- ps_instagram
    'lucas_face',             -- ps_facebook
    '11987654321',            -- ps_whatsapp
    'lucas_tele'              -- ps_telegram
);
SELECT @msg_teste1 as resultado;
SELECT * from Usuario;
SELECT * from Pessoa_Fisica;


CALL pc_Insert_User_PJ(
    @msg_teste1, 
	
    'Empresa Teste LTDA',     -- ps_razao_social
    'Nome Fantasia Teste',    -- ps_nome_fantasia
    '11222333000144',           -- ps_cnpj
    
    'lucas.testePJ@email.com',  -- ps_email
    'senhaForte123',          -- ps_senha
	'69992162902',            -- ps_telefone
    
    'Rua das Flores',         -- ps_ende_rua
    'Bairro Centro',          -- ps_ende_bairro
    '123',                    -- ps_ende_numero
    'Apto 101',               -- ps_ende_complemento
    '01001000',               -- ps_cep
    
    'lucas_insta',            -- ps_instagram
    'lucas_face',             -- ps_facebook
    '11987654321',            -- ps_whatsapp
    'lucas_tele'              -- ps_telegram
);
SELECT @msg_teste1 as resultado;
SELECT * from Usuario;
SELECT * from Pessoa_Juridica;


CALL pc_delete_User_PF(@mensagem,"11122239344");
select @mensagem as resultado;
select * from Usuario;

CALL pc_delete_User_PJ(@mensagem,"11222333000144");
select @mensagem as resultado;
select * from Usuario;


call pc_Insert_Servico(
@msg, 
@id,
'Formatacao de Computadores',
"formatacao completa de computadores",
150.00,
2,
1,
4
);
select @msg;
select @id;
select * from Servico;
select * from categorias;


