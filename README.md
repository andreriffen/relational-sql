# Exercício de Banco de Dados - Exemplos

- 📊📈💾

![Imagem de Banco de Dados]([URL_DA_SUA_IMAGEM](https://github.com/andreriffen/relational-sql/blob/main/sql.jpg))

Bem-vindo ao repositório do **Exercício de Banco de Dados - Exemplos**. Este é um projeto introdutório que cria um banco de dados chamado "exemplos" com duas tabelas, "pessoas" e "telefones", para ilustrar a relação entre entidades em um sistema de gerenciamento de banco de dados relacional.

## ℹ️ Descrição

Neste exercício, estamos criando um banco de dados chamado "exemplos" com duas tabelas, "pessoas" e "telefones", para demonstrar a relação entre entidades em um sistema de gerenciamento de banco de dados relacional. A tabela "pessoas" armazena informações individuais, como nomes e endereços de e-mail, com um identificador exclusivo para cada pessoa. A tabela "telefones" está relacionada à tabela "pessoas" por meio de uma chave estrangeira, permitindo associar números de telefone a pessoas específicas. Isso destaca a capacidade do banco de dados em estabelecer conexões entre diferentes tabelas, criando uma estrutura eficiente para armazenar informações inter-relacionadas, um conceito fundamental em bancos de dados relacionais.

## ⚙️ Tabelas

### Tabela: Pessoas

A tabela "pessoas" armazena informações individuais, como nomes e endereços de e-mail, com um identificador único para cada pessoa.

Campos da tabela "pessoas":
- `id` (Chave Primária): Identificador único de cada pessoa.
- `nome`: Nome da pessoa.
- `email`: Endereço de e-mail da pessoa.

### Tabela: Telefones

A tabela "telefones" está relacionada à tabela "pessoas" por meio de uma chave estrangeira, permitindo associar números de telefone a pessoas específicas.

Campos da tabela "telefones":
- `id` (Chave Primária): Identificador único de cada número de telefone.
- `numero`: Número de telefone.
- `pessoa_id` (Chave Estrangeira): Referência à pessoa associada a este número de telefone.

Esse é um conceito fundamental em bancos de dados relacionais, onde a organização e a relação entre dados desempenham um papel crucial.

## 👨‍💻 Instruções de Uso

Forneça aqui quaisquer instruções adicionais sobre como utilizar o banco de dados "exemplos" ou exemplos de consultas SQL.

## 📜 Autor

- 2023 ©️ **Andre Riffen** - [Perfil GitHub](https://github.com/andreriffen)

## 📄 Licença

Este projeto está sob a Licença MIT (Pode clonar!).

Não se preocupe quanto à licença, este projeto é apenas um exercício. Você pode copiar, modificar e remixar à vontade!

