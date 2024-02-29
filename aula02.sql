--crio a base de dados se ela ainda não existir
IF NOT EXISTS(SELECT name FROM sys.databases WHERE name='escola')
	BEGIN
		CREATE DATABASE escola;
	END
ELSE
	BEGIN
		PRINT 'A base de dados já existe';
	END;
	
--se a base de dados existir, irei selecioná-la
IF EXISTS(SELECT name FROM sys.databases WHERE name='escola')
	BEGIN
		USE escola;
	END
ELSE
	BEGIN
		PRINT 'A base de dados não foi encontrada';
	END;

--crio as tabelas na base de dados, caso ainda não existam
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'pessoa')
	BEGIN
		CREATE TABLE pessoa(
			id INT NOT NULL PRIMARY KEY,
			nome VARCHAR(50) NOT NULL,
			dataDeNascimento DATE NOT NULL,
			cpf CHAR(11) NOT NULL,
			sexo CHAR(1) NOT NULL
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe';
	END; 

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'curso')
	BEGIN
		CREATE TABLE curso (
			id INT NOT NULL PRIMARY KEY,
			nome VARCHAR(50) NOT NULL,
			professor VARCHAR(50) NOT NULL,
			sala CHAR(1) NOT NULL,
			turno CHAR(1) NOT NULL
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe';
	END; 

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'endereco')
	BEGIN
		CREATE TABLE endereco (
			rua VARCHAR(50) NOT NULL,
			bairro VARCHAR(30) NOT NULL,
			cidade VARCHAR(15) NOT NULL,
			numero VARCHAR(6) NOT NULL,
			cep CHAR(8) NOT NULL,
			id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id)
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe';
	END; 

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'telefone')
	BEGIN
		CREATE TABLE telefone (
			id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id),
			numero CHAR(11) NOT NULL
		);		
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe';
	END; 

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'estuda')
	BEGIN
		CREATE TABLE estuda (
			id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id),
			id_curso INT NOT NULL FOREIGN KEY(id_curso) REFERENCES curso(id),
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe';
	END; 