# Função MBRWBTN()

## Contexto e Propósito:
A função `MBrwBtn()` é usada para criar um registro de log detalhado quando um usuário realiza uma ação de menu específica no sistema. 

#### Variáveis Locais:

**aArea:** Armazena o contexto atual do sistema, que é salvo no início da função e restaurado no final, garantindo que o estado original do sistema seja preservado.\
**lRetorno:** Inicializa como verdadeiro (.T.), indicando que a operação foi bem-sucedida.\
**cAliasAtu, nRecNoAtu, nOpcaMenu, cFuncMenu:** Variáveis que recebem parâmetros de entrada, representando o alias atual, o número de registro, a opção de menu e a função de menu, respectivamente.\
**cIdMenu:** Obtém o identificador do menu atual usando a função `FWGetMnuFile()`.\

## Descrição
A função `MBrwBtn()` é utilizada para registrar informações detalhadas sobre ações de menu realizadas pelos usuários no sistema. Esse registro é feito para fins de auditoria, rastreamento de atividades e análise de uso.

## Funcionamento
A função captura uma série de informações contextuais e de sistema, armazenando-as na tabela `ZZL`. Isso inclui detalhes sobre o usuário, o ambiente, o sistema, e a operação realizada.

## Campos Registrados
Abaixo estão os campos que são registrados na tabela `ZZL` por esta função:

- **ZZL_FILIAL:** Identificação da filial.
- **ZZL_EMP:** Identificação da empresa.
- **ZZL_FIL:** Identificação da unidade da empresa.
- **ZZL_ID:** Identificação do usuário.
- **ZZL_NAME:** Nome do usuário, obtido pela função `UsrRetName(__cUserId)`.
- **ZZL_AMB:** Ambiente do servidor obtido pela função `GetEnvServer()`.
- **ZZL_IP:** Endereço IP do cliente obtido pela função `GetClientIP()`.
- **ZZL_DATA:** Data da ação obtida pela função `MsDate()`.
- **ZZL_HORA:** Hora da ação obtida pela função `Time()`.
- **ZZL_COMP:** Nome do computador obtido pela função `GetComputerName()`.
- **ZZL_ROTINA:** Nome da rotina em execução obtido pela função `FunName()`.
- **ZZL_MODULO:** Módulo do sistema.
- **ZZL_XNU:** Identificador do menu, com formatação removida de espaços (`Alltrim(cIdMenu)`).
- **ZZL_DSEMAN:** Dia da semana obtido pela função `Semana()`.
- **ZZL_DATABA:** Base de dados.
- **ZZL_MEMORI:** Memória usada pela thread, convertida para caractere (`cValToChar(_GetThreadUsedMem())`).
- **ZZL_ALIASD:** Alias do contexto atual.
- **ZZL_NRECNO:** Número do registro.
- **ZZL_NOPCME:** Opção do menu selecionada.
- **ZZL_CFUNMN:** Função do menu.

## Dependências
- Função `FWGetArea()`
- Função `FWGetMnuFile()`
- Função `UsrRetName(__cUserId)`
- Função `GetEnvServer()`
- Função `GetClientIP()`
- Função `MsDate()`
- Função `Time()`
- Função `GetComputerName()`
- Função `FunName()`
- Função `Semana()`
- Função `cValToChar(_GetThreadUsedMem())`

## Observações
- A função utiliza o comando `Reclock()` para garantir a consistência dos dados durante a operação de escrita.
- Após a atualização dos dados, a tabela é desbloqueada com o comando `MsUnlock()`.
- O estado original do sistema é restaurado no final da função através do comando `FWRestArea(aArea)`.

## Exemplo de Uso
A função `MBrwBtn()` é chamada automaticamente pelo sistema quando o usuário realiza uma ação de menu. Isso garante que todas as atividades sejam registradas para posterior auditoria.