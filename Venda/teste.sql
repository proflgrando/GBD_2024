-- Usando o banco de dados mydb
USE mydb;

-- Inserindo dados fictícios na tabela Clientes
INSERT INTO `Clientes` (`Nome Cliente`, `Telefone`) VALUES
('João Silva', '11987654321'),
('Maria Oliveira', '11998765432'),
('Carlos Santos', '11912345678'),
('Ana Costa', '11923456789'),
('Lucas Almeida', '11934567890');

-- Inserindo dados fictícios na tabela Fornecedores
INSERT INTO `Fornecedores` (`Nome fornecedor`, `Telefone`, `Cidade`) VALUES
('Fornecedor A', '1134567890', 'São Paulo'),
('Fornecedor B', '1145678901', 'Rio de Janeiro'),
('Fornecedor C', '1156789012', 'Belo Horizonte'),
('Fornecedor D', '1167890123', 'Curitiba'),
('Fornecedor E', '1178901234', 'Porto Alegre');

-- Inserindo dados fictícios na tabela Produtos
INSERT INTO `Produtos` (`Descricao`, `Marca`, `Unidade`, `Fornecedores_Codigofornecedor`) VALUES
('Produto 1', 'Marca A', 'unidade', 1),
('Produto 2', 'Marca B', 'unidade', 2),
('Produto 3', 'Marca C', 'unidade', 3),
('Produto 4', 'Marca D', 'unidade', 4),
('Produto 5', 'Marca E', 'unidade', 5);

-- Inserindo dados fictícios na tabela Venda
INSERT INTO `Venda` (`quantidade`, `Produtos_idProdutos`, `Clientes_idCliente`) VALUES
('5', 1, 1),
('3', 2, 2),
('10', 3, 3),
('1', 4, 4),
('7', 5, 5);

SELECT * FROM Venda;

