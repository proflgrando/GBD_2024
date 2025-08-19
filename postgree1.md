# Guia: Criando e Manipulando Banco de Dados com PostgreSQL

Baseado em: https://www.pg4e.com/lectures/01-Intro-to-SQL.txt

## 1. Configuração – Criando Banco de Dados / Usuário

```bash
sudo -u postgres psql postgres
```
```sql
\l       -- lista os bancos de dados
CREATE USER aulamdb WITH PASSWORD 'secret';
CREATE DATABASE people WITH OWNER 'aulamdb' ENCODING 'UTF8';
SHOW hba_file; -- necessário incluir no arquivo pg_hba.conf as permissões para o usuário 'aulamdb'
```

No Linux (Pop_OS! 22.04, por exemplo), o caminho do arquivo costuma ser:

```
/etc/postgresql/14/main/pg_hba.conf
```

Edite com:

```bash
sudo gedit /etc/postgresql/14/main/pg_hba.conf
```

<img width="701" height="540" alt="image" src="https://github.com/user-attachments/assets/edb74f54-506a-464b-a6ba-51cab0220fbe" />

Depois, reinicie o PostgreSQL:

```bash
sudo systemctl restart postgresql
```

---

## 2. Acessando o Banco

```bash
psql people aulamdb
```

Ver tabelas:

```sql
\dt
```

---

## 3. Criando Tabela

```sql
CREATE TABLE users(
    name VARCHAR(128),
    email VARCHAR(128)
);
```

---

## 4. Inserindo Dados

```sql
INSERT INTO users (name, email) VALUES ('Ana', 'ana@email.com');
INSERT INTO users (name, email) VALUES ('Bruno', 'bruno@email.com');
INSERT INTO users (name, email) VALUES ('Carla', 'carla@email.com');
INSERT INTO users (name, email) VALUES ('Diego', 'diego@email.com');
INSERT INTO users (name, email) VALUES ('Eva', 'eva@email.com');
INSERT INTO users (name, email) VALUES ('Felipe', 'felipe@email.com');
```

---

## 5. Alterando e Removendo Registros

```sql
DELETE FROM users WHERE email='diego@email.com';

-- Exemplo errado (vai gerar erro de sintaxe, pois SQL espera aspas simples para strings)
UPDATE users SET name="Ana Paula" WHERE email='ana@email.com';

-- Exemplo correto (No PostgreSQL (e na maioria dos bancos em modo padrão ANSI), as aspas duplas " são reservadas para nomes de colunas ou tabelas.)
UPDATE users SET name='Ana Paula' WHERE email='ana@email.com';
```

---

## 6. Consultas

```sql
SELECT * FROM users;

SELECT * FROM users WHERE email='ana@email.com';

SELECT * FROM users ORDER BY email;

SELECT * FROM users ORDER BY name DESC;

SELECT * FROM users WHERE name LIKE '%a%';

SELECT * FROM users ORDER BY email DESC LIMIT 2;
SELECT * FROM users ORDER BY email OFFSET 1 LIMIT 2;

SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM users WHERE email='ana@email.com';
```

---

## 7. Usando Chave Primária e Campo Único

```sql
DROP TABLE users;

CREATE TABLE users (
  id SERIAL,
  name VARCHAR(128),
  email VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);
```

Inserindo registros:

```sql
INSERT INTO users (name, email) VALUES ('Ana', 'ana@email.com');
INSERT INTO users (name, email) VALUES ('Bruno', 'bruno@email.com');
INSERT INTO users (name, email) VALUES ('Carla', 'carla@email.com');
```

Consultando registros (observe que o campo SERIAL é fornecido automaticamente):

```sql
SELECT * FROM users;
```

Tentativa de duplicar (vai falhar por conta do `UNIQUE`):

```sql
INSERT INTO users (name, email) VALUES ('Carla', 'carla@email.com');
```

---
