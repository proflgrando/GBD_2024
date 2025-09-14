CREATE DATABASE IF NOT EXISTS exemplo_crud;
CREATE DATABASE IF NOT EXISTS supermecado;
USE exemplo_crud;

GRANT ALL PRIVILEGES ON exemplo_crud.* TO 'gbd_user'@'%';
GRANT ALL PRIVILEGES ON supermercado.* TO 'gbd_user'@'%';
FLUSH PRIVILEGES;