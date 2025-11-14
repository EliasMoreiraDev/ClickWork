# PROJETO DE SOFTWARE

## *Stakeholders*
|NOME|CARGO|E-MAIL|
|:---|:---|:---|
|Erick Weil|Professor|erick.weil@ifro.edu.br|


# Sumário

* [RESUMO DO PROJETO](#resumo-do-projeto)
* [INTRODUÇÃO](#introdução)
  * [PROPÓSITO DESTE DOCUMENTO](#propósito-deste-documento)
  * [CONCEPÇÃO DO SISTEMA](#concepção-do-sistema)
* [DESCRIÇÃO GERAL](#descrição-geral)
  * [USUÁRIOS DO SISTEMA](#usuários-do-sistema)
  * [ABRANGÊNCIA E SISTEMAS SIMILARES](#abrangência-e-sistemas-similares)
  * [SUPOSIÇÕES E DEPENDÊNCIAS](#suposições-e-dependências)
* [ESTUDO DE VIABILIDADE](#estudo-de-viabilidade)
* [METODOLOGIA ADOTADA NO DESENVOLVIMENTO](#metodologia-adotada-no-desenvolvimento)
* [REQUISITOS DO SOFTWARE](#requisitos-do-software)
  * [REQUISITOS FUNCIONAIS](#requisitos-funcionais)
  * [REQUISITOS NÃO FUNCIONAIS](#requisitos-não-funcionais)
* [PROTOTIPAGEM](#prototipagem)
* [DIAGRAMA DE ATIVIDADES](#diagrama-de-atividades)
* [DIAGRAMA DE SEQUÊNCIA](#diagrama-de-sequência)
* [DIAGRAMA DE CLASSES](#diagrama-de-classes)
* [DIAGRAMA DE CASOS DE USO](#diagrama-de-casos-de-uso)
  * [ESPECIFICAÇÃO DOS CASOS DE USO](#descrição--especificação-dos-casos-de-uso)
* [REFERÊNCIAS](#referências)


# RESUMO DO PROJETO

|ITEM|DETALHES|
|:---|:---|
|NOME| ClickWork  |
|Lider do Projeto| Lucas Santi Coimbra |
|PRINCIPAL OBJETIVO | Manter uma comunicação entre a prefeitura de Vilhena-RO e seus munícipes, facilitando o acesso aos serviços públicos. |
|BENEFÍCIOS ESPERADOS | Melhorar a cidade em todos os aspectos.|
|INÍCIO E TÉRMINO PREVISTOS | 26/08/2025 - 09/12/2025 |


# INTRODUÇÃO
Este projeto tem como objetivo criar um protótipo de um site para a prefeitura da cidade de Vilhena-RO, tendo em vista conectar o munícipe com sua cidade, solucionando problemas relacionados com a comunicação de ambos e facilitando a solução de problemas do município.


## PROPÓSITO DESTE DOCUMENTO
Este documento tem como propósito demonstrar como o projeto como um todo foi criado, para que foi criado e como deve ser utilizado.

## CONCEPÇÃO DO SISTEMA

Métodos utilizados para a obtenção dos requisitos do sistema:
  * Entrevistas com o cliente.
  * Pesquisas de projetos similares.
  * Pesquisas de serviços prestados pelo Governo do município de Vilhena. 

# DESCRIÇÃO GERAL


## Usuários do sistema

| USUÁRIO | DESCRIÇÃO |
|:---|:---|
| **Usuário Padrão:** | Munícipe: Usuário padrão de cadastro do site para solicitar demandas. |
| **Usuário Operador:** | Usuário que resolve demandas e manda foto da demanda solucionada. |
| **Usuário Colaborador/Secretaria:** | Usuário de cada secretaria que analisa, aprova e rejeita cada demanda. |
| **Usuário Administrador:** | Usuário que tem acesso a todo o sistema, acesso ao dashboard e atribui cargos para os usuários padrões. |


### Sistemas similares:
* 156 Curitiba


## Suposições e dependências

Os munícipes poderão acessar a plataforma através de qualquer dispositivel com acesso à internet . Como se trata de uma aplicação web, não há uma configuração mínima específica para visualização. No entanto é recomendado o uso de um computador devido ao layout do site

# ESTUDO DE VIABILIDADE
O sistema é viável por sua flexibilidade e por conter capacidade de adaptação do sistema para outros municípios. O Vilhena+Pública é uma forma prática de auxiliar na prestação de serviços públicos propostos pela prefeitura da cidade.

# Metodologia Adotada no Desenvolvimento
Utilizamos um modelo de desenvolvimento  Kanban, com acompanhamento do progresso do projeto por meio da análise de Throughput, Lead Time e Cycle Time. Além disso, utilizamos o Figma para criar o protótipo do site.

# Requisitos do Software

A especificação dos requisitos deste documento deve seguir as recomendações da norma IEEE Std-830-1998, levando em conta as recomentações do documento de [características dos requisitos](caracteristicas_requisitos.md).

## Requisitos Funcionais

A tabela a seguir contém a relação dos Requisitos Funcionais elicitados, com as colunas: identificador, nome, descrição e prioridade:

| IDENTIFICADOR | NOME | REGRA DE NEGÓCIO | PRIORIDADE |
| :---: | :---: | ----- | ----- |
| RQ-01 | Cadastro de Usuário | No cadastro de usuario deve-se informar nome completo, e-mail válido, telefone com DDD, CPF ou CNPJ e endereço. O e-mail deve ser confirmado via link enviado automaticamente. Contas sem confirmação serão excluídas após 7 dias | Essencial  |
| RQ-02 | Login Usuário | Após o cadastro do usuário o login pode ser realizado com o email e senha de cadastro definido pelo usuário  | Essencial  |
| RQ-03 | Recuperar Senha | O usuário poderá recuperar sua senha informando apenas o e-mail cadastrado. O sistema enviará automaticamente um e-mail contendo um link único de redefinição, válido por 30 minutos. Caso o link expire, o usuário deverá solicitar uma nova recuperação. Todas as sessões ativas devem ser encerradas após a redefinição da senha. | Essencial |
| RQ-04 | Editar perfil | Os cadastros podem ser alterados após o período de verificação. Tendo seu perfil verificado e aceito, poderá alterar dados como: nome, senha, foto de perfil, endereço e etc. Pode também excluir sua conta onde seus dados e anúncios vão ser desativados imediatamente e removidos do BD após 90 dias, conforme LGPD. | Essencial  |
| RQ-05 | Cadastro Prestador de serviços | No cadastro de prestador devem ser informados o **endereço completo**, **documento pessoal válido** (CPF/CNPJ ou RG) e, obrigatoriamente, pelo menos uma de suas **redes sociais**. | Essencial |
| RQ-06 | Publicar um serviço | Cada anúncio deve conter **título, descrição, categoria, preço, tipo de cobrança (diária, por hora, por m²) e pelo menos 1 imagem**. Anúncios duplicados ou com conteúdo proibido serão removidos. | Essencial |
| RQ-07 | Editar um serviço | Os usuários podem editar as suas respectivas postagem de serviço, como **título, descrição, categoria, preço imagens** | Essencial |
| RQ-08 | Excluir serviço | Os usuários podem excluir as suas respectivas postagem de serviço, como **título, descrição, categoria, preço imagens** | Essencial |
| RQ-09 | Visualizar Serviços | A visualização da página do anúncio do serviço está disponível sem a necessidade de login | Essencial |
| RQ-10 | Avaliação e Comentários  | Os usuários podem avaliar o serviço através da publicação do mesmo. Avaliações vão de 1 a 5 estrelas e podem conter comentário opcional. Comentários ofensivos serão removidos e o usuário poderá ser suspenso. | Essencial |
| RQ-11 | Buscar serviço | A busca deve retornar apenas anúncios ativos e aprovados. Filtros por **categoria, localização (raio em km) e faixa de preço** podem ser aplicados | Essencial |
| RQ-12 | Sistema de denúncias | Qualquer usuário pode denunciar anúncios ou perfis. Denúncias serão analisadas em até 48h. O conteúdo denunciado ficará oculto até conclusão da análise em casos graves. | Recomendável |
| RQ-13 | Notificações push | Notificações serão enviadas apenas para eventos relevantes (novas mensagens, solicitações). O usuário pode gerenciar preferências no perfil. | Recomendável |
| RQ-14 | Ver relatórios | O painel será disponibilizado aos usuários que possuem serviços cadastrados para que podem utilizá-lo como um dashboard de relatórios gerados com base em visualizações do perfil e serviço e solicitações dos clientes | Essencial |


## Requisitos Não Funcionais
A tabela a seguir contém a relação com os Requisitos Não Funcionais identificados, contendo identificador, nome, descrição e prioridade:

| IDENTIFICADOR | CATEGORIA | DESCRIÇÃO |
|:---|:---|:---|
| RNF-01 | Desempenho | O tempo de carregamento de qualquer página não deve exceder 3 segundos. |
| RNF-02 | Desempenho | A função de busca deve retornar resultados em até 2 segundos, mesmo com 10.000 serviços cadastrados. |
| RNF-03 | Segurança | Senhas devem ser armazenadas com algoritmo de hash seguro (ex: bcrypt). |
| RNF-04 | Segurança | O sistema deve estar em conformidade com a LGPD. |
| RNF-05 | Segurança | Toda comunicação deve ser via HTTPS. |
| RNF-06 | Usabilidade | Um novo prestador deve conseguir publicar seu primeiro serviço em até 5 minutos após o cadastro. |
| RNF-07 | Usabilidade | A plataforma deve ser responsiva (desktop, tablet, smartphone). |
| RNF-08 | Disponibilidade | O sistema deve estar acessível 99,5% do tempo (máx. 44h de inatividade/ano). |
| RNF-09 | Confiabilidade | Falha na API da Receita Federal não deve impedir cadastro, que ficará “Pendente de Validação”. |
| RNF-10 | Escalabilidade | O sistema deve suportar até 1.000 usuários simultâneos sem perda significativa de desempenho. |
| RNF-11 | Manutenibilidade | O código deve seguir clean code e ter cobertura de testes automatizados ≥ 70% em funções críticas. |
| RNF-12 | Compatibilidade | O sistema deve ser compatível com navegadores modernos e Android/iOS recentes. |


# Prototipagem

## Fluxo Principal Munícipe

![1_Cadastro](img/prototipo/municipe/1_cadastro.png)
![2_Login](img/prototipo/municipe/2_login_municipe.png)
![3_home](img/prototipo/municipe/3_página_home.png)
![4_coleta](img/prototipo/municipe/4_página_coleta.png)
![5_demanda](img/prototipo/municipe/5_demanda.png)
![6_endereço](img/prototipo/municipe/6_endereço_demanda.png)
![7_meus_pedidos](img/prototipo/municipe/7_meus_pedidos.png)
![8_pedido_finalizado](img/prototipo/municipe/8_pedido_finalizado.png)
![9_pedido_andamento](img/prototipo/municipe/9_pedido_andamento.png)
![10_pedido_finalizado](img/prototipo/municipe/10_pedido_finalizado.png)
![11_perfil](img/prototipo/municipe/11_perfil.png)


## Fluxo Administrador


![1_administrador_login](img/prototipo/administrador/1_administrador_login.png)
![2_dashboard_administrador](img/prototipo/administrador/2_dashboard_administrador.png)
![3_adicionar_colaborador](img/prototipo/administrador/3_adicionar_colaborador.png)
![4_adicionar_operador](img/prototipo/administrador/4_adicionar_operador.png)
![ 5_adicionar_empresa_terceirizada](img/prototipo/administrador/5_adicionar_empresa_terceirizada.png)


## Fluxo Secretaria


![1_login_secretaria](img/prototipo/secretaria/1_login_secretaria.png)
![2_secretaria_semosp](img/prototipo/secretaria/2_secretaria_semosp.png)
![3_analise_de_pedido](img/prototipo/secretaria/3_analise_de_Pedido.png)
![ 4_motivo_rejeicao](img/prototipo/secretaria/4_motivo_rejeicao.png)


## Fluxo Operador


![1_login_operador](img/prototipo/operador/1_login_operador.png)
![2_home_operador](img/prototipo/operador/2_home_operador.png)
![3_recebidas](img/prototipo/operador/3_recebidas.png)
![4_resolucao_demanda](img/prototipo/operador/4_resolucao_demanda.png)
![5_concluidas](img/prototipo/operador/5_concluidas.png)
![6_demanda_resolvida](img/prototipo/operador/6_demanda_resolvida.png)

[ [INÍCIO](#projeto-de-software) ]

# Diagrama de Atividades
![Diagrama de Atividades](img/diagramas/atividades/diagrama_atv.jpg)

# Diagrama de Sequência
![Diagrama de Sequência(Administrador)](img/diagramas/sequencia/usuario_administrador.png)
![Diagrama de Sequência(Colaborador)](img/diagramas/sequencia/usuario_colaborador.png)
![Diagrama de Sequência(Operador)](img/diagramas/sequencia/usuario_operador_.png)
![Diagrama de Sequência(Munícipe)](img/diagramas/sequencia/usuario_padrao.png)

# Diagrama de Classes
![Diagrama de Classes](img/diagramas/classes/diagrama_de_classes.png)

# Diagrama de Casos de Uso
![Casos de uso](img/diagramas/casos_de_uso/casos_de_uso.jpeg)

## Descrição / Especificação dos Casos de Uso

### UC-01 - Realizar Cadastro

|UC-01 - Realizar Cadastro|           
|:---|
|**Descrição/Objetivo:** O caso de uso inicia-se quando um novo usuário deseja se cadastrar no sistema para realizar as demandas.|
|**Atores: Usuário, Sistema**|
|**Pré-condições:** Usuário não deve estar cadastrado no sistema.|
|**Pós-condições:** Usuário cadastrado com sucesso, podendo acessar o sistema com suas credenciais.|
|**FLUXO PRINCIPAL / BÁSICO:**|
|1. Usuário acessa a página de cadastro. |
|2. O sistema solicita informações pessoais (Nome civil completo, data nascimento, CPF, gênero endereço).|
|3. Usuário informa os dados solicitados.|
|4. O sistema solicita que o usuário crie um Email e senha.|
|5. Usuário cria e confirma o email e a senha.|
|6. O sistema valida as informações.|
|7. O sistema armazena os dados e confirma o cadastro.|
|8. Cadastro finalizado com sucesso|
|**FLUXOS ALTERNATIVOS / EXCESSÕES:** |
|**A1: Erro na validação dos dados:** |
|1. Se os dados fornecidos estiverem incorretos ou incompletos, o sistema informa ao usuário.|
|2. Usuário corrige os dados e reenvia.|
|3. O sistema retorna ao passo 6.|
|**A2: E-mail já cadastrado:** |
|1. Se o e-mail informado já existir no sistema, o sistema notifica o usuário.|
|2. O usuário pode optar por recuperar a senha ou utilizar um e-mail diferente.|

### UC-02 - Solicitar Demanda

|UC-02 - Solicitar Demanda|           
|:---|
|**Descrição/Objetivo:** O caso de uso inicia-se quando um usuário deseja acessar o sistema utilizando suas credenciais previamente cadastradas.|
|**Atores: Usuário, sistema**|
|**Pré-condições:** Usuário deve estar previamente cadastrado no sistema.|
|**Pós-condições:** Usuário autenticado com sucesso e redirecionado para página home do sistema.|
|**FLUXO PRINCIPAL / BÁSICO:**|
|1. Usuário acessa a página de login. |
|2. O sistema solicita e-mail/cpf e senha.|
|3. Usuário informa as credenciais.|
|4. O sistema valida as credenciais.|
|5. O sistema autentica o usuário e redireciona para a página home.|
|6. Login finalizado com sucesso.|
|**FLUXOS ALTERNATIVOS / EXCESSÕES:** |
|**A1: Credenciais incorretas** |
|1. Se o e-mail ou a senha estiverem incorretos, o sistema informa o erro ao usuário.|
|2. Usuário pode tentar novamente ou recuperar a senha.|
|3. O sistema retorna ao passo 2.|
|**A2: Usuário não cadastrado** |
|1. Se o e-mail informado não estiver cadastrado, o sistema notifica o usuário.|
|2. O usuário pode optar por criar uma nova conta.|
|3. O sistema retorna ao passo 2.|
|**A3: Cargos diferentes de usuários** |
|1. Caso o usuário esteja com outro cargo (Operador, Administrador, Secretaria), ele não será direcionado para a página home. |

### UC-03 - Solicitar Demanda

|UC-03 - Solicitar Demanda|           
|:---|
|**Descrição/Objetivo:** O caso de uso inicia-se quando um usuário deseja solicitar uma demanda.|
|**Atores: Usuário, sistema**|
|**Pré-condições:** Usuário deve estar previamente cadastrado no sistema.|
|**Pós-condições:** Solicitação realizada com sucesso, será mandada para a Secretaria para análise.|
|**FLUXO PRINCIPAL / BÁSICO:**|
|1. Usuário seleciona uma das categorias relacionada a sua demanda. |
|2. O sistema direciona o usuário para a página de demanda com subcategorias, especificando melhor o tipo de demanda|
|3. Usuário seleciona uma subcategoria e seleciona a opção "abrir pedido".|
|4. O sistema mostra um pop-up com as informações para serem preenchidas pelo usuário, em relação a demanda.|
|5. Usuário preenche as informações necessárias.|
|6. O sistema mostra um pop-up com as informações de endereço para serem preenchidas pelo usuário.|
|7. Usuário preenche as informações de endereço e seleciona a opção de enviar pedido|
|8. O sistema envia a demanda para a Secretaria.|
|**FLUXOS ALTERNATIVOS / EXCESSÕES:** |
|**A1: Informações incorretas** |
|1. Se o usuário colocou uma informação errada no passo 4, ele pode selecionar a opção de "voltar" para mudar as informações.|
|2. O sistema retorna ao passo 4.|

### UC-04 - Registrar Feedback

|UC-04 - Registrar Feedback|           
|:---|
|**Descrição/Objetivo:** O caso de uso inicia-se quando um usuário deseja registrar um feedback sobre sua demanda, seja para elogios, sugestões ou reclamações.|
|**Atores: Usuário, Sistema**|
|**Pré-condições:** Usuário deve estar autenticado no sistema.|
|**Pós-condições:** Feedback registrado com sucesso e disponível para análise pela equipe responsável.|
|**FLUXO PRINCIPAL / BÁSICO:**|
|1. Usuário acessa a página meus pedidos |
|2. O sistema redireciona o usuário para a página "Meus pedidos" que contém todas as demandas feitas pelo usuário.|
|3. Usuário seleciona a demanda que gostaria de enviar o seu feedback.|
|4. O sistema solicita que o usuário escreva um texto de avaliação|
|5. Usuário preenche o texto sobre sua demanda.|
|6. O sistema solicita que o usuário dê uma avaliaçao de 1 a 5 estrelas.|
|7. Usuário preenche a avaliação de estrela de acordo com sua satisfação.|
|8. O sistema armazena e envia o feedback para a secretaria responsável.|
|9. Feedback registrado com sucesso e exibida uma mensagem de confirmação.|
|**FLUXOS ALTERNATIVOS / EXCESSÕES:** |
|**A1: Registro de feedback não obrigatório** |
|1. Caso o usuário não deseje registrar um feedback, não é uma função obrigatória|

### UC-05 - Analisar Demanda

|UC-05 - Analisar Demanda|           
|:---|
|**Descrição/Objetivo:** O caso de uso inicia-se quando um colaborador deseja analisar uma demanda enviada por um usuário, podendo aceitá-la ou recusá-la. Se aceita, a demanda deve ser delegada a um operador para solução.|
|**Atores: Colaborador (representante de cada secretaria), Sistema**|
|**Pré-condições:** O colaborador deve estar autenticado no sistema, deve haver demandas pendentes para análise.|
|**Pós-condições:** A demanda é analisada e classificada como aceita ou recusada.|
|**FLUXO PRINCIPAL / BÁSICO:**|
|1. Colaborador acessa a página de análise de demandas. |
|2. O sistema exibe a lista de demandas pendentes.|
|3. Colaborador seleciona uma demanda para análise.|
|4. O sistema exibe os detalhes da demanda e uma lista de operadores disponíveis.|
|5. Colaborador decide se aceita ou recusa a demanda.|
|6. O sistema registra a decisão e atualiza o status da demanda.|
|7. Caso aceita, o colaborador seleciona um operador e envia a demanda |
|8. O sistema registra a delegação e notifica o operador| 
|**FLUXOS ALTERNATIVOS / EXCESSÕES:** |
|**A1: Rejeição de demanda** |
|1. Caso o colaborador rejeite a demanda, o mesmo deve explicar o motivo da rejeição|

### UC-06 - Resolução de Demanda

|UC-06 - Resolução de Demanda|           
|:---|
|**Descrição/Objetivo:**  O caso de uso inicia-se quando um operador finaliza a execução de uma demanda e precisa registrar a resolução no sistema.|
|**Atores: Operador, Sistema**|
|**Pré-condições:** O operador deve estar autenticado no sistema, a demanda deve ter sido previamente delegada ao operador.|
|**Pós-condições:** A demanda é marcada como resolvida, o registro da resolução, incluindo foto e descrição, é salvo no sistema e as informações retornam para o usuário.|
|**FLUXO PRINCIPAL / BÁSICO:**|
|1. Operador acessa a lista de demandas atribuídas. |
|2. O sistema exibe as demandas em andamento.|
|3. Operador seleciona a demanda que foi resolvida.|
|4. O sistema abre a tela de resolução de demanda.|
|5. Operador anexa uma foto da resolução.|
|6. Operador insere uma descrição do serviço realizado.|
|7. Operador confirma a finalização da demanda. |
|8. O sistema salva as informações e marca a demanda como resolvida.|
|9. O sistema envia as informações de volta para o munícipe que fez o pedido da demanda. | 
|**FLUXOS ALTERNATIVOS / EXCESSÕES:** |
|**A1: Falta de foto ou descrição** |
|1. Se o operador tentar finalizar sem anexar foto ou descrição, a resolução não é enviada.|
|2. O operador deve preencher os campos obrigatórios antes de continuar.|
|3. O sistema retorna ao passo 5.|

### UC-07 - Atribuição de Cargos

|UC-07 - Atribuição de Cargos|           
|:---|
|**Descrição/Objetivo:** O caso de uso inicia-se quando um administrador precisa atribuir ou alterar o cargo de um usuário no sistema.|
|**Atores: Administrador, Sistema**|
|**Pré-condições:** O administrador deve estar autenticado no sistema,o usuário que receberá o cargo deve estar previamente cadastrado.|
|**Pós-condições:** O usuário recebe um novo cargo e suas permissões são ajustadas conforme o perfil atribuído.|
|**FLUXO PRINCIPAL / BÁSICO:**|
|1. Administrador acessa a página home do administrador. |
|2. Administrador seleciona o tipo de usuário que gostaria de adicionar(colaborador, operador).|
|3. O sistema exibe um formulário para  o administrador informar o email e o cpf do usuário que receberá o cargo|
|4. O usuário preenche as informações e seleciona o botão para envia-las.|
|5. O sistema registra a alteração e atualiza as permissões do usuário.| 
|**FLUXOS ALTERNATIVOS / EXCESSÕES:** |
|**A1: Usuário já possui o cargo desejado** |
|1. Se o usuário já estiver com o cargo selecionado, o sistema não realiza a alteração |
|**A2: Usuário não encontrado ou informações incorretas:** |
|1. Se o usuário não existir no sistema ou as informações estiverem incorretas, o sistema exibe uma mensagem de erro.|
|2. O administrador pode revisar os dados inseridos e tentar novamente.|
|3. O sistema retorna ao passo 3.|

[ [INÍCIO](#projeto-de-software) ]

# REFERÊNCIAS

Esta subseção apresenta as referências aos documentos que utilizamos no auxílio à construção deste documento.
* [UML](https://www.omg.org/spec/UML/2.5/About-UML/)
* [Práticas para Especificação de Requisitos IEEE-830](https://ieeexplore.ieee.org/document/720574)
