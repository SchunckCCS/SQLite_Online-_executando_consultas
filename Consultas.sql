select * from HistoricoEmprego 
WHERE datatermino NOTNULL
ORDER by salario DESC 
LIMIT 3 -- serve para limitar os resultados obtidos 
  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
SELECT curso from Treinamento 
  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
SELECT mes, min(faturamento_bruto) from faturamento
-- max/min é uma função para mostrar o valor máximo e mpinimo de uma coluna
  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
SELECT SUM(numero_novos_clientes) as "Novos Cliente 2023" from faturamento -- aspas duplas é pra nomear where mes like '%2023%';
-- Sum é a soma dos valores da coluna
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
SELECT cargo, COUNT(*) qtd from HistoricoEmprego group by cargo HAVING qtd >= 2
-- Having não é nada mais do que a condição where só que em valores agrupados
-- Isso porque where só funciona em registros únicos
-- Count é a quantidade de itens da coluna
-- O GROUP BY é uma cláusula do SQL usada para agrupar linhas que possuem os mesmos valores em colunas específicas
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT AVG(lucro_liquido) FROM faturamento; -- Avg é a média (Average)

---------------------------------
-- 4 Utilizando outras funções --
---------------------------------

SELECT nome, LENGTH(cpf) qtd -- LENGTH é uma função que verifica a quantidade de caracteres de um campo específico; qtd é o nome escolhido para a coluna de resultados
FROM Colaboradores
WHERE qtd = 11;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT (' pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte endereço: '
|| endereco) AS texto
FROM Colaboradores;

-- Explicação gemini:
/*
1. A Função do Operador ||
Em muitos bancos de dados SQL (como PostgreSQL, Oracle e SQLite), o símbolo || serve para "grudar" (concatenar) textos e valores de colunas.

2. O que o SELECT está montando?
Ele está criando uma frase personalizada para cada linha da tabela. O resultado final de uma linha será algo como: " pessoa colaboradora João Silva de CPF 123.456.789-00 possui o seguinte endereço: Rua das Flores, 123"
*/ 
 -- Basicamente esse código está imprimindo as informação exigidas de uma forma personalizada

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mais funções de tratamento de string 


SELECT UPPER(' pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte endereço: ' -- Upper deixa o texto em maiúsculo
|| endereco) AS texto
FROM Colaboradores;

SELECT LOWER(' pessoa colaboradora ' || nome || ' de CPF ' || cpf || ' possui o seguinte endereço: ' -- Lower deixa o texto em minúsculo
|| endereco) AS texto
FROM Colaboradores;

SELECT TRIM(nome) FROM tabela; -- TRIM remove os espaços do início e do fim de uma string

SELECT REPLACE(saudacao, 'hello', 'hi') FROM tabela; -- Troca o primeiro texto, pelo segundo

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Função de data

SELECT id_colaborador, JULIANDAY(datatermino) - JULIANDAY(datacontratacao) -- Isso aqui vale um texto:
/*Basicamente a função JULIANDAY tem esse nome porque ela faz o cálculo do dia 
24 de novembro de 4714 a.C. até os dias de hoje, e essa época foi o inicio da era Juliana. 
Essa função é usada, majoritariamente, para fazer cálculo de datas. 
A data de ponto de partiida foi escolhida por históriadores para ser o mais 
longe possível do dia atual, para que se precisassse fazer um cálculo no passado, 
não tivesse como resultado números negativos..*/
from HistoricoEmprego
where datatermino is NOT NULL;

SELECT DATE('now', '10-days') -- Essa função retorna o ano, mês e dia de agora podendo também fazer alterações.

SELECT TIME('now'); -- TIME é análogo ao DATE, porém ele retorna as horas, minutos e segundos de agora. Ele também pode ser alterado.

SELECT DATETIME('now') -- É a junção das duas funções anteriores.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Funções numéricas

SELECT AVG(faturamento_bruto), ROUND (AVG(faturamento_bruto),2) FROM faturamento; -- ROUND é uma função que arredonda o número para duas casa decimais depois da vígular

SELECT CEIL(faturamento_bruto), CEIL(despesas) FROM faturamento; -- CEIL arredonda para um número inteiro

SELECT POWER(2, 3); -- POWER eleva o primeiro número ao segundo (2^3)

SELECT SQRT(16); -- SQRT retorna a raiz quadrada de um número

SELECT RANDOM(); -- RANDOM gera um número aleatório entre -9223372036854775808 e +9223372036854775807

SELECT ABS(-5); -- Retorna o valor de um número, que é o seu sinal (tipo o módulo)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Função de conversão

SELECT (' O faturamento bruto médio foi ' || CAST(ROUND (AVG(faturamento_bruto),2) AS TEXT)) -- Cast seve para converter um tipo de dados em outro. Nesse exemplo foi de int para string
FROM faturamento;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- If do SQL

SELECT id_colaborador, cargo, salario,
CASE
WHEN salario < 3000 THEN 'Baixo'
WHEN salario BETWEEN 3000 AND 6000 THEN 'Médio'
ELSE 'Alto'
END AS categoria_salario -- É o nome da coluna criada a partir do if
FROM HistoricoEmprego;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cláusula Rename

ALTER TABLE HistoricoEmprego RENAME TO CargosColaboradores;




