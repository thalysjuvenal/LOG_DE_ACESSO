# Classe LOGACCESS

### Funcionalidade Principal
**Class LOGACCESS:** Define uma API RESTful para operações de consulta relacionadas ao acesso de usuários.\
**Método New():** Construtor da classe que retorna a própria instância (Self).
**Método consult_id():** Método associado ao endpoint GET /api/administration/consult/id/:id, que permite consultar os detalhes de um usuário específico no sistema.\

### Detalhamento do Método consult_id()

#### Entrada:

O método recebe o ID do usuário como parte da URL `(/api/administration/consult/id/:id)`.
Extrai o ID do usuário (cUsrID) dos parâmetros da URL.\

#### Processo:
Realiza uma consulta SQL na tabela ZZL para buscar registros associados ao ID do usuário.
Se o usuário for encontrado, os detalhes são armazenados em um objeto JSON (jResponse['usuarios']), incluindo informações como filial, empresa, ambiente, IP, data e hora do login, rotina, módulo, menu, e outras informações relevantes.
Se o usuário não for encontrado, retorna um erro com mensagem e solução.

#### Saída:

Retorna um objeto JSON com os detalhes do usuário ou uma mensagem de erro se o usuário não for encontrado.

## Descrição
A classe `LOGACCESS` fornece uma interface para consultar registros de usuários através de uma API RESTful. Esta classe é especialmente útil para auditar e monitorar o acesso de usuários no sistema.

## Funcionalidades

### Método `New()`
Este é o construtor da classe `LOGACCESS`, que inicializa a instância da classe e retorna o próprio objeto (`Self`).

### Método `consult_id()`
Este método é associado ao endpoint GET `/api/administration/consult/id/:id` e permite consultar detalhes de um usuário específico com base no ID fornecido na URL.

#### Entrada
- **ID do usuário:** Obtido dos parâmetros da URL.

#### Processo
- Realiza uma consulta na tabela `ZZL` para buscar informações associadas ao ID do usuário.
- Gera um objeto JSON com os detalhes do usuário, incluindo:
  - Filial
  - Empresa
  - Identificação do usuário
  - Nome do usuário
  - Ambiente do servidor
  - Endereço IP do cliente
  - Data e hora do login
  - Nome do computador
  - Rotina
  - Módulo
  - Menu
  - Dia da semana
  - Base de dados

#### Saída
- Um objeto JSON contendo os detalhes do usuário.
- Em caso de erro ou se o usuário não for encontrado, retorna uma mensagem de erro com uma descrição e solução sugerida.

## Exemplo de Uso
A API pode ser acessada através de um cliente HTTP, passando o ID do usuário na URL para obter as informações detalhadas sobre o acesso do usuário.

`https://enderecosite.com.br/rest/api/administration/consult/id/000000`
