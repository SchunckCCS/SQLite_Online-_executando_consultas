1) SELECT avg(nota) from Notas WHERE id_disciplina = 2;

2) SELECT * from Alunos where nome_aluno like('A%')

3) SELECT * from Alunos WHERE strftime('%m', data_nascimento) = '02';

4) SELECT Nome_Aluno,Data_Nascimento, strftime('%Y','now') - strftime('%Y', Data_Nascimento) AS Idade	FROM Alunos;

5) SELECT id_aluno, nota, CASE WHEN nota >= 6 THEN 'Aprovado' ELSE 'Reprovado' END AS Situacao FROM Notas;
