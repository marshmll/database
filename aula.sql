DROP DATABASE ReviewSystematic;

CREATE DATABASE ReviewSystematic;

USE ReviewSystematic;

CREATE TABLE nome_orientadores (
	id_nome_orientador INTEGER PRIMARY KEY NOT NULL,
    nome_orientador CHAR(50) NOT NULL
);

CREATE TABLE pesquisador (
	id_pesquisa INTEGER PRIMARY KEY NOT NULL,
    nome_pesquisador CHAR(100) NOT NULL,
    titulo CHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL
);

CREATE TABLE busca (
	id_busca INTEGER PRIMARY KEY NOT NULL,
    palavras_chaves TEXT
);

CREATE TABLE artigos (
	id_artigos INTEGER PRIMARY KEY NOT NULL,
    FILE MEDIUMBLOB
);