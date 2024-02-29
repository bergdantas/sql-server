--crio a base de dados
CREATE DATABASE escola
	
--seleciono a base de dados
USE escola

--crio as tabelas que vão compor a base de dados
CREATE TABLE pessoa(
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dataDeNascimento DATE NOT NULL,
	cpf CHAR(11) NOT NULL,
	rg VARCHAR(15)
)
CREATE TABLE curso (
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	professor VARCHAR(50) NOT NULL,
	sala CHAR(1) NOT NULL,
	turno CHAR(1) NOT NULL
)
CREATE TABLE endereco (
	rua VARCHAR(50) NOT NULL,
	bairro VARCHAR(30) NOT NULL,
	cidade VARCHAR(15) NOT NULL,
	numero VARCHAR(6) NOT NULL,
	cep CHAR(8) NOT NULL,
	id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id)
)
CREATE TABLE telefone (
	id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id),
	numero CHAR(11) NOT NULL
)
CREATE TABLE estuda (
	id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id),
	id_curso INT NOT NULL FOREIGN KEY(id_curso) REFERENCES curso(id),
)

--adiciono um atributo
ALTER TABLE pessoa
	ADD sexo CHAR(1) NOT NULL;

--removo um atributo
ALTER TABLE pessoa
	DROP COLUMN rg;

--"edito" um atributo
ALTER TABLE pessoa
	DROP COLUMN sexo 
ALTER TABLE pessoa
	ADD sexo CHAR(1) NOT NULL

--apago tabelas da base de dados
DROP TABLE estuda
DROP TABLE endereco
DROP TABLE telefone
DROP TABLE pessoa
DROP TABLE curso

--apago a base de dados
USE master
DROP DATABASE escola;