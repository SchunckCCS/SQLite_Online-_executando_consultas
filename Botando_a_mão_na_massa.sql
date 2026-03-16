1) SELECT * from Colaboradores LIMIT 5

2) SELECT * FROM Dependentes 
WHERE genero != 'Masculino' AND parentesco = 'filha';

3) SELECT * from Colaboradores WHERE nome like('A%')and nome like('%sa');

4) SELECT cargo, salario from HistoricoEmprego where salario > 5000 

5) SELECT nome || ' ' || endereco as sla from Colaboradores;
