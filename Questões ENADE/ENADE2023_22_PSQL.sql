-- Criar o banco e conectar
CREATE DATABASE escola_sql;

-- apenas caso PSQL, no dbeaver escolher o DB
\c escola_sql;

-- =========================
-- TABELA PESSOA
-- =========================
CREATE TABLE pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(11),
    rg VARCHAR(20),
    data_cadastro DATE
);

-- =========================
-- TABELA CLIENTE
-- =========================
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    data_cadastro DATE,
    limite_credito NUMERIC(10,2),
    saldo_compras NUMERIC(10,2),
    saldo_devedor NUMERIC(10,2),
    FOREIGN KEY (id_cliente) REFERENCES pessoa(id_pessoa)
);

-- =========================
-- TABELA FUNCIONARIO
-- =========================
CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY,
    data_cadastro DATE,
    cntps VARCHAR(255),
    matricula VARCHAR(255),
    pis VARCHAR(255),
    salario NUMERIC(10,2),
    FOREIGN KEY (id_funcionario) REFERENCES pessoa(id_pessoa)
);

-- =========================
-- INSERINDO PESSOAS
-- (note que SERIAL gera id automaticamente,
-- então precisamos informar manualmente para
-- manter a correspondência com cliente/funcionario)
-- =========================
INSERT INTO pessoa (id_pessoa, nome, cpf, rg, data_cadastro) VALUES
(1, 'Ana Silva', '11111111111', '1234567', '2024-01-10'),
(2, 'Carlos Souza', '22222222222', '2345678', '2024-02-15'),
(3, 'Fernanda Lima', '33333333333', '3456789', '2024-03-20'),
(4, 'João Pereira', '44444444444', '4567890', '2024-04-05'),
(5, 'Mariana Costa', '55555555555', '5678901', '2024-05-12');

-- =========================
-- INSERINDO CLIENTES
-- =========================
INSERT INTO cliente VALUES
(1, '2024-01-15', 2000.00, 1500.00, 1000.00),
(3, '2024-03-25', 3000.00, 2500.00, 1800.00),
(4, '2024-04-10', 1500.00, 1200.00, 200.00);

-- =========================
-- INSERINDO FUNCIONÁRIOS
-- =========================
INSERT INTO funcionario VALUES
(2, '2024-02-20', 'CNTPS01', 'MAT001', 'PIS001', 2500.00),
(3, '2024-03-28', 'CNTPS02', 'MAT002', 'PIS002', 1500.00),
(5, '2024-05-15', 'CNTPS03', 'MAT003', 'PIS003', 3000.00);

-- Clientes que também são funcionários e devem mais que recebem
SELECT p.nome, c.saldo_devedor
FROM pessoa p
JOIN cliente c ON p.id_pessoa = c.id_cliente
JOIN funcionario f ON p.id_pessoa = f.id_funcionario
WHERE c.saldo_devedor > f.salario
ORDER BY c.saldo_devedor ASC;

