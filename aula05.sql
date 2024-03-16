--se a base de dados existir, irei selecioná-la
IF EXISTS(SELECT name FROM sys.databases WHERE name='escola')
	BEGIN
		USE escola;
	END
ELSE
	BEGIN
		PRINT 'A base de dados não foi encontrada';
	END;

--mostro todos os registros da tabela pessoa
SELECT * FROM pessoa;

--mostro o registro da pessoa cujo id é 5
SELECT * FROM pessoa
	WHERE id=5;

--mostro o registro da pessoa cujo cpf é 56789012345
SELECT * FROM pessoa
	WHERE cpf=56789012345;

--crio uma tabela de dependentes
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dependente')
	BEGIN
		CREATE TABLE dependente(
			cpf CHAR(11) NOT NULL,
			nome VARCHAR(50) NOT NULL,
			idPessoa INT NOT NULL FOREIGN KEY(idPessoa) REFERENCES pessoa(id) 
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe';
	END; 

	
--insiro três tuplas na tabela dependentes (todas estarão associadas a pessoa cujo id é 1)
INSERT INTO dependente(cpf, nome, idPessoa) VALUES
('58742458859', 'Joaquim', 1),
('85421548752', 'Maria', 1),
('74587424589', 'Bernardo', 1);

--descobrir o cpf dos dependentes, usando o cpf da pessoa.
SELECT dependente.cpf FROM dependente, pessoa
	WHERE pessoa.cpf='98652354785';

--pesquisa: descobrir quantos dependentes a pessoa tem, usando o id
SELECT COUNT(*) 
	FROM dependente 
		WHERE idPessoa=1;