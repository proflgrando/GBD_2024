-- Inserindo Dados em Clientes
INSERT INTO mydb.Clientes (nome_cliente, telefone_cliente) VALUES
('Cliente A', '123456789'),
('Cliente B', '987654321'),
('Cliente C', '555666777'),
('Cliente D', '444333222'),
('Cliente E', '111222333'),
('Cliente F', '888999000'),
('Cliente G', '222333444'),
('Cliente H', '777888999'),
('Cliente I', '333444555'),
('Cliente J', '666777888'),
('Cliente K', '999000111'),
('Cliente L', '123123123'),
('Cliente M', '456456456'),
('Cliente N', '789789789'),
('Cliente O', '321321321');

-- Inserindo Dados em Fornecedores
INSERT INTO mydb.Fornecedores (nome_fornecedor, telefone_fornecedor, cidade_fornecedor) VALUES
('Fornecedor A', '111222333', 'Cidade A'),
('Fornecedor B', '444555666', 'Cidade B'),
('Fornecedor C', '777888999', 'Cidade C'),
('Fornecedor D', '222333444', 'Cidade D'),
('Fornecedor E', '888999000', 'Cidade E'),
('Fornecedor F', '333444555', 'Cidade F'),
('Fornecedor G', '999000111', 'Cidade G'),
('Fornecedor H', '123123123', 'Cidade H'),
('Fornecedor I', '456456456', 'Cidade I'),
('Fornecedor J', '789789789', 'Cidade J'),
('Fornecedor K', '321321321', 'Cidade K'),
('Fornecedor L', '555666777', 'Cidade L'),
('Fornecedor M', '666777888', 'Cidade M'),
('Fornecedor N', '111222333', 'Cidade N'),
('Fornecedor O', '444555666', 'Cidade O');

-- Inserindo Dados em Produtos
INSERT INTO mydb.Produtos (Descricao, Marca, Unidade, Fornecedores_Codigofornecedor, VALOR) VALUES
('Produto A', 'Marca A', 'Unidade A', 1, 10.00),
('Produto B', 'Marca B', 'Unidade B', 2, 15.50),
('Produto C', 'Marca C', 'Unidade C', 3, 20.00),
('Produto D', 'Marca D', 'Unidade D', 4, 25.75),
('Produto E', 'Marca E', 'Unidade E', 5, 30.00),
('Produto F', 'Marca F', 'Unidade F', 6, 5.25),
('Produto G', 'Marca G', 'Unidade G', 7, 40.10),
('Produto H', 'Marca H', 'Unidade H', 8, 35.50),
('Produto I', 'Marca I', 'Unidade I', 9, 22.30),
('Produto J', 'Marca J', 'Unidade J', 10, 18.90),
('Produto K', 'Marca K', 'Unidade K', 11, 50.00),
('Produto L', 'Marca L', 'Unidade L', 12, 45.60),
('Produto M', 'Marca M', 'Unidade M', 13, 60.70),
('Produto N', 'Marca N', 'Unidade N', 14, 75.80),
('Produto O', 'Marca O', 'Unidade O', 15, 90.90);

-- Inserindo Dados em Vendas
INSERT INTO mydb.Venda (quantidade, Clientes_idCliente, Produtos_idProdutos1) VALUES
(2, 1, 1),
(1, 2, 2),
(3, 3, 3),
(5, 4, 4),
(1, 5, 5),
(4, 6, 6),
(2, 7, 7),
(1, 8, 8),
(3, 9, 9),
(2, 10, 10),
(1, 11, 11),
(5, 12, 12),
(2, 13, 13),
(1, 14, 14),
(3, 15, 15);

Select * from Venda;

SELECT 
    v.idVenda,
    c.nome_cliente,
    p.Descricao AS produto,
    v.quantidade,
    p.VALOR AS preco_unitario,
    v.quantidade * p.VALOR AS custo_total
FROM 
    mydb.Venda v
JOIN 
    mydb.Clientes c ON v.Clientes_idCliente = c.idCliente
JOIN 
    mydb.Produtos p ON v.Produtos_idProdutos1 = p.idProdutos;

SELECT 
    c.nome_cliente,
    SUM(v.quantidade * p.VALOR) AS valor_gasto
FROM 
    mydb.Venda v
JOIN 
    mydb.Clientes c ON v.Clientes_idCliente = c.idCliente
JOIN 
    mydb.Produtos p ON v.Produtos_idProdutos1 = p.idProdutos
GROUP BY 
    c.idCliente, c.nome_cliente
ORDER BY 
    valor_gasto DESC;


