# GBD_2024
Arquivos .SQL da disciplina de GBD

# Comandos Básicos

Baseado em https://www.w3schools.com/sql/default.asp

MySQL W3Schools Online: https://www.w3schools.com/mySQl/mysql_editor.asp

Lembrando que é possível utilizar tambẽm o MySQL WorchBench.


##  Para ver todos os BD no servidor
~~~SQL
SHOW DATABASES;
~~~

## Para criar um banco de dados
~~~SQL
CREATE DATABASE o_nome_do_DB;
~~~
Exemplo:
~~~SQL
CREATE DATABASE aula2008;
~~~

## Para ativar uma DB
~~~SQL
USE o_nome_do_DB;
~~~
Exemplo:
~~~SQL
USE aula2008;
~~~

## Vamos criar uma tabela (exemplo para uma lista de alunos)
~~~SQL
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
~~~

~~~SQL
CREATE TABLE Alunos (
    ID int NOT NULL,
    PrimeiroNome varchar(255) NOT NULL,
    SobreNome varchar(255),
    Idade int,
    PRIMARY KEY (ID)
);
~~~

## Para obter os nomes das tabelas no BD

~~~SQL
SHOW TABLES;
~~~

## Para obter informação sobre uma tabela específica
~~~SQL
DESCRIBE o_nome_da_tabela;
~~~

## Para inserir dados na tabela 

~~~SQL
INSERT INTO Alunos (chamada, Nome, Curso, semestre, RA) VALUES (2, "Leonardo" , "SI", 3, 12345);
~~~

Exemplo:
~~~SQL
INSERT INTO Alunos (ID, PrimeiroNome, SobreNome,Idade) VALUES (1, "Leonardo", "Grando", 39);
~~~

## Para ver a tabela toda
~~~SQL
SELECT * FROM Alunos;
~~~

## Para refinar uma Busca
~~~SQL
SELECT chamada,curso FROM alunos;
~~~
Exemplo:
~~~SQL
SELECT PrimeiroNome,Idade FROM Alunos;
~~~

## Para busca de um item especifico
~~~SQL
SELECT * FROM Table
WHERE Column = "item buscado"
~~~
Exemplo:
~~~SQL
SELECT * FROM Alunos
Where PrimeiroNome = "Leonardo"
~~~ 

## Para ordenar uma Tabela:

~~~SQL
SELECT * FROM Alunos
ORDER PrimeiroNome;
~~~ 

~~~SQL
SELECT * FROM Alunos
ORDER PrimeiroNome DESC;
~~~ 


~~~SQL
SELECT * FROM Alunos
ORDER BY PrimeiroNome, SobreNome;
~~~ 

## Para atualizar uma tabela:

~~~SQL
UPDATE <Nome da tabela>
SET <itens que deseja alterar>
WHERE <condição>;
~~~

Exemplo

~~~SQL
UPDATE Alunos
SET Nome = "Joselito", Curso = "EC"
WHERE ID = 1;
~~~

## Atualizar varios registros

~~~SQL
UPDATE Alunos
SET Curso = "EC"
WHERE Semestre = 3;
~~~

### Muito cuidado com a omissão da clausula WHERE, pois assim todos os registros serão atualizados.

## Para adicionar colunas em uma tabela:

~~~SQL
ALTER TABLE <nome_da_tabela>
ADD <nome_da_coluna> <tipo_de_dados> ;
~~~

Exemplo:
~~~SQL
ALTER TABLE Alunos
ADD Email varchar(255)  ;
~~~

## Para remover colunas em uma tabela:

~~~SQL
ALTER TABLE <nome_da_tabela>
DROP COLUMN <nome_da_coluna> ;
~~~

Exemplo:
~~~SQL
ALTER TABLE Alunos
DROP COLUMN Email ;
~~~

## Para alterar o nome de uma coluna de uma tabela:

~~~SQL
ALTER TABLE <nome_da_tabela>
RENAME COLUMN <nome_da_coluna_antigo> <nome_da_coluna_novo> ;
~~~

Exemplo:
~~~SQL
ALTER TABLE Alunos
RENAME COLUMN Telefone Celular;
~~~

## Para alterar o tipo de dados de uma coluna de uma tabela (pode mudar o comando conforme o SGBD):

