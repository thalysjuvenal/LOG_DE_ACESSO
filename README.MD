# Projeto Log de Acesso

Este projeto tem como objetivo registrar os logs de acesso no sistema ERP Protheus. Ele foi desenvolvido para garantir o monitoramento detalhado das atividades dos usuários, incluindo operações de inclusão, alteração, exclusão e visualização realizadas em diferentes módulos do sistema.

## Módulos Afetados

Todos os módulos do sistema ERP Protheus são monitorados por este projeto. As entradas para registrar logs de acesso estão integradas em pontos específicos dos módulos, garantindo a captura de dados relacionados às seguintes ações:

- **Inclusão:** Registro de novas informações ou dados no sistema.
- **Alteração:** Modificação de informações ou dados existentes.
- **Exclusão:** Remoção de informações ou dados do sistema.
- **Visualização:** Acesso a informações ou dados sem alterações.
- **Demais Ações:** Outras ações a serem selecionadas.

> **Nota:** O sistema de logs registra apenas a ocorrência das ações (inclusão, alteração, exclusão e visualização). **Não são registrados detalhes específicos sobre quais campos foram preenchidos ou alterados durante essas ações.**

## Gravação dos Registros no Banco de Dados

Para gravar os registros no banco de dados, é necessário executar os utilitários **UPDDISTR** ou **UPDBATCH**. Os artefatos necessários para essa operação estão disponíveis no seguinte caminho: [Artefatos de Atualização](https://github.com/thalysjuvenal/LOG_DE_ACESSO/tree/main/upd).

### Documentação dos Códigos Fontes

A documentação detalhada dos códigos fontes utilizados neste projeto está disponível nos seguintes links:

- [CHKEXEC](https://github.com/thalysjuvenal/LOG_DE_ACESSO/blob/main/DOCUMENTACAO/CHKEXEC.MD): Documentação do módulo de verificação de execução.
- [MSQUIT](https://github.com/thalysjuvenal/LOG_DE_ACESSO/blob/main/DOCUMENTACAO/MSQUIT.MD): Documentação do módulo de encerramento de sessão.
- [SduLogin](https://github.com/thalysjuvenal/LOG_DE_ACESSO/blob/main/DOCUMENTACAO/SDULOGIN.MD): Documentação do módulo de login de usuários.
- [SduLogout](https://github.com/thalysjuvenal/LOG_DE_ACESSO/blob/main/DOCUMENTACAO/SDULOGOUT.MD): Documentação do módulo de logout de usuários.
- [MBRWBTN](https://github.com/thalysjuvenal/LOG_DE_ACESSO/blob/main/DOCUMENTACAO/MBRWBTN.MD): Documentação do módulo de botão de execução.
- [LOGACCESS](https://github.com/thalysjuvenal/LOG_DE_ACESSO/blob/main/DOCUMENTACAO/LOGACCESS.MD): Documentação geral do registro de logs de acesso.
