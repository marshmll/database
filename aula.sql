DROP DATABASE ReviewSystematic;

CREATE DATABASE ReviewSystematic;

USE ReviewSystematic;

CREATE TABLE nome_orientadores
(
    id_nome_orientador INTEGER PRIMARY KEY NOT NULL,
    nome_orientador CHAR(50) NOT NULL
);

CREATE TABLE pesquisador (
    id_pesquisador INT PRIMARY KEY NOT NULL,
    nome_pesquisador VARCHAR(100) NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE busca
(
    id_busca INTEGER PRIMARY KEY NOT NULL,
    palavras_chaves TEXT
);

CREATE TABLE artigos 
(
    id_artigos INTEGER PRIMARY KEY NOT NULL,
    FILE TEXT
);

/*Alterar as tabelas pesquisa e artigos*/
ALTER TABLE pesquisador ADD COLUMN fk_id_nome_orientadores INTEGER NOT NULL;
ALTER TABLE busca ADD COLUMN fk_id_pesquisador INTEGER NOT NULL;
ALTER TABLE artigos ADD COLUMN fk_id_busca INTEGER NOT NULL;

ALTER TABLE pesquisador ADD FOREIGN KEY (fk_id_nome_orientadores) REFERENCES nome_orientadores(id_nome_orientador) ON DELETE CASCADE;
ALTER TABLE busca ADD FOREIGN KEY (fk_id_pesquisador) REFERENCES pesquisador(id_pesquisador) ON DELETE CASCADE;
ALTER TABLE artigos ADD FOREIGN KEY (fk_id_busca) REFERENCES busca(id_busca) ON DELETE CASCADE;

INSERT INTO nome_orientadores (id_nome_orientador, nome_orientador) VALUES
(1, 'Dr. João Silva'),
(2, 'Dra. Maria Oliveira'),
(3, 'Dr. Carlos Pereira'),
(4, 'Dra. Ana Costa'),
(5, 'Dr. Paulo Santos'),
(6, 'Dra. Fernanda Lima'),
(7, 'Dr. Lucas Martins'),
(8, 'Dra. Juliana Rocha'),
(9, 'Dr. Renato Almeida'),
(10, 'Dra. Gabriela Mendes');

/*SELECT * FROM nome_orientadores;*/

/*Inserindo Dados na Tabela pesquisador*/
INSERT INTO pesquisador (id_pesquisador, nome_pesquisador, titulo, descricao, data_inicio,
fk_id_nome_orientadores) VALUES (1, 'Fernando Alves', 'Mestre', 'Pesquisa em Inteligência Artificial', '2023-01-15', 1);
INSERT INTO pesquisador (id_pesquisador, nome_pesquisador, titulo, descricao, data_inicio,
fk_id_nome_orientadores) VALUES (2, 'Cláudia Dias', 'Doutora', 'Estudos em Biomedicina', '2022-06-01', 2);
INSERT INTO pesquisador (id_pesquisador, nome_pesquisador, titulo, descricao, data_inicio,
fk_id_nome_orientadores) VALUES (3, 'Ricardo Ferreira', 'Mestre', 'Desenvolvimento Sustentável', '2023-03-20', 3);
INSERT INTO pesquisador (id_pesquisador, nome_pesquisador, titulo, descricao, data_inicio,
fk_id_nome_orientadores) VALUES (4, 'Patrícia Nunes', 'Doutora', 'Análise de Dados', '2021-09-10', 4);
INSERT INTO pesquisador (id_pesquisador, nome_pesquisador, titulo, descricao, data_inicio,
fk_id_nome_orientadores) VALUES (5, 'André Soares', 'Mestre', 'Educação e Tecnologia', '2024-02-05', 5);

INSERT INTO busca (id_busca, palavras_chaves, fk_id_pesquisador) VALUES
(1, 'Inteligência Artificial, Machine Learning', 1),
(2, 'Saúde, Biomedicina, Terapias', 2),
(3, 'Sustentabilidade, Ecologia', 3),
(4, 'Big Data, Estatística', 4),
(5, 'Tecnologia Educacional, Ensino a Distância', 5);

/*Inserindo Dados na Tabela artigos*/
INSERT INTO artigos (id_artigos, `FILE`, fk_id_busca) VALUES (1,
'/home/rnascimento/Documents/PUCPR/Arquitetura de Banco de Dados/CódigoFonte/Artigos/artigo1.pdf', 1);
INSERT INTO artigos (id_artigos, `FILE`, fk_id_busca) VALUES (2,
'/home/rnascimento/Documents/PUCPR/Arquitetura de Banco de Dados/CódigoFonte/Artigos/artigo2.pdf', 2);
INSERT INTO artigos (id_artigos, `FILE`, fk_id_busca) VALUES (3,
'/home/rnascimento/Documents/PUCPR/Arquitetura de Banco de Dados/CódigoFonte/Artigos/artigo3.pdf', 3);
INSERT INTO artigos (id_artigos, `FILE`, fk_id_busca) VALUES (4,
'/home/rnascimento/Documents/PUCPR/Arquitetura de Banco de Dados/CódigoFonte/Artigos/artigo4.pdf', 4);
INSERT INTO artigos (id_artigos, `FILE`, fk_id_busca) VALUES (5,
'/home/rnascimento/Documents/PUCPR/Arquitetura de Banco de Dados/CódigoFonte/Artigos/artigo5.pdf', 5);
/*
SELECT * FROM nome_orientadores;
SELECT * FROM pesquisador;
SELECT * FROM busca;
SELECT * FROM artigos;
SELECT nome_orientador FROM nome_orientadores;
SELECT nome_pesquisador, titulo FROM pesquisador;
SELECT palavras_chaves FROM busca;
SELECT id_artigos, LENGTH(FILE) AS tamanho_arquivo FROM artigos;
SELECT id_artigos, LENGTH(FILE) / (1024 * 1024) AS tamanho_arquivo_MB FROM artigos;
*
SELECT COUNT(*) AS total_pesquisadores FROM pesquisador;
SELECT COUNT(*) AS total_pesquisadores_recente FROM pesquisador
WHERE data_inicio > '2023-01-01';

SELECT nome_pesquisador, titulo, data_inicio FROM pesquisador
ORDER BY nome_pesquisador ASC;

SELECT id_artigos, `FILE` FROM artigos ORDER BY id_artigos ASC;

SELECT nome_orientador, COUNT(id_pesquisador) AS total_pesquisadores FROM nome_orientadores LEFT
JOIN pesquisador ON id_nome_orientador = fk_id_nome_orientadores GROUP BY nome_orientador;

SELECT nome_pesquisador, COUNT(id_busca) AS total_buscas FROM pesquisador LEFT JOIN busca ON
id_pesquisador = fk_id_pesquisador GROUP BY nome_pesquisador;
*/
SELECT * FROM nome_orientadores WHERE nome_orientador = 'Dr. João Silva';
SELECT * FROM pesquisador WHERE data_inicio > '2023-01-01';
SELECT * FROM busca WHERE palavras_chaves LIKE '%Inteligência Artificial%';
SELECT * FROM artigos WHERE id_artigos = 2;
SELECT * FROM pesquisador WHERE titulo = 'Doutora';
SELECT * FROM artigos WHERE fk_id_busca = 3;
SELECT * FROM nome_orientadores WHERE nome_orientador LIKE 'Dra.%';
SELECT * FROM pesquisador WHERE fk_id_nome_orientadores = 1;
SELECT * FROM nome_orientadores WHERE id_nome_orientador BETWEEN 1 AND 5;
SELECT * FROM pesquisador WHERE descricao LIKE '%Tecnologia%';

