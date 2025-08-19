Python for Everybody Database Handout

https://www.pg4e.com/lectures/01-Intro-to-SQL.txt

Setup - Making a Database / User:

Note:  --- is the start of a comment - do not include these

sudo -u postgres psql postgres
\l       -- list databases
CREATE USER aulamdb WITH PASSWORD 'secret';
CREATE DATABASE people WITH OWNER 'aulamdb' ENCODING 'UTF8';
SHOW hba_file; --- necessário incluir no arquivo pg_hba.conf as permissões para o usuário 'aulamdb' 

No meu caso (usando Linux Pop_OS! 22.04):
postgres-# ;
              hba_file               
-------------------------------------
 /etc/postgresql/14/main/pg_hba.conf


\q       -- quit

No terminal, caso esteja usando Linux:
sudo gedit /etc/postgresql/14/main/pg_hba.conf

<img width="701" height="223" alt="image" src="https://github.com/user-attachments/assets/2ac1c8cd-6a90-4524-a3c6-15a10af748e9" />



Salvar o arquivo

Running SQL Commands:

psql people aulamdb

\dt      -- List relations (tables)

CREATE TABLE users( name VARCHAR(128), email VARCHAR(128) );

INSERT INTO users (name, email) VALUES ('Chuck', 'csev@umich.edu');
INSERT INTO users (name, email) VALUES ('Colleen', 'cvl@umich.edu');
INSERT INTO users (name, email) VALUES ('Ted', 'ted@umich.edu');
INSERT INTO users (name, email) VALUES ('Sally', 'a1@umich.edu');
INSERT INTO users (name, email) VALUES ('Ted', 'ted@umich.edu');
INSERT INTO users (name, email) VALUES ('Kristen', 'kf@umich.edu');

DELETE FROM users WHERE email='ted@umich.edu';

UPDATE users SET name="Charles" WHERE email='csev@umich.edu';

SELECT * FROM users;

SELECT * FROM users WHERE email='csev@umich.edu';

SELECT * FROM users ORDER BY email;

SELECT * FROM users ORDER BY name DESC;

SELECT * FROM users WHERE name LIKE '%e%';

SELECT * FROM users ORDER BY email DESC LIMIT 2;
SELECT * FROM users ORDER BY email OFFSET 1 LIMIT 2;

SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM users WHERE email='csev@umich.edu';

DROP TABLE users;

CREATE TABLE users (
  id SERIAL, 
  name VARCHAR(128), 
  email VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

INSERT INTO users (name, email) VALUES ('Chuck', 'csev@umich.edu');
INSERT INTO users (name, email) VALUES ('Colleen', 'cvl@umich.edu');
INSERT INTO users (name, email) VALUES ('Ted', 'ted@umich.edu');

-- Note the SERIAL field auto-supplied
SELECT * from users;

-- Watch for failure due to UNIQUE
INSERT INTO users (name, email) VALUES ('Ted', 'ted@umich.edu');

