# REQUISITOS



## CARACTERÍSTICAS DOS REQUISITOS

| CARACTERÍSTICA | DESCRIÇÃO |
|---|---|
|Correção|Uma especificação de requisitos é correta se todo requisito presente nela é realmente um requisito de produto a ser construído.|
|Precisão|Uma especificação de requisitos é precisa se todo requisito presente possuir apenas uma única interpretação e todos os requisitos são entendidos pelas partes interessadas da mesma forma.|
|Completude|Uma especificação de requisitos é completa se reflete todas as decisões de especificação que foram tomadas, sem pendências.|
|Consistência|Uma especificação de requisitos é consistente se não há conflitos entre nenhum dos subconjuntos de requisitos presentes, como ordem temporal diferente e nomes diversos que designam a mesma informação.|
|Priorização|Requisitos devem ser priorizados de acordo com a importância (essencial ou opcional) e a estabilidade (probabilidade de alteração no requisito, de acordo com experiências anteriores).|
|Verificabilidade|Deve ser possível atestar a conformidade do produto final aos requisitos, por meio de um processo de verificação. Requisitos ambíguos e qualitativos não são verificáveis.|
|Modificabilidade|Uma especificação de requisitos é modificável se sua estrutura e estilo permitem a mudança de qualquer requisito, de forma fácil, completa e consistente.|
|Rastreabilidade|Uma especificação de requisitos é rastreável se permite a fácil determinação dos antecedentes e consequências de todos os requisitos. Deve ser possível localizar um requisito.|

## BOAS PRÁTICAS (IEEE 830-1998)

- Linguagem clara e não ambígua: escrever requisitos usando termos objetivos; evitar palavras vagas como “rápido”, “fácil”, “geralmente”. Preferir formas normativas como “DEVE”, “NÃO DEVE”, “DEVERÁ”. Manter um glossário.
- Requisitos verificáveis: todo requisito deve ser mensurável e testável. Ex.: “95% das transações DEVEM completar em até 2s; 100% em até 5s”.
- Completude com tratamento de TBD = To Be Determined (informação ainda não definida): evitar “TBD”. Quando inevitável, documentar motivo, responsável e prazo para resolução.
- Consistência e não redundância: evitar conflitos e duplicações. Se houver redundância para legibilidade, incluir referências cruzadas.
- Separação do “o quê” e “como”: o SRS descreve comportamentos observáveis (o quê). Decisões de projeto (como) ficam fora dos requisitos, salvo restrições necessárias (p. ex., segurança, conformidade).
- Priorização e estabilidade: classificar por importância (Essencial, Condicional, Opcional) e por estabilidade (Alta, Média, Baixa).
- Rastreabilidade bidirecional: manter ligações para trás (origem: entrevistas, regulamentos, UC) e para frente (testes, componentes, telas). Recomenda-se uma matriz de rastreabilidade viva.
- Modificabilidade e organização: manter estrutura navegável (sumário, índice), seção única por requisito e histórico de mudanças.

## IDENTIFICAÇÃO DOS REQUISITOS

- Padrão de identificação: `RF-XXX` para Requisitos Funcionais e `RNF-XXX` para Requisitos Não Funcionais, com numeração sequencial de três dígitos (ex.: `RF-003`).
- Campos recomendados por requisito: ID, Título, Descrição, Prioridade (Essencial/Condicional/Opcional), Estabilidade (Alta/Média/Baixa), Critério de Verificação (como será testado/medido), Origem (UC/entrevista/regulamento), Rastreabilidade (UC, telas, testes), Status (Proposto/Aprovado/Implementado/Testado).
- Exemplo de referência: “RF-003 — Solicitação de Demandas”.
