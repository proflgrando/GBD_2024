show databases;

create database supermercado;

show databases;

use supermercado;

create table estoque (
    -> ID int Not null auto_increment,
    -> NOME VARCHAR(255) NOT NULL,
    -> MARCA VARCHAR(255),
    -> UNIDADE VARCHAR(255),
    -> QUANTIDADE INT,
    -> PRIMARY KEY (ID) )
    -> ;
	
show tables;

INSERT INTO estoque (NOME, MARCA, UNIDADE, QUANTIDADE) VALUES ("ARROZ","TIO JOAO", "PCT", 20);

INSERT INTO estoque (NOME, MARCA, UNIDADE, QUANTIDADE) VALUES ("FEIJAO","TIO JOAO", "PCT", 40);

INSERT INTO estoque (NOME, MARCA, UNIDADE, QUANTIDADE) VALUES ("MILHO","EMBRAPA", "LT", 20);

SELECT * FROM estoque;