~~~SQL
ALTER TABLE <nome_da_tabela>
MODIFY COLUMN <nome_da_coluna> <tipo_de_dado_novo> ;
~~~

Exemplo:
~~~SQL
ALTER TABLE Alunos
MODIFY COLUMN Telefone Celular varchar(255) ;
~~~

## Para incluir a funcionalidade de incremento automático da chave primária (Pode mudar conforme o SGBD):

~~~SQL
CREATE TABLE Alunos (
    ID int NOT NULL AUTO_INCREMENT,
    PrimeiroNome varchar(255) NOT NULL,
    SobreNome varchar(255),
    Idade int,
    PRIMARY KEY (ID)
);
~~~

O valor inĩcial do AUTO_INCREMENT é 1 e serã aumentado para 1 a cada inclusão

Para ajustar o valor inicial do AUTO_INCREMENT, pode-se utilizar a clausula ALTER

Exemplo:
~~~SQL
ALTER TABLE Alunos
AUTO_INCREMENT = 20;
~~~

## Para efetuar a entrada de novos dados, você não deve especificar um valor para a coluna da chave primária, jã que será feito de forma automatica.

~~~SQL
INSERT INTO Alunos (PrimeiroNome, SobreNome,Idade) VALUES ("Francisco", "bento", 39);
~~~


## Para remover um registro da Tabela
~~~SQL
DELETE FROM nome_da_tabela WHERE nome_da_coluna = texto_a_ser_removido;
~~~

## Para deletar uma tabela
~~~SQL
DROP TABLES nome_da_tabela;
~~~

## Para deletar um BD
~~~SQL
DROP DATABASE nome_do_BD;
~~~

## índice Primários: 
Definido pela cláusula *PRIMARY KEY* no comando *CREATE TABLE*. define a ordenação física dos registros na tabela e os valor do que campo que será unico (evitar duplicidade)

## índice Secundários: 
São criados para otimizar as consultas com o comando *SELECT*. Não ordenam os registros gravados na tabela, mas são utilizados na sua localização

## Comandos DDL: Data Definition Language - Linguagem de definição de dados

CREATE DATABASE - Cria uma base de dados vazia.

ALTER DATABASE - Permite alterar algumas caracteristicas da base de dados.

DROP DATABASE - Apaga um banco de dados existente.

CREATE TABLE - Cria uma tabela de dados.

ALTER TABLE - Permite alterar estrutura de uma tabela existente.

DROP TABLE - Apaga uma tabela de dados existente.

CREATE INDEX - Cria índices secundários para uma tabela.

DROP INDEX - apaga um índice existente. 

CREATE VIEW - Cria uma visão com base em uma ou mais tabelas.

DROP VIEW - Apaga uma visão existente.

Exemplos de comandos utilizados para definir dados:

~~~SQL
CREATE DATABASE databasename;

DROP DATABASE databasename;

ALTER TABLE table_name ADD new_collumn atribute;
ALTER TABLE table_name DROP remove_collumn;

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

ALTER TABLE table_name
ADD column_name datatype;

DROP TABLE table_name;

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

~~~


## Comandos DML: Data Manipulation Language - Linguagem de Manipulação de dados

INSERT INTO - insere um novo registro na tabela de dados.

DELETE FROM - Apaga registros de uma tabela de dados

UPDATE - Permite que os dados de um registros sejam atualizados.

SELECT FROM - Seleciona um conjunto de registros a partir de uma condiçãoe e retorná-los ao usuário.

Exemplos de comandos utilizados para definir dados:


~~~SQL

INSERT INTO Alunos (PrimeiroNome, SobreNome,Idade) VALUES ("Francisco", "bento", 39);

DELETE FROM nome_da_tabela WHERE nome_da_coluna = texto_a_ser_removido;

UPDATE <Nome da tabela>
SET <itens que deseja alterar>
WHERE <condição>;

SELECT chamada,curso FROM alunos;

~~~

## Digamos que você queira rodar um script sql no terminal:

Após você logar no terminal como por exemplo:

~~~Bash
mysql -u root -p
~~~

e digitar a senha, você pedir para ele rodar um script denominado "exemplo.sql" utilizando a seguinte forma:

~~~SQL
mysql> source <caminho arquivo>/exemplo.sql
~~~



