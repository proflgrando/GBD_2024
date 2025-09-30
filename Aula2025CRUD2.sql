-- ============================================
-- CRIAÇÃO DO BANCO DE DADOS
--- baseado em: https://www.pg4e.com/lectures/02-Database-Design-Many-to-Many.txt 
-- ============================================

-- Cria o banco de dados 'music' com suporte a UTF-8
CREATE DATABASE IF NOT EXISTS music
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- Seleciona o banco de dados
USE music;

-- ============================================
-- CRIAÇÃO DAS TABELAS
-- ============================================

-- Tabela de artistas
CREATE TABLE artist (
  id INT AUTO_INCREMENT,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
) ENGINE=InnoDB;

-- Tabela de álbuns
CREATE TABLE album (
  id INT AUTO_INCREMENT,
  title VARCHAR(128) UNIQUE,
  artist_id INT,
  PRIMARY KEY(id),
  CONSTRAINT fk_album_artist FOREIGN KEY (artist_id)
    REFERENCES artist(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tabela de gêneros musicais
CREATE TABLE genre (
  id INT AUTO_INCREMENT,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
) ENGINE=InnoDB;

-- Tabela de faixas
CREATE TABLE track (
  id INT AUTO_INCREMENT,
  title VARCHAR(128),
  duration INT,                     -- em segundos
  rating INT CHECK (rating BETWEEN 1 AND 5),
  play_count INT DEFAULT 0,
  album_id INT,
  genre_id INT,
  PRIMARY KEY(id),
  CONSTRAINT fk_track_album FOREIGN KEY (album_id)
    REFERENCES album(id) ON DELETE CASCADE,
  CONSTRAINT fk_track_genre FOREIGN KEY (genre_id)
    REFERENCES genre(id) ON DELETE CASCADE,
  UNIQUE(title, album_id)
) ENGINE=InnoDB;

-- ============================================
-- INSERINDO DADOS INICIAIS
-- ============================================

-- Artistas
INSERT INTO artist (name) VALUES
  ('Pink Floyd'),
  ('The Beatles'),
  ('Nirvana'),
  ('Iron Maiden');

-- Álbuns (usando subqueries para garantir FK correta)
INSERT INTO album (title, artist_id) VALUES
  ('The Dark Side of the Moon', (SELECT id FROM artist WHERE name='Pink Floyd')),
  ('Abbey Road', (SELECT id FROM artist WHERE name='The Beatles')),
  ('Nevermind', (SELECT id FROM artist WHERE name='Nirvana')),
  ('The Number of the Beast', (SELECT id FROM artist WHERE name='Iron Maiden'));

-- Gêneros
INSERT INTO genre (name) VALUES
  ('Progressive Rock'),
  ('Pop Rock'),
  ('Grunge'),
  ('Heavy Metal');

-- Faixas (usando subqueries para buscar album_id e genre_id)
INSERT INTO track (title, rating, duration, album_id, genre_id) VALUES
  ('Time', 5, 412,
   (SELECT id FROM album WHERE title='The Dark Side of the Moon'),
   (SELECT id FROM genre WHERE name='Progressive Rock')),
  ('Money', 4, 382,
   (SELECT id FROM album WHERE title='The Dark Side of the Moon'),
   (SELECT id FROM genre WHERE name='Progressive Rock')),
  ('Come Together', 5, 259,
   (SELECT id FROM album WHERE title='Abbey Road'),
   (SELECT id FROM genre WHERE name='Pop Rock')),
  ('Here Comes the Sun', 5, 185,
   (SELECT id FROM album WHERE title='Abbey Road'),
   (SELECT id FROM genre WHERE name='Pop Rock')),
  ('Smells Like Teen Spirit', 5, 301,
   (SELECT id FROM album WHERE title='Nevermind'),
   (SELECT id FROM genre WHERE name='Grunge')),
  ('Lithium', 4, 257,
   (SELECT id FROM album WHERE title='Nevermind'),
   (SELECT id FROM genre WHERE name='Grunge')),
  ('Run to the Hills', 5, 233,
   (SELECT id FROM album WHERE title='The Number of the Beast'),
   (SELECT id FROM genre WHERE name='Heavy Metal')),
  ('Hallowed Be Thy Name', 5, 431,
   (SELECT id FROM album WHERE title='The Number of the Beast'),
   (SELECT id FROM genre WHERE name='Heavy Metal'));

-- ============================================
-- CONSULTAS DE EXEMPLO
-- ============================================

-- Lista álbuns com seus artistas
SELECT album.title, artist.name
FROM album
JOIN artist ON album.artist_id = artist.id;

-- Lista músicas com artista, álbum e gênero
SELECT t.title AS faixa, a.name AS artista, al.title AS album, g.name AS genero
FROM track t
JOIN album al ON t.album_id = al.id
JOIN artist a ON al.artist_id = a.id
JOIN genre g ON t.genre_id = g.id
ORDER BY artista, album, faixa;

-- Exclui um gênero (e todas as músicas associadas)
DELETE FROM genre WHERE name='Grunge';

-- ============================================
-- RELACIONAMENTO MUITOS-PARA-MUITOS
-- ============================================

-- Alunos
CREATE TABLE student (
  id INT AUTO_INCREMENT,
  name VARCHAR(128),
  email VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
) ENGINE=InnoDB;

-- Cursos
CREATE TABLE course (
  id INT AUTO_INCREMENT,
  title VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
) ENGINE=InnoDB;

-- Relação entre alunos e cursos
CREATE TABLE member (
  student_id INT,
  course_id INT,
  role INT, -- 1 = Instrutor, 0 = Aluno
  PRIMARY KEY(student_id, course_id),
  CONSTRAINT fk_member_student FOREIGN KEY (student_id)
    REFERENCES student(id) ON DELETE CASCADE,
  CONSTRAINT fk_member_course FOREIGN KEY (course_id)
    REFERENCES course(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Inserindo alunos
INSERT INTO student (name, email) VALUES
  ('Alice', 'alice@tuktuk.org'),
  ('Bob', 'bob@tuktuk.org'),
  ('Charlie', 'charlie@tuktuk.org'),
  ('Diana', 'diana@tuktuk.org');

-- Inserindo cursos
INSERT INTO course (title) VALUES ('Java'), ('C++'), ('Data Science');

-- Inserindo relação (com subqueries para IDs)
INSERT INTO member (student_id, course_id, role) VALUES
  ((SELECT id FROM student WHERE name='Alice'), (SELECT id FROM course WHERE title='Java'), 1),
  ((SELECT id FROM student WHERE name='Bob'), (SELECT id FROM course WHERE title='Java'), 0),
  ((SELECT id FROM student WHERE name='Charlie'), (SELECT id FROM course WHERE title='Java'), 0),
  ((SELECT id FROM student WHERE name='Bob'), (SELECT id FROM course WHERE title='C++'), 1),
  ((SELECT id FROM student WHERE name='Charlie'), (SELECT id FROM course WHERE title='C++'), 0),
  ((SELECT id FROM student WHERE name='Diana'), (SELECT id FROM course WHERE title='C++'), 0),
  ((SELECT id FROM student WHERE name='Charlie'), (SELECT id FROM course WHERE title='Data Science'), 1),
  ((SELECT id FROM student WHERE name='Alice'), (SELECT id FROM course WHERE title='Data Science'), 0),
  ((SELECT id FROM student WHERE name='Diana'), (SELECT id FROM course WHERE title='Data Science'), 0);

-- Consulta: lista alunos, cursos e papéis
SELECT s.name AS estudante,
       c.title AS curso,
       CASE m.role WHEN 1 THEN 'Instrutor' ELSE 'Aluno' END AS papel
FROM member m
JOIN student s ON m.student_id = s.id
JOIN course c ON m.course_id = c.id
ORDER BY curso, papel DESC, estudante;

-- ============================================
-- EXEMPLOS DE JOINs E VIEWs
-- ============================================

-- 1️⃣ JOIN 1:N: Listar faixas com álbum e artista
-- Explicação:
-- Cada faixa (track) pertence a um álbum (album)
-- Cada álbum pertence a um artista (artist)
-- Para mostrar faixa + álbum + artista, precisamos juntar as três tabelas usando JOIN
SELECT t.title AS faixa,         -- Nome da faixa
       al.title AS album,        -- Nome do álbum
       a.name AS artista         -- Nome do artista
FROM track t
JOIN album al ON t.album_id = al.id       -- Relaciona a faixa com o álbum
JOIN artist a ON al.artist_id = a.id     -- Relaciona o álbum com o artista
ORDER BY artista, album, faixa;

-- 2️⃣ JOIN N:M: Listar alunos com cursos e papéis
-- Explicação:
-- Um aluno pode ter vários cursos e um curso pode ter vários alunos
-- A tabela 'member' conecta student e course (N:M)
-- O JOIN permite recuperar dados de todas as tabelas relacionadas
SELECT s.name AS aluno,
       c.title AS curso,
       CASE m.role
           WHEN 1 THEN 'Instrutor'
           ELSE 'Aluno'
       END AS papel
FROM member m
JOIN student s ON m.student_id = s.id     -- Conecta aluno
JOIN course c ON m.course_id = c.id      -- Conecta curso
ORDER BY curso, papel DESC, aluno;

-- 3️⃣ Criando uma VIEW de faixas com artistas e gêneros
-- Explicação:
-- Uma VIEW é uma "tabela virtual" que armazena o resultado de uma consulta
-- Ela facilita consultas futuras sem precisar escrever JOINs repetidamente
CREATE VIEW vw_tracks AS
SELECT t.title AS faixa,
       al.title AS album,
       a.name AS artista,
       g.name AS genero
FROM track t
JOIN album al ON t.album_id = al.id
JOIN artist a ON al.artist_id = a.id
JOIN genre g ON t.genre_id = g.id;

-- Consultando a VIEW criada
-- Agora podemos usar a view como se fosse uma tabela
-- Por exemplo, listar todas as faixas de 'Progressive Rock'
SELECT * FROM vw_tracks
WHERE genero = 'Progressive Rock';

-- 4️⃣ Criando uma VIEW de alunos com cursos
-- Explicação:
-- Simplifica consultas frequentes sobre alunos e cursos
-- Mostra também o papel (Instrutor ou Aluno)
CREATE VIEW vw_student_courses AS
SELECT s.name AS aluno,
       c.title AS curso,
       CASE m.role
           WHEN 1 THEN 'Instrutor'
           ELSE 'Aluno'
       END AS papel
FROM member m
JOIN student s ON m.student_id = s.id
JOIN course c ON m.course_id = c.id;

-- Consultando a VIEW
-- Exemplo: mostrar apenas instrutores
SELECT * FROM vw_student_courses
WHERE papel = 'Instrutor';


