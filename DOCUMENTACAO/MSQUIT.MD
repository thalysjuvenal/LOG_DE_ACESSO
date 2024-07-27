# Função MSQUIT()

## Contexto e Propósito:

A função é usada para registrar detalhes do logoff ou saída completa de um usuário do sistema. Isso é importante para auditoria, segurança e monitoramento do uso do sistema.

#### Variáveis Locais:

**lLogoff:** Indica se a função está sendo chamada por um logoff (.T.) ou uma saída completa (.F.).\
**cDatabase, cIp, cAlias, cPort:** Detalhes de configuração do banco de dados, incluindo tipo, IP do servidor, alias, e porta.

### Operações Realizadas:

**Obtenção de Configurações:** Inicialmente, as configurações do banco de dados são obtidas. Se não estiverem disponíveis, são recuperadas de uma fonte alternativa.\
**Conexão e Registro:** Se é um logoff (lLogoff == .T.), a função se conecta ao banco de dados, seleciona a tabela ZZL e registra informações sobre o logoff, incluindo detalhes do usuário, ambiente, e sistema.
Se é uma saída completa, e o módulo não é "MPSDU", a função realiza operações semelhantes, mas marca o evento como "ENCERROU TOTALMENTE DO SISTEMA".\
**Fechamento de Conexão:** Após o registro, a conexão com o banco é fechada.

## Descrição
A função `MSQUIT()` é responsável por registrar informações sobre o processo de saída ou logoff dos usuários do sistema. Ela é usada para criar registros detalhados que podem ser utilizados para auditoria, segurança e monitoramento do uso do sistema.

## Funcionamento
A função coleta informações contextuais e do sistema durante o logoff ou saída completa de um usuário, armazenando esses dados na tabela `ZZL`. Dependendo da situação (logoff parcial ou saída completa), ela registra diferentes detalhes.

## Campos Registrados
Os campos registrados na tabela `ZZL` incluem:

- **ZZL_FILIAL:** Identificação da filial.
- **ZZL_EMP:** Identificação da empresa.
- **ZZL_FIL:** Identificação da unidade da empresa.
- **ZZL_ID:** Identificação do usuário.
- **ZZL_NAME:** Nome do usuário, obtido pela função `UsrRetName(__cUserId)`.
- **ZZL_AMB:** Ambiente do servidor, obtido pela função `GetEnvServer()`.
- **ZZL_IP:** Endereço IP do cliente, obtido pela função `GetClientIP()`.
- **ZZL_DATA:** Data da operação, obtida pela função `MsDate()`.
- **ZZL_HORA:** Hora da operação, obtida pela função `Time()`.
- **ZZL_COMP:** Nome do computador, obtido pela função `GetComputerName()`.
- **ZZL_ROTINA:** Descrição do evento (ex. "EFETUOU LOGOFF DO SISTEMA" ou "ENCERROU TOTALMENTE DO SISTEMA").
- **ZZL_MODULO:** Módulo do sistema.
- **ZZL_XNU:** Identificador do evento (ex. "LOGOFF" ou "ENCERROU").
- **ZZL_DSEMAN:** Dia da semana, obtido pela função `Semana()`.
- **ZZL_DATABA:** Base de dados.
- **ZZL_MEMORI:** Memória usada pela thread, convertida para caractere (`cValToChar(_GetThreadUsedMem())`).

## Dependências
- Função `GetPvProfString()`
- Função `GetEnvServer()`
- Função `GetClientIP()`
- Função `MsDate()`
- Função `Time()`
- Função `GetComputerName()`
- Função `Semana()`
- Função `UsrRetName(__cUserId)`
- Função `cValToChar(_GetThreadUsedMem())`

## Observações
- A função faz uso do comando `Reclock()` para garantir a integridade dos dados ao escrever na tabela `ZZL`.
- Dependendo da condição de logoff ou saída, diferentes detalhes são registrados.
- A função fecha adequadamente a conexão com o banco de dados após a operação.

## Exemplo de Uso
A função é acionada automaticamente durante o processo de logoff ou encerramento do sistema, garantindo que todas as ações sejam registradas para posterior auditoria.