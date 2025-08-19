# Guia: Criando e Manipulando Banco de Dados com PostgreSQL

Baseado em: https://www.pg4e.com/lectures/01-Intro-to-SQL.txt
https://www.pg4e.com/lectures/02-Database-Design-Many-to-Many.txt

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

Baseado em: https://www.pg4e.com/lectures/02-Database-Design-Many-to-Many.txt

---

````markdown
# Guia: Banco de Dados Musical e Relacionamentos Many-to-Many com PostgreSQL

## 1. Configuração do Banco
````

```bash
sudo -u postgres psql postgres
```

```sql
\l       -- lista os bancos de dados
-- Usuário já deve ter sido criado: CREATE USER aulamdb WITH PASSWORD 'secret';
CREATE DATABASE music WITH OWNER 'aulamdb' ENCODING 'UTF8';
\q       -- sair
````

Acessando o banco:

```bash
psql music aulamdb
\dt      -- lista as tabelas
```

---

## 2. Criando Tabelas

```sql
CREATE TABLE artist (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE album (
  id SERIAL,
  title VARCHAR(128) UNIQUE,
  artist_id INTEGER REFERENCES artist(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

CREATE TABLE genre (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE track (
    id SERIAL,
    title VARCHAR(128),
    len INTEGER, rating INTEGER, count INTEGER,
    album_id INTEGER REFERENCES album(id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genre(id) ON DELETE CASCADE,
    UNIQUE(title, album_id),
    PRIMARY KEY(id)
);
```

Ver estrutura da tabela `track`:

```sql
\d track
```

---

## 3. Inserindo Dados

```sql
-- Artistas
INSERT INTO artist (name) VALUES ('Led Zeppelin');
INSERT INTO artist (name) VALUES ('AC/DC');

-- Álbuns
INSERT INTO album (title, artist_id) VALUES ('Who Made Who', 2);
INSERT INTO album (title, artist_id) VALUES ('IV', 1);

-- Gêneros
INSERT INTO genre (name) VALUES ('Rock');
INSERT INTO genre (name) VALUES ('Metal');

-- Faixas
INSERT INTO track (title, rating, len, count, album_id, genre_id) 
    VALUES ('Black Dog', 5, 297, 0, 2, 1);
INSERT INTO track (title, rating, len, count, album_id, genre_id) 
    VALUES ('Stairway', 5, 482, 0, 2, 1);
INSERT INTO track (title, rating, len, count, album_id, genre_id) 
    VALUES ('About to Rock', 5, 313, 0, 1, 2);
INSERT INTO track (title, rating, len, count, album_id, genre_id) 
    VALUES ('Who Made Who', 5, 207, 0, 1, 2);
```

---

## 4. Consultas com JOINs

```sql
-- Nome do álbum e do artista
SELECT album.title, artist.name FROM album JOIN artist 
    ON album.artist_id = artist.id;

-- Detalhes completos do álbum e artista
SELECT album.title, album.artist_id, artist.id, artist.name 
    FROM album INNER JOIN artist ON album.artist_id = artist.id;

-- Cruzamento de tracks e gêneros
SELECT track.title, track.genre_id, genre.id, genre.name 
    FROM track CROSS JOIN genre;

-- Tracks com nome do gênero
SELECT track.title, genre.name FROM track JOIN genre 
    ON track.genre_id = genre.id;

-- Todas as informações juntas
SELECT track.title, artist.name, album.title, genre.name 
FROM track 
    JOIN genre ON track.genre_id = genre.id 
    JOIN album ON track.album_id = album.id 
    JOIN artist ON album.artist_id = artist.id;
```

---

## 5. Exemplo de Delete

```sql
DELETE FROM genre WHERE name='Metal';
```

---

## 6. Relacionamento Many-to-Many

```sql
CREATE TABLE student (
  id SERIAL,
  name VARCHAR(128),
  email VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE course (
  id SERIAL,
  title VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE member (
    student_id INTEGER REFERENCES student(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES course(id) ON DELETE CASCADE,
    role INTEGER,
    PRIMARY KEY (student_id, course_id)
);
```

---

## 7. Inserindo Dados Many-to-Many

```sql
-- Alunos
INSERT INTO student (name, email) VALUES ('Jane', 'jane@tsugi.org');
INSERT INTO student (name, email) VALUES ('Ed', 'ed@tsugi.org');
INSERT INTO student (name, email) VALUES ('Sue', 'sue@tsugi.org');

-- Cursos
INSERT INTO course (title) VALUES ('Python');
INSERT INTO course (title) VALUES ('SQL');
INSERT INTO course (title) VALUES ('PHP');

-- Membros
INSERT INTO member (student_id, course_id, role) VALUES (1, 1, 1);
INSERT INTO member (student_id, course_id, role) VALUES (2, 1, 0);
INSERT INTO member (student_id, course_id, role) VALUES (3, 1, 0);

INSERT INTO member (student_id, course_id, role) VALUES (1, 2, 0);
INSERT INTO member (student_id, course_id, role) VALUES (2, 2, 1);

INSERT INTO member (student_id, course_id, role) VALUES (2, 3, 1);
INSERT INTO member (student_id, course_id, role) VALUES (3, 3, 0);
```

Consulta final:

```sql
SELECT student.name, member.role, course.title
FROM student 
JOIN member ON member.student_id = student.id 
JOIN course ON member.course_id = course.id
ORDER BY course.title, member.role DESC, student.name;
```

---



