/*Criação das tabelas*/
CREATE TABLE PESSOA (
    cpf CHAR(14) PRIMARY KEY,
    nome VARCHAR(90),
    email VARCHAR(140),
    telefone VARCHAR(20)
);

CREATE TABLE ALUNO (
    dt_aniver DATE,
    fk_MODALIDADE_codigo INTEGER,
    senha VARCHAR(255),
    fk_PESSOA_cpf CHAR(14),
    cod INTEGER PRIMARY KEY
);

CREATE TABLE MODALIDADE (
    codigo INTEGER PRIMARY KEY,
    nome_modalidade VARCHAR(20),
    preco FLOAT
);

CREATE TABLE PROFESSOR (
    matricula VARCHAR(15) PRIMARY KEY,
    fk_PESSOA_cpf CHAR(14),
    salario FLOAT
);

CREATE TABLE PLANILHA (
    numero_planilha INTEGER PRIMARY KEY,
    objetivo VARCHAR(50),
    dt_inic DATE,
    dt_fim DATE,
    fk_PROFESSOR_matricula VARCHAR(15),
	fk_ALUNO_cod INTEGER
);

CREATE TABLE EXERCICIO (
    cod_exerc INTEGER PRIMARY KEY,
    fk_DESCANSO_cod INTEGER,
    fk_NOME_EXERCICIO_cod INTEGER,
    fk_REP_EXERCICIO_cod INTEGER,
    fk_SERIES_EXERCICIO_cod INTEGER
);

CREATE TABLE PRATICA (
    fk_ALUNO_cod INTEGER,
    fk_MODALIDADE_codigo INTEGER
);

CREATE TABLE POSSUI (
    fk_EXERCICIO_cod_exer INTEGER,
    fk_PLANILHA_numero_planilha INTEGER
);

CREATE TABLE DESCANSO (
    cod INTEGER PRIMARY KEY,
    descanso CHAR(4)
);

CREATE TABLE NOME_EXERCICIO (
    cod INTEGER PRIMARY KEY,
    nome VARCHAR(30)
);

CREATE TABLE REP_EXERCICIO (
    cod INTEGER PRIMARY KEY,
    rep INTEGER
);

CREATE TABLE SERIES_EXERCICIO (
    cod INTEGER PRIMARY KEY,
    series INTEGER
);
/*Fim da criação de tabelas*/

/*--------------------------------------------------------------------------------------*/

/*Criação das chaves estrangeiras*/ 
ALTER TABLE ALUNO ADD CONSTRAINT fk_PESSOA_cpf
FOREIGN KEY (fk_PESSOA_cpf) REFERENCES PESSOA(cpf);

ALTER TABLE PROFESSOR ADD CONSTRAINT fk_PESSOA_cpf
FOREIGN KEY (fk_PESSOA_cpf) REFERENCES PESSOA(cpf);

ALTER TABLE PLANILHA ADD CONSTRAINT fk_ALUNO_cod
FOREIGN KEY (fk_ALUNO_cod) REFERENCES ALUNO(cod);

ALTER TABLE PLANILHA ADD CONSTRAINT fk_PROFESSOR_matricula
FOREIGN KEY (fk_PROFESSOR_matricula) REFERENCES PROFESSOR(matricula);

ALTER TABLE EXERCICIO ADD CONSTRAINT fk_NOME_EXERCICIO_cod
FOREIGN KEY (fk_NOME_EXERCICIO_cod) REFERENCES NOME_EXERCICIO(cod);

ALTER TABLE EXERCICIO ADD CONSTRAINT fk_DESCANSO_cod
FOREIGN KEY (fk_DESCANSO_cod) REFERENCES DESCANSO(cod);

ALTER TABLE EXERCICIO ADD CONSTRAINT fk_REP_EXERCICIO_cod
FOREIGN KEY (fk_REP_EXERCICIO_cod) REFERENCES REP_EXERCICIO(cod);

ALTER TABLE EXERCICIO ADD CONSTRAINT fk_SERIES_EXERCICIO_cod
FOREIGN KEY (fk_SERIES_EXERCICIO_cod) REFERENCES SERIES_EXERCICIO(cod);

ALTER TABLE PRATICA ADD CONSTRAINT fk_ALUNO_cod
FOREIGN KEY (fk_ALUNO_cod) REFERENCES ALUNO(cod);

ALTER TABLE PRATICA ADD CONSTRAINT fk_MODALIDADE_codigo
FOREIGN KEY (fk_MODALIDADE_codigo) REFERENCES MODALIDADE(codigo);

ALTER TABLE POSSUI ADD CONSTRAINT fk_PLANILHA_numero_planilha
FOREIGN KEY (fk_PLANILHA_numero_planilha) REFERENCES PLANILHA(numero_planilha);

ALTER TABLE POSSUI ADD CONSTRAINT fk_EXERCICIO_cod_exer
FOREIGN KEY (fk_EXERCICIO_cod_exer) REFERENCES EXERCICIO(cod_exerc);
/*Fim da criação de chaves estrangeiras*/

/*--------------------------------------------------------------------------------------*/

