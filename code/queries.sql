SELECT CPF from Funcionario WHERE salario > 2000 AND salario < 3000;
SELECT CPF from Funcionario WHERE CPF in (SELECT CPF from Funcionario WHERE salario > 2000) AND CPF in (SELECT CPF from Funcionario WHERE salario < 3000);
SELECT status_obra FROM Obra WHERE tipo = 'Sobrado' and localizacao = 'Belo Horizonte';
SELECT status_obra FROM Obra WHERE ID_Obra IN (SELECT ID_Obra FROM Obra WHERE tipo = 'Sobrado') AND ID_Obra IN (SELECT ID_Obra from Obra WHERE localizacao = 'Belo Horizonte');
SELECT nome FROM Fornecedor a JOIN Fornecedor_Produtos b ON a.ID_Fornecedor = b.ID_Fornecedor WHERE produtos = 'Telha';
SELECT nome FROM Fornecedor WHERE ID_Fornecedor IN (SELECT ID_Fornecedor FROM Fornecedor_Produtos WHERE produtos = 'Telha');
SELECT nome FROM Funcionario a JOIN Pessoa b ON a.CPF = b.CPF WHERE CURRENT_TIMESTAMP - data_admissao >= 3;
SELECT nome FROM Pessoa a JOIN Funcionario b ON a.cpf = b.cpf WHERE a.cpf NOT IN (SELECT cpf FROM Funcionario WHERE CURRENT_TIMESTAMP - data_admissao < 3);
SELECT nome, produtos FROM Fornecedor a JOIN Fornecedor_Produtos b on a.ID_Fornecedor = b.ID_Fornecedor WHERE a.ID_Fornecedor IN (SELECT ID_Fornecedor FROM (SELECT a.ID_Fornecedor, COUNT(produtos) as qtd FROM Fornecedor_Produtos a JOIN Fornecedor b ON a.ID_Fornecedor = b.ID_Fornecedor GROUP BY a.ID_Fornecedor) as q1 WHERE qtd in (SELECT max(qtd) FROM (SELECT a.ID_Fornecedor, COUNT(produtos) as qtd FROM Fornecedor_Produtos a JOIN Fornecedor b ON a.ID_Fornecedor = b.ID_Fornecedor GROUP BY a.ID_Fornecedor)as q1));
SELECT nome, produtos FROM Fornecedor a JOIN Fornecedor_Produtos b on a.ID_Fornecedor = b.ID_Fornecedor WHERE a.ID_Fornecedor IN (SELECT ID_Fornecedor FROM (SELECT a.ID_Fornecedor, COUNT(produtos) as qtd FROM Fornecedor_Produtos a JOIN Fornecedor b ON a.ID_Fornecedor = b.ID_Fornecedor GROUP BY a.ID_Fornecedor ORDER BY qtd DESC LIMIT 1) as q1);
SELECT status_pagamento FROM Pessoa a JOIN Participa b on a.CPF = b.CPF JOIN Obra c ON b.Id_Obra = c.Id_Obra JOIN Cliente d ON d.CPF = a.CPF WHERE c.Localizacao = 'Belo Horizonte';
SELECT status_pagamento FROM Cliente a JOIN Participa b on a.CPF = b.CPF JOIN Obra c ON b.Id_Obra = c.Id_Obra WHERE c.Localizacao = 'Belo Horizonte';
SELECT nome FROM Funcionario a JOIN Pessoa b on a.cpf = b.cpf LEFT JOIN Documento c ON a.cpf = c.ID_Responsavel WHERE salario >= 3000 AND c.ID_Responsavel is null;
SELECT nome FROM Pessoa WHERE cpf IN (Select cpf FROM Funcionario WHERE cpf NOT IN (SELECT ID_Responsavel FROM Documento) AND salario >= 3000) ORDER BY nome;
SELECT tipo, localizacao, status_obra FROM Obra a JOIN Participa b ON a.ID_Obra = b.ID_Obra JOIN Funcionario c ON b.cpf = c.cpf WHERE c.salario in (Select Max(salario) from Funcionario);
SELECT tipo, localizacao, status_obra FROM Obra WHERE ID_Obra IN (SELECT ID_Obra FROM Participa WHERE CPF IN (SELECT CPF from Funcionario WHERE salario IN (Select Max(salario) from Funcionario)));
SELECT a.cpf, nome, salario, qtd FROM ( SELECT ID_Responsavel as cpf, count(ID_Documento) as qtd FROM Documento GROUP BY cpf) a JOIN Pessoa b on a.cpf = b.cpf JOIN Funcionario c ON b.cpf = c.cpf WHERE qtd IN (Select max(qtd) FROM (SELECT count(ID_Documento) as qtd FROM Documento GROUP BY ID_Responsavel) as sq1);
SELECT b.cpf, nome, salario, count(Id_Responsavel) as qtd FROM Documento a JOIN Pessoa b ON a.ID_Responsavel = b.cpf JOIN Funcionario c ON b.cpf = c.cpf GROUP BY b.cpf ORDER BY qtd DESC LIMIT 1;
SELECT tipo, count(*) FROM Obra a JOIN (Select ID_Obra FROM Fornece WHERE expiracao_contrato < '2021-12-31' GROUP BY ID_Obra) b ON a.ID_Obra = b.ID_Obra GROUP BY tipo;
SELECT tipo, count(*) FROM Obra a JOIN (SELECT DISTINCT ID_Obra FROM Fornece WHERE expiracao_contrato < '2021-12-31') b ON a.ID_Obra = b.ID_Obra GROUP BY tipo;