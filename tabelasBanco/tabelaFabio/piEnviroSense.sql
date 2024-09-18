create database pi;

use pi;

create table empresa(
	id int primary key auto_increment,
    nomeEmpresa varchar(100),
    nome varchar(100),
    cnpj varchar(18),
    email varchar(100),
    senha varchar(50),
    telefone varchar(15),
    endereco varchar(100)
);

insert into empresa values
	(default, 'PinturaBrasil', 'João', '12.354.605/4346-40', 'joao@pBrasil.com', '123', '(15) 97450-3455', 'Rua São João, 213'),
    (default, 'AutomovelPaint', 'Larissa', '45.687.323/1324-96', 'larissa@automovel.paint', '321', '(11) 97854-9632', 'Rua Macarena, 80'),
    (default, 'PinturaMovel', 'Davi', '65.125.485/6447-45', 'davi@pinturaMovel.br', 'senha', '(15) 97892-6336', 'Rua SPTech, 998');
    
select * from empresa;
select * from empresa
	where nomeEmpresa like '%l';

create table sensor(
	id int primary key auto_increment,
    cov float,
    dtHoraEmissao datetime
);

insert into sensor values
	(default, 125, '2024-05-25 09:25:00'),
    (default, 84, '2023-01-14 16:24:15'),
    (default, 60, '2013-06-18 19:30:55');
    
select * from sensor
	where cov > 60;
select cov as 'Composto orgânico volátil emitido',
	dtHoraEmissao as 'Data e hora da emissão'
    from sensor;

create table veiculo(
	id int primary key auto_increment,
    tipo varchar(20),
    area float,
    quantidadeMes int
);

insert into veiculo values
	(default, 'automóvel', 25, 30),
    (default, 'caminhão', 50, 60),
    (default, 'ônibus', 80, 20);

select * from veiculo
	where area < 70;
select * from veiculo
	where id = 1;
    
create table tinta(
	id int primary key auto_increment,
    nome varchar(50),
    peso float,
    conteudoCov float
);

insert into tinta values
	(default, 'Primer', 25, 10),
    (default, 'Verniz', 30, 25),
    (default, 'Acrílica', 5, 56);

select * from tinta order by nome;
select * from tinta order by id desc;

create table licenca(
	id int primary key auto_increment,
    atividade varchar (100),
    valorLimite int,
    apos2007 char(3),
    constraint chkApos2007 check(apos2007 in('Sim', 'Não'))
);

insert into licenca values
	(default, 'Automóvel', 60, 'Não'),
    (default, 'Automóvel', 45, 'Sim'),
    (default, 'Cabine de caminhões, carrocerias de veículos utilitários, pick-up e caminhonete', 90, 'Não');
    
select atividade, valorLimite from licenca;
select * from licenca
	where apos2007 = 'Não'