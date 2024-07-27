# Função SduLogin()

## Contexto e Propósito:

A função `SduLogout()` é utilizada para criar um registro no banco de dados sempre que um usuário realiza o logout do sistema. Este registro é crucial para auditoria e segurança, permitindo rastrear acessos e ações dos usuários.

#### Variáveis Locais:

**lRet:** Indica o sucesso da operação, inicializando como verdadeiro (.T.).\
**cUser:** Armazena o ID do usuário que está realizando o logout.\
**cDatabase, cIp, cAlias, cPort:** Informações de configuração do banco de dados, incluindo tipo, endereço IP do servidor, alias e porta.

### Operações Realizadas:

**Obtenção de Configurações:** A função tenta obter as configurações de banco de dados do ambiente atual. Se estas não estiverem disponíveis, busca as informações em uma configuração alternativa chamada DBAccess.\
**Conexão com Banco de Dados:** Conecta-se ao banco de dados usando as informações de configuração obtidas.

**Registro de Informações:**
Verifica se a tabela ZZL já está aberta e, se necessário, a fecha.\
Usa dbUseArea para abrir a tabela ZZL990 como ZZL. Registra informações detalhadas sobre o usuário e o ambiente, incluindo o ID do usuário, nome, IP, data e hora do logout, nome do computador, e outros detalhes relevantes.\
**Fechamento de Conexão:** Após o registro, a função fecha a conexão com o banco de dados.


## Descrição
A função `SduLogin()` é responsável por registrar informações detalhadas sobre o processo de login dos usuários no sistema. Este registro é fundamental para auditoria, segurança e monitoramento do uso do sistema.

### Ponto de Entrada no APSDU
A função `SduLogin()` é um ponto de entrada executado durante o login na ferramenta APSDU. Ela permite que o sistema execute procedimentos relacionados ao evento de entrada no módulo, como validações de permissão de acesso ou outras operações de inicialização necessárias.

## Funcionamento
A função coleta informações contextuais e do sistema durante o login de um usuário e as armazena na tabela `ZZL`. Isso inclui detalhes como identificação do usuário, informações do ambiente e do sistema, e outros dados relevantes para auditoria e segurança.

## Campos Registrados
Os campos registrados na tabela `ZZL` incluem:

- **ZZL_FILIAL:** Identificação da filial (inicialmente vazio).
- **ZZL_EMP:** Identificação da empresa (inicialmente vazio).
- **ZZL_FIL:** Identificação da unidade da empresa (inicialmente vazio).
- **ZZL_ID:** Identificação do usuário, obtida pela função `Alltrim(__cUserId)`.
- **ZZL_NAME:** Nome do usuário, obtido pela função `Alltrim(UsrRetName(__cUserId))`.
- **ZZL_AMB:** Ambiente do servidor, obtido pela função `GetEnvServer()`.
- **ZZL_IP:** Endereço IP do cliente, obtido pela função `GetClientIP()`.
- **ZZL_DATA:** Data do login, obtida pela função `MsDate()`.
- **ZZL_HORA:** Hora do login, obtida pela função `Time()`.
- **ZZL_COMP:** Nome do computador, obtido pela função `GetComputerName()`.
- **ZZL_ROTINA:** Descrição do evento, definido como "LOGIN".
- **ZZL_MODULO:** Módulo do sistema.
- **ZZL_XNU:** Identificador do evento, definido como "APSDU".
- **ZZL_DSEMAN:** Dia da semana, obtido pela função `Semana()`.
- **ZZL_DATABA:** Base de dados.

## Dependências
- Função `GetPvProfString()`
- Função `GetEnvServer()`
- Função `GetClientIP()`
- Função `MsDate()`
- Função `Time()`
- Função `GetComputerName()`
- Função `Semana()`
- Função `UsrRetName(__cUserId)`
- Função `Alltrim()`
- Função `TcLink()`, `TcUnlink()`

## Observações
- A função faz uso do comando `Reclock()` para garantir a integridade dos dados ao escrever na tabela `ZZL`.
- Dependendo da configuração do banco de dados, a função pode buscar informações de diferentes fontes (servidor atual ou configuração `DBAccess`).
- Após a operação, a conexão com o banco de dados é fechada para liberar recursos.

## Documentação Adicional
Para mais informações sobre a funcionalidade `SDULogin`, consulte a [documentação oficial](https://tdn.totvs.com/display/public/framework/SDULogin+-+Entrada+e+acesso) no TOTVS Developer Network.

## Exemplo de Uso
A função é acionada automaticamente durante o processo de login, registrando informações importantes para auditoria e análise de segurança.