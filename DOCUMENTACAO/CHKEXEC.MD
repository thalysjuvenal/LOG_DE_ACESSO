# Função CHKEXEC

## Descrição
A função `CHKEXEC()` é utilizada para registrar informações detalhadas sobre uma operação ou execução específica realizada no sistema. Este registro é essencial para auditoria, rastreamento de atividades e monitoramento do uso do sistema.

## Funcionamento
A função coleta uma série de informações contextuais e de sistema, que são armazenadas na tabela `ZZL`. As informações registradas incluem detalhes sobre o usuário, o ambiente, o sistema e a operação realizada.

## Campos Registrados
Abaixo estão os campos que são atualizados na tabela `ZZL` por esta função:

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
- **ZZL_ROTINA:** Nome da rotina ou ação, passado como parâmetro `ParamIxb`.
- **ZZL_MODULO:** Módulo do sistema.
- **ZZL_XNU:** Identificador do menu, formatado sem espaços (`Alltrim(cIdMenu)`).
- **ZZL_DSEMAN:** Dia da semana, obtido pela função `Semana()`.
- **ZZL_DATABA:** Base de dados.
- **ZZL_MEMORI:** Memória usada pela thread, convertida para caractere (`cValToChar(_GetThreadUsedMem())`).

## Dependências
- Função `FWGetMnuFile()`
- Função `UsrRetName(__cUserId)`
- Função `GetEnvServer()`
- Função `GetClientIP()`
- Função `MsDate()`
- Função `Time()`
- Função `GetComputerName()`
- Função `Semana()`
- Função `cValToChar(_GetThreadUsedMem())`

## Observações
- A função utiliza o comando `Reclock()` para garantir a integridade dos dados ao escrever na tabela `ZZL`.
- Após a operação, a tabela é desbloqueada com o comando `MsUnlock()`.
- A função retorna um valor booleano (`lRet`) que indica o sucesso da operação.

## Exemplo de Uso
A função `CHKEXEC()` é chamada durante execuções no sistema, garantindo que todas as ações sejam devidamente registradas para posterior auditoria e análise.