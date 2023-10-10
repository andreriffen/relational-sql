# -- CASO DE USO
#Remova linhas da tabela Matriculas
DELETE FROM matriculas;

# -- CASO DE USO
#Remova linhas da tabela Disciplinas que sejam referenciadas na tabela Matriculas
DELETE FROM disciplinas
WHERE id
IN (SELECT disciplinas_id FROM matriculas);

# -- CASO DE USO
#Remova linhas da tabela Alunos que sejam referenciadas na tabela Matriculas
DELETE FROM alunos
WHERE id
IN (SELECT alunos_id FROM matriculas);

# -- CASO DE USO
#Remova linhas da tabela Cursos que sejam referenciadas na tabela Disciplinas
DELETE FROM cursos
WHERE id
IN (SELECT cursos_id FROM disciplinas);

# 1:N entre Cursos - Disciplinas
ALTER TABLE disciplinas
ADD FOREIGN KEY (cursos_id)
REFERENCES cursos(id)
ON DELETE CASCADE;

# 1:N entre Disciplinas - Matriculas
ALTER TABLE matriculas
ADD FOREIGN KEY (disciplinas_id)
REFERENCES disciplinas(id)
ON DELETE CASCADE;

# 1:N entre Cursos - Matriculas
ALTER TABLE matriculas
ADD FOREIGN KEY (cursos_id)
REFERENCES cursos(id)
ON DELETE CASCADE;

# 1:N entre Alunos - Matriculas
ALTER TABLE matriculas
ADD FOREIGN KEY (alunos_id)
REFERENCES alunos(id)
ON DELETE CASCADE;
