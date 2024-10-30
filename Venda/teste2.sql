-- Inserindo dados na tabela Clientes
INSERT INTO `mydb`.`Clientes` (`Nome Cliente`, `Telefone`) VALUES
('Cliente 1', '1111-1111'),
('Cliente 2', '2222-2222'),
('Cliente 3', '3333-3333'),
('Cliente 4', '4444-4444'),
('Cliente 5', '5555-5555'),
('Cliente 6', '6666-6666'),
('Cliente 7', '7777-7777'),
('Cliente 8', '8888-8888'),
('Cliente 9', '9999-9999'),
('Cliente 10', '1010-1010'),
('Cliente 11', '1111-1212'),
('Cliente 12', '1212-1313'),
('Cliente 13', '1313-1414'),
('Cliente 14', '1414-1515'),
('Cliente 15', '1515-1616');

-- Inserindo dados na tabela Fornecedores
INSERT INTO `mydb`.`Fornecedores` (`Nome fornecedor`, `Telefone`, `Cidade`) VALUES
('Fornecedor 1', '2121-2121', 'Cidade A'),
('Fornecedor 2', '2222-2222', 'Cidade B'),
('Fornecedor 3', '2323-2323', 'Cidade C'),
('Fornecedor 4', '2424-2424', 'Cidade D'),
('Fornecedor 5', '2525-2525', 'Cidade E'),
('Fornecedor 6', '2626-2626', 'Cidade F'),
('Fornecedor 7', '2727-2727', 'Cidade G'),
('Fornecedor 8', '2828-2828', 'Cidade H'),
('Fornecedor 9', '2929-2929', 'Cidade I'),
('Fornecedor 10', '3030-3030', 'Cidade J'),
('Fornecedor 11', '3131-3131', 'Cidade K'),
('Fornecedor 12', '3232-3232', 'Cidade L'),
('Fornecedor 13', '3333-3333', 'Cidade M'),
('Fornecedor 14', '3434-3434', 'Cidade N'),
('Fornecedor 15', '3535-3535', 'Cidade O');

-- Inserindo dados na tabela Produtos
INSERT INTO `mydb`.`Produtos` (`Descricao`, `Marca`, `Unidade`, `Fornecedores_Codigofornecedor`) VALUES
('Produto 1', 'Marca A', 'unidade', 1),
('Produto 2', 'Marca B', 'unidade', 2),
('Produto 3', 'Marca C', 'unidade', 3),
('Produto 4', 'Marca D', 'unidade', 4),
('Produto 5', 'Marca E', 'unidade', 5),
('Produto 6', 'Marca F', 'unidade', 6),
('Produto 7', 'Marca G', 'unidade', 7),
('Produto 8', 'Marca H', 'unidade', 8),
('Produto 9', 'Marca I', 'unidade', 9),
('Produto 10', 'Marca J', 'unidade', 10),
('Produto 11', 'Marca K', 'unidade', 11),
('Produto 12', 'Marca L', 'unidade', 12),
('Produto 13', 'Marca M', 'unidade', 13),
('Produto 14', 'Marca N', 'unidade', 14),
('Produto 15', 'Marca O', 'unidade', 15);

-- Inserindo dados na tabela Precos
INSERT INTO `mydb`.`Precos` (`Preco`, `Produtos_idProdutos`) VALUES
(10.00, 1),
(15.50, 2),
(20.00, 3),
(25.75, 4),
(30.00, 5),
(35.50, 6),
(40.00, 7),
(45.25, 8),
(50.00, 9),
(55.75, 10),
(60.00, 11),
(65.50, 12),
(70.00, 13),
(75.25, 14),
(80.00, 15);

-- Inserindo dados na tabela Venda
INSERT INTO `mydb`.`Venda` (`quantidade`, `Produtos_idProdutos`, `Clientes_idCliente`, `Precos_Precos`) VALUES
(2, 1, 1, 1),
(1, 2, 2, 2),
(3, 3, 3, 3),
(5, 4, 4, 4),
(1, 5, 5, 5),
(4, 6, 6, 6),
(2, 7, 7, 7),
(3, 8, 8, 8),
(1, 9, 9, 9),
(5, 10, 10, 10),
(2, 11, 11, 11),
(3, 12, 12, 12),
(1, 13, 13, 13),
(4, 14, 14, 14),
(2, 15, 15, 15);

SELECT * FROM Venda;
