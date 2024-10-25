--se a base de dados existir, irei selecioná-la
IF EXISTS(SELECT name FROM sys.databases WHERE name='escola')
	BEGIN
		USE escola;
	END
ELSE
	BEGIN
		PRINT 'A base de dados não foi encontrada';
	END;

--edito um registro de pessoa (o nome de Isabela Santos será alterado para Isabela Ferreira)
UPDATE pessoa
	SET nome='Isabela Ferreira'
	WHERE cpf=56789012345;

--apago um registro de pessoa (apagarei o registro de Isabela passando o cpf)
DELETE pessoa
	WHERE cpf=56789012345;