/*Inserção de dados nas tabelas*/
INSERT INTO PESSOA VALUES
	('453.447.353-24','Lucas','lucas@gmail.com','(83) 3171-4395'),
	('292.874.721-49','Cláudia','claudia@hotmail.com','(24) 2575-7435'),
	('386.584.541-00','Ana','ana@gmail.com','83) 2752-7755'),
	('324.043.887-97','Osvaldo','osvaldo@yahoo.com','(68) 3661-4048'),
	('149.731.366-03','Felipe','felipe@gmail.com','(96) 3596-6098'),
	('724.449.612-50','Gabriel','gabriel@outlook.com','(83) 2724-4347'),
	('214.526.458-25','João','joao@gmail.com','(82) 3553-8275'),
	('508.775.845-24','Daniela','daniela@gmail.com','(28) 3625-4323'),
	('251.654.334-47','Maria','maria@outlook.com','(88) 3171-7726'),
	('527.745.842-56','Bruno','bruno@outlook.com','(83) 3265-5668');

INSERT INTO PROFESSOR VALUES
	('Acad2022-1','386.584.541-00',2000),
	('Acad2022-2','324.043.887-97',1900),
	('Acad2022-3','724.449.612-50',1500);

INSERT INTO ALUNO (dt_aniver,senha,fk_PESSOA_cpf,cod) VALUES
	('1993-11-16','OLi73BtT5KA#','453.447.353-24',1),
	('1995-02-05','41Z&P297Em1o','292.874.721-49',2),
	('2004-04-05','E#wY3TXTGj7Z','149.731.366-03',3),
	('2003-05-19','ylfza1$[DPW{','214.526.458-25',4),
	('2004-12-04','tcy*A$ty>]Cq','508.775.845-24',5),
	('2001-05-01','X.kZxM|@2?ll','251.654.334-47',6),
	('1999-06-18','X}RH(T]2ONOl','527.745.842-56',7);

INSERT INTO MODALIDADE VALUES
	(1,'musculação',90),
	(2,'muay thai',70),
	(3,'Jiu-jitsu',70),
	(4,'dança',80);

INSERT INTO PRATICA VALUES
	(1,1),
	(1,2),
	(2,4),
	(3,4),
	(3,1),
	(4,1),
	(5,3),
	(6,3),
	(7,3),
	(7,1);

INSERT INTO NOME_EXERCICIO VALUES
	(1,'Supino reto'),
	(2,'Crucifixo inclinado'),
	(3,'Rosca direta barra'),
	(4,'Agachamento'),
	(5,'Flexora vertical'),
	(6,'Puxada pegada pronada'),
	(7,'Puxada pegada neutra triângulo'),
	(8,'Leg press'),
	(9,'Cadeira abdutora'),
	(10,'Cadeira adutora'),
	(11,'Tríceps corda'),
	(12,'Tríceps francês'),
	(13,'Tríceps testa'),
	(14,'Rosca martelo'),
	(15,'Remada baixa pegada supinada');

INSERT INTO SERIES_EXERCICIO VALUES
	(1,3),
	(2,4),
	(3,10),
	(4,5);

INSERT INTO REP_EXERCICIO VALUES
	(1,6),
	(2,8),
	(3,12),
	(4,15),
	(5,25);

INSERT INTO DESCANSO VALUES
	(1,30),
	(2,40),
	(3,45,
	(4,60),
	(5,90),
	(6,120);

INSERT INTO EXERCICIO VALUES
	(1,4,1,1,2),
	(2,1,9,4,1),
	(3,6,4,1,4),
	(4,2,3,3,2),
	(5,3,11,3,1),
	(6,6,8,1,2),
	(7,4,6,3,2),
	(8,4,4,3,3),
	(9,2,14,4,1),
	(10,3,10,5,4),
	(11,2,13,3,2),
	(12,6,1,5,4),
	(13,5,11,1,2),
	(14,4,3,1,1),
	(15,1,1,5,2);
	
INSERT INTO PLANILHA VALUES
	(1,'hipertrofia','2022-10-08','2022-11-15','Acad2022-1',1),
	(2,'força','2022-09-25','2022-10-30','Acad2022-2',2),
	(3,'resistência','2022-09-30','2022-10-31','Acad2022-3',3),
	(4,'emagrecer','2022-08-31','2022-10-25','Acad2022-1',4),
	(5,'hipertrofia','2022-10-01','2022-11-02','Acad2022-1',5),
	(6,'força','2022-10-12','2022-12-01','Acad2022-2',6),
	(7,'hipertrofia','2022-09-03','2022-10-05','Acad2022-1',7);

INSERT INTO POSSUI (fk_planilha_numero_planilha, fk_exercicio_cod_exer) VALUES
	(1,4),
	(1,5),
	(1,7),
	(1,8),
	(1,11),
	(2,1),
	(2,3),
	(2,6),
	(2,13),
	(3,2),
	(3,9),
	(3,10),
	(3,12),
	(3,15),
	(4,1),
	(4,6),
	(4,14),
	(4,11),
	(5,5),
	(5,9),
	(5,10),
	(5,15);
/*Fim da inserção de dados nas tabelas*/

/*--------------------------------------------------------------------------------------*/
