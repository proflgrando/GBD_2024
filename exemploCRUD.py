import mysql.connector
from mysql.connector import Error

try:
    # =========================================
    # 1. Conectar ao banco de dados
    # =========================================
    conexao = mysql.connector.connect(
        host='localhost',       # ou IP do servidor MariaDB
        user='root',     # substitua pelo seu usuário
        password='root',   # substitua pela sua senha
        database='exemplo_crud' # nome do banco do primeiro exemplo
    )

    if conexao.is_connected():
        print("Conexão bem-sucedida!")

    cursor = conexao.cursor()

    # =========================================
    # 2. CREATE - Inserir um usuário
    # =========================================
    sql_insert = "INSERT INTO usuarios (nome, email, idade) VALUES (%s, %s, %s)"
    valores = ("Carlos", "carlos@email.com", 35)
    cursor.execute(sql_insert, valores)
    conexao.commit()
    print(f"{cursor.rowcount} registro(s) inserido(s).")

    sql_insert = "INSERT INTO usuarios (nome, email, idade) VALUES (%s, %s, %s)"
    valores = ("Léo", "leon@email.com", 41)
    cursor.execute(sql_insert, valores)
    conexao.commit()
    print(f"{cursor.rowcount} registro(s) inserido(s).")

    # =========================================
    # 3. READ - Consultar todos os usuários
    # =========================================
    cursor.execute("SELECT * FROM usuarios")
    resultado = cursor.fetchall()
    print("Usuários no banco de dados:")
    for linha in resultado:
        print(linha)

    # =========================================
    # 4. UPDATE - Atualizar idade de um usuário
    # =========================================
    sql_update = "UPDATE usuarios SET idade = %s WHERE nome = %s"
    valores_update = (36, "Carlos")
    cursor.execute(sql_update, valores_update)
    conexao.commit()
    print(f"{cursor.rowcount} registro(s) atualizado(s).")

    # =========================================
    # 5. DELETE - Deletar um usuário
    # =========================================
    sql_delete = "DELETE FROM usuarios WHERE nome = %s"
    valor_delete = ("Carlos",)
    cursor.execute(sql_delete, valor_delete)
    conexao.commit()
    print(f"{cursor.rowcount} registro(s) deletado(s).")

except Error as e:
    print(f"Erro ao conectar ou executar operação: {e}")

finally:
    if conexao.is_connected():
        cursor.close()
        conexao.close()
        print("Conexão encerrada.")
