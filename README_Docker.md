# AMBIENTE DOCKER PARA EXECUTAR OS SCRIPTS

Criamos um docker compose para criar um ambiente que possamos executar os códigos sql com MySql

***IMPORTANTE:***
Caso não tenha docker instalado na máquina local, você pode trabalhar no [Docker Playground](https://labs.play-with-docker.com/) (*Limitação de 4h logado e autenticar conta github a cada instância para fazer o push dos arquivos*)
**Ou Executar através do Codespace no Github**

## PRÉ-REQUISITOS

- Docker instalado na máquina.
- Arquivos na estrutura <br>
<pre lang="md"> ├──docker-compose.yml 
 ├── docker/
 |    └── init.sql 
 ├── demais arquivos </pre>



## COMO USAR
### Passo 1 - Criar o container com docker compose
Para executar o docker compose usamos o seguinte comando no terminal:

`docker compose up -d `

Este comando vai criar um container com as informações que passamos no arquivo [docker-compose.yml](./docker-compose.yml)

__O docker compose vai__
 - Executar o script [init.sql](./init.sql). *Você pode inserir os comandos sql que queira ser executado ao iniciar neste arquivo.*
 - Criar o container gbd_mysql rodando em segundo plano

### Passo 2 - Acessar o Banco de Dados
Você pode acessar por uma **ferramenta gráfica** caso tenha instalado uma, apenas faça a conexão do banco de dados.
Exemplo: Instalar uma extensão **SQLTools**

|VARIÁVEL | VALOR |
| :-----: | :---------:|
| __HOST:__ | localhost |
| __PORTA:__ | 3306 |
| __USUARIO:__ | gbd_user | 
| __SENHA:__ |  gbd_pass |
| __SENHA ROOT:__ | rootpass |
*Pode alterar as credenciais no docker-compose*

### Acesso no terminal
Você também pode se conectar através do terminal usando o comando:

` docker-compose exec db mysql -u gbd_user -p gbd_db `
*Senha: gbd_pass*

Ou acessar como root (somente root tem acesso a criação e outras databases)
` docker-compose exec db mysql -u root -p `
*Senha: rootpass*

### Executar outros scripts diretamente no container

Você pode executar outros scripts que estejam no seu diretório através deste comando

`docker-compose exec -T db mysql -u root -prootpass gbd_db < CRUD.sql`

*Substitua CRUD.sql pelo arquivo desejado*

## Outros comandos úteis

**Verificar o status dos containers:**

`docker compose ps`

------------------------
**Ver os logs em tempo real:**

`docker compose logs -f`

------------------------
**Parar os containers sem remover nada:**

`docker compose stop`

-------------------------
**Parar e remover os containers (mantendo os dados do volume):**

`docker compose down`

-------------------------
**Parar e remover TUDO**

**Usa este comando para forçar a reset do script init.sql do zero:**

`docker compose down --volumes`

----------------------
**Entrar no terminal bash do container**

`docker compose exec db bash`

### Estes são alguns comandos para usar o Docker com o mysql voce pode ver mais na [Documentação do Docker](https://docs.docker.com/) e Aprender sobre os [comandos SQL](README.md).






