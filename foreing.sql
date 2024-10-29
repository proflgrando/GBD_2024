# Criar database
create database supermercado2;

#usar esta base de dados
use supermercado2;


CREATE TABLE Orders (
    OrderID int NOT NULL auto_increment,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

CREATE TABLE Persons (
    PersonID int NOT NULL auto_increment,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int,
    PRIMARY KEY (PersonID)
);

INSERT INTO Persons ( PersonID, LastName, FirstName, Age) VALUES ( 1 , "Grando", "Leonardo", 40);
INSERT INTO Persons ( PersonID, LastName, FirstName, Age) VALUES ( 2 , "Calop", "Juliano", 47);
INSERT INTO Persons ( PersonID, LastName, FirstName, Age) VALUES ( 3 , "Bento", "Chico", 41);

INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 1 , 774488, 2);
INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 2 , 774588, 3);
INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 3 , 778888, 3);
INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 4 , 888777, 1);
INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 5 , 774483, 2);
INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 6 , 774188, 3);
INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 7 , 775688, 3);
INSERT INTO Orders ( OrderID, OrderNumber, PersonID) VALUES ( 8 , 880077, 1);

Select * from Orders;


UPDATE Persons
SET LastName = 'NovoSobrenome', FirstName = 'NovoNome', Age = 30
WHERE PersonID = 1;

Select * from Persons;