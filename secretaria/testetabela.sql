-- Desativando as verificações de chaves estrangeiras e verificação de unicidade para facilitar a inserção
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `mydb`;

-- Inserção de Cursos
INSERT INTO `curso` (`nome`, `sigla`, `duracao`, `tipo+duracao`, `data_inicio`, `periodo`) VALUES
('Curso de Engenharia', 'ENG', 5, 'ano', '2023-01-01', 'matutino'),
('Curso de Medicina', 'MED', 6, 'ano', '2023-02-01', 'integral'),
('Curso de Direito', 'DIR', 5, 'ano', '2023-03-01', 'noturno');

-- Inserção de Disciplinas
INSERT INTO `disciplina` (`nome`, `sigla`, `semestre`, `aulas_semana`, `aulas_totais`, `area`, `curso_id`) VALUES
('Matemática 1', 'MAT1', 1, 4, 60, 'Matemática', 1),
('Física 1', 'FIS1', 1, 4, 60, 'Física', 1),
('História', 'HIS', 2, 3, 45, 'Humanas', 3),
('Anatomia', 'ANA', 1, 6, 90, 'Saúde', 2),
('Bioquímica', 'BIO', 2, 4, 60, 'Saúde', 2);

-- Inserção de Alunos
INSERT INTO `aluno` (`nome`, `prontuario`, `data_nascimento`) VALUES
('João Silva', 12345, '1999-05-10'),
('Maria Oliveira', 12346, '2000-03-15'),
('Carlos Santos', 12347, '1998-11-20'),
('Ana Costa', 12348, '1999-07-30'),
('Pedro Souza', 12349, '2000-01-25');

-- Associação Alunos-Cursos (aluno_curso)
INSERT INTO `aluno_curso` (`aluno_id`, `curso_id`, `situacao`, `data_matricula`) VALUES
(1, 1, 'ativo', '2024-01-15'),
(2, 2, 'ativo', '2024-01-15'),
(3, 3, 'ativo', '2024-01-15'),
(4, 1, 'ativo', '2024-01-15'),
(5, 2, 'ativo', '2024-01-15');

-- Inserção de Turmas
INSERT INTO `turma` (`codigo`, `disciplina_id`) VALUES
('A', 1),
('B', 2),
('C', 3),
('D', 4),
('E', 5);

-- Inserção de Professores
INSERT INTO `professor` (`nome`, `prontuario`, `data_nascimento`, `email`) VALUES
('Professor João', 'P123', '1980-06-10', 'joao@university.com'),
('Professora Maria', 'P124', '1982-03-15', 'maria@university.com'),
('Professor Carlos', 'P125', '1981-07-20', 'carlos@university.com');

-- Associação Professores-Turmas (professor_turma)
INSERT INTO `professor_turma` (`professor_id`, `turma_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserção de Salas
INSERT INTO `sala` (`tipo`, `computadores`, `projetor`, `lousa_digital`, `bloco`, `andar`) VALUES
('Aula', 30, 1, 1, 'Bloco A', '1º Andar'),
('Aula', 25, 1, 0, 'Bloco B', '2º Andar'),
('Laboratório', 0, 1, 1, 'Bloco C', '3º Andar');

-- Associação Salas-Turmas (sala_turma)
INSERT INTO `sala_turma` (`sala_id`, `turma_id`) VALUES
(1, 1),
(2, 2),
(3, 4);

-- Inserção de Alunos em Turmas (aluno_turma)
INSERT INTO `aluno_turma` (`aluno_id`, `turma_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Reativando as verificações de chaves estrangeiras e de unicidade
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


