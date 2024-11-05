-- Definir o banco de dados
USE mydb;

-- -----------------------------------------------------
-- Consultas de Exemplo
-- -----------------------------------------------------

-- 1. Consultar todos os alunos
SELECT * FROM aluno;

-- 2. Consultar todos os cursos com seus respectivos nomes e siglas
SELECT id, nome, sigla FROM curso;

-- 3. Consultar todas as disciplinas de um curso específico (por exemplo, curso de Ciência da Computação)
SELECT d.id, d.nome, d.sigla, d.semestre, d.aulas_semana, d.aulas_totais, d.area
FROM disciplina d
JOIN curso c ON d.curso_id = c.id
WHERE c.nome = 'Curso de Ciência da Computação';

-- 4. Consultar todos os alunos matriculados em um curso específico (por exemplo, "Curso de Administração")
SELECT a.id, a.nome, a.prontuario, a.data_nascimento
FROM aluno a
JOIN aluno_curso ac ON a.id = ac.aluno_id
JOIN curso c ON ac.curso_id = c.id
WHERE c.nome = 'Curso de Administração';

-- 5. Consultar todas as turmas de uma disciplina (por exemplo, 'Algoritmos e Estruturas de Dados')
SELECT t.id, t.codigo
FROM turma t
JOIN disciplina d ON t.disciplina_id = d.id
WHERE d.nome = 'Algoritmos e Estruturas de Dados';

-- 6. Consultar todos os professores e as turmas que lecionam
SELECT p.id, p.nome AS professor_nome, t.codigo AS turma_codigo
FROM professor p
JOIN professor_turma pt ON p.id = pt.professor_id
JOIN turma t ON pt.turma_id = t.id;

-- 7. Consultar todos os alunos e as disciplinas em que estão matriculados
SELECT a.nome AS aluno_nome, d.nome AS disciplina_nome, ad.situacao AS situacao_matricula
FROM aluno a
JOIN aluno_disciplina ad ON a.id = ad.aluno_id
JOIN disciplina d ON ad.disciplina_id = d.id;

-- 8. Consultar todas as salas de aula e as turmas alocadas nelas
SELECT s.id AS sala_id, s.tipo AS sala_tipo, t.codigo AS turma_codigo
FROM sala s
JOIN sala_turma st ON s.id = st.sala_id
JOIN turma t ON st.turma_id = t.id;

-- 9. Consultar todas as turmas e os professores que as lecionam, incluindo o nome da disciplina
SELECT t.codigo AS turma_codigo, p.nome AS professor_nome, d.nome AS disciplina_nome
FROM turma t
JOIN disciplina d ON t.disciplina_id = d.id
JOIN professor_turma pt ON t.id = pt.turma_id
JOIN professor p ON pt.professor_id = p.id;

-- 10. Consultar os alunos que estão matriculados em mais de um curso
SELECT a.id, a.nome, COUNT(ac.curso_id) AS quantidade_cursos
FROM aluno a
JOIN aluno_curso ac ON a.id = ac.aluno_id
GROUP BY a.id
HAVING quantidade_cursos > 1;

