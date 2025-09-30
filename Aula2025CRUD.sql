-- =========================================
-- 1. Criar banco de dados
-- =========================================
CREATE DATABASE IF NOT EXISTS exemplo_crud;
USE exemplo_crud;

-- =========================================
-- 2. Criar tabela
-- =========================================
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    idade INT,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- 3. CREATE (Inserir dados)
-- =========================================
INSERT INTO usuarios (nome, email, idade) VALUES
('Leonardo', 'leo@email.com', 30),
('Maria', 'maria@email.com', 25),
('João', 'joao@email.com', 28);

-- =========================================
-- 4. READ (Consultar dados)
-- =========================================
-- Selecionar todos os usuários
SELECT * FROM usuarios;

-- Selecionar usuários com idade maior que 26
SELECT * FROM usuarios
WHERE idade > 26;

-- =========================================
-- 5. UPDATE (Atualizar dados)
-- =========================================
-- Atualizar idade do João para 29
UPDATE usuarios
SET idade = 29
WHERE nome = 'João';

-- =========================================
-- 6. DELETE (Deletar dados)
-- =========================================
-- Deletar o usuário Maria
DELETE FROM usuarios
WHERE nome = 'Maria';

-- =========================================
-- 7. Consultar após alterações
-- =========================================
SELECT * FROM usuarios;
