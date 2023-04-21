/**
Eliminando base de dados
só executa se existir
*/
-- Aula 01
DROP DATABASE  IF EXISTS aula_banco; 

CREATE DATABASE aula_banco; -- criando a base de dados

USE aula_banco;

DROP TABLE IF EXISTS estado; -- eliminando tabela, só execute se existir 

CREATE TABLE estado(
id int not null auto_increment
,nome varchar(200) not null unique -- CONSTAINT INLINE ( REGRAS NA MESMA LINHA)
,sigla char(2) not null unique
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
-- ,check (ativo in ('S','N')) -- CONTRAINT OUT OF LINE ( REGRAS DEFINADA FORA DA  LINHA DEFINIÇÃO DA COLUNA) - REGRA SEM NOME
,constraint estado_ativo_deve_ser_S_ou_N check (ativo in ('S','N')) -- CONTRAINT OUT OF LINE ( REGRAS DEFINADA FORA DA  LINHA DEFINIÇÃO DA COLUNA) - REGRA COM NOME
,constraint pk_estado primary key (id)
);

-- INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) values (1,'São Paulo','SP','S','2023-04-18');
-- INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) values (2,'Paraná','PR','S','2023-04-18');

-- inserindo estados
INSERT INTO estado (nome,sigla) values ('Minas Gerais','MG');
INSERT INTO estado (nome,sigla) values ('São Paulo','SP');

SELECT id,nome,sigla,ativo,data_cadastro FROM estado;

-- Aula 01
-- DROP TABLE IF EXISTS cidade;
create table cidade (
id int not null auto_increment
,nome varchar(200) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,estado_id int not null
,constraint pk_cidade primary key (id)
,constraint fk_cidade_estado foreign key (estado_id) references estado (id)
,constraint cidade_ativo_deve_ser_S_ou_N check (ativo in ('S','N'))
,constraint cidade_unica unique(nome, estado_id)
);

-- inserindo Cidades
insert into cidade (nome,estado_id) values ('Sorocaba',1);
insert into cidade (nome,estado_id) values ('itu',1);
select * from cidade;

-- Aula 03
/**
>>> Alterações em Tabelas <<<
Caso ainda não estiver na produção, faça as alterações direto na tabela.
-> Fica mais clari e legivel.

Se a base de dados já está na produção, não tem jeito, precisa utilizar o ALTER - COM MUITO CUIDADO
/**








