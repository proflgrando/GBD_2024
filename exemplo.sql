# Criar database
create database supermercado;

#usar esta base de dados
use supermercado;

#caso queira limpar a base para efeito de testes
Drop table Estoque;

#criar tabela estoque
CREATE TABLE Estoque (
    ID int NOT NULL auto_increment,
    Item varchar(255) NOT NULL,
    Marca varchar(255),
    Unidade varchar(3),
    Qty int,
    PRIMARY KEY (ID)
);

#mostrar as tabelas
show tables;

#apresentar 
describe Estoque;

#consultar tabela
select * from Estoque;

#inserir dados
INSERT INTO Estoque ( Item, Marca, Unidade, Qty) VALUES ( "Arroz" , "Pileco", "Un", 12345);

INSERT INTO Estoque ( Item, Marca, Unidade, Qty) VALUES ( "Arroz" , "Juquinha", "Un", 123);

INSERT INTO Estoque ( Item, Marca, Unidade, Qty) VALUES ( "Oleo" , "Pangare", "Un", 123);

select * from Estoque;

#fazer busca com condições
Select * from Estoque
where Item = "Arroz";

# atualizar dados com condições
UPDATE Estoque
set Item = "Leite", Unidade = "Lt"
Where ID = 2;

#incluir coluna
Alter table Estoque
Add limite varchar(255);

select * from Estoque;

#incluir coluna
Alter table Estoque
Drop limite;

select * from Estoque;
