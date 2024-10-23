create database enviro;
use enviro;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45), 
email varchar(100), 
cnpj char(14), 
telefone char(11));

create table funcionario (
idFuncionario int auto_increment,
fkEmpresa int,
	primary key(idFuncionario, fkEmpresa),
nome varchar(45),
dtNasc date,
fkSupervisor int,
	constraint fkSupervisorFunc foreign key (fkSupervisor) 
		references funcionario (idFuncionario),
	constraint fkEmpresaFunc foreign key (fkEmpresa)
		references empresa (idEmpresa)
    );
    
    
create table fabrica (
idFabrica int auto_increment,
fkEmpresa int,
	primary key(idFabrica, fkEmpresa),
nome varchar(45),
	constraint fkEmpresaFabrica foreign key (fkEmpresa)
		references empresa (idEmpresa));
        
create table endereco (
idEndereco int primary key auto_increment,
logradouro varchar(45),
cep char(8),
numero int,
bairro varchar(45),
cidade varchar(45),
fkFabrica int,
fkEmpresa int,
	constraint fkFabricaEndereco foreign key (fkFabrica)
    references fabrica (idFabrica),
    constraint fkEmpresaEndereco foreign key (fkEmpresa)
    references empresa (idEmpresa));
    

create table cabine (
idCabine int,
qtdAlerta int,
fkFabrica int,
fkEmpresaFabrica int,
fkSensor int,
	primary key (idCabine, fkFabrica, fkEmpresaFabrica),
    constraint fkFabricaCabine foreign key (fkFabrica)
    references fabrica (idFabrica),
    constraint fkEmpresaFabricaCabine foreign key (fkEmpresaFabrica)
    references empresa (idEmpresa));
    
create table sensor (
idSensor int primary key auto_increment,
tipoSensor varchar(10),
dtInstalacao date);

create table registros (
idRegistro int auto_increment,
nvMedicao varchar(20),
nvAlerta varchar(20),
dtRegistro date,
fkSensor int,
	primary key(idRegistro, fkSensor),
    constraint fkSensorRegistros foreign key (fkSensor)
    references sensor (idSensor));
    

INSERT INTO empresa (nome, email, cnpj, telefone) VALUES 
	('LAAV São Bernardo', 'contato@laavsbc.com', '12345678000195', '11987654321'),
	('TK Garage', 'contato@tkgarage.com', '98765432000100', '11876543210'),
	('High Color Pinturas', 'contato@highcolor.com', '13579246000112', '11765432109'),
	('Axalta Coating', 'contato@axalta.com', '24680135000198', '11654321098'),
	('Lazzuril', 'contato@lazzuril.com', '10203040500145', '11543210987');

INSERT INTO funcionario (idFuncionario, fkEmpresa, nome, dtNasc, fkSupervisor) VALUES 
	(1, 1, 'João Silva', '1985-06-15', NULL),
	(2, 1, 'Maria Oliveira', '1990-08-22', 1),
	(3, 2, 'Carlos Santos', '1988-04-05', NULL),
	(4, 2, 'Ana Costa', '1995-12-30', 3),
	(5, 3, 'Ricardo Lima', '1980-02-18', NULL);
    
INSERT INTO fabrica (idFabrica, fkEmpresa, nome) VALUES 
	(1, 1, 'Fábrica SBC'),
	(2, 1, 'Fábrica SP'),
	(3, 2, 'Fábrica Ribeirão Pires'),
	(4, 3, 'Fábrica Campinas'),
	(5, 4, 'Fábrica Botucatu');
    
INSERT INTO endereco (logradouro, cep, numero, bairro, cidade, fkFabrica, fkEmpresa) VALUES 
	('Rua das Flores', '01234567', 100, 'Jardim Primavera', 'Cidade Verde', 1, 1),
	('Avenida dos Sonhos', '07654321', 200, 'Bairro Esperança', 'Nova Luz', 2, 1),
	('Rua do Progresso', '09876543', 300, 'Vila Nova', 'São Futuro', 3, 2),
	('Travessa da Alegria', '12345678', 400, 'Bairro das Estrelas', 'Luz do Sol', 4, 3),
	('Avenida do Conhecimento', '87654321', 500, 'Vila Esperança', 'Cidade do Amanhã', 5, 4);

INSERT INTO cabine (idCabine, qtdAlerta, fkFabrica, fkEmpresaFabrica, fkSensor) VALUES 
	(1, 5, 1, 1, 1),
	(2, 10, 2, 1, 2),
	(3, 3, 3, 2, 3),
	(4, 8, 4, 3, 4),
	(5, 6, 5, 4, 5);
    
INSERT INTO sensor (idSensor, tipoSensor, dtInstalacao) VALUES 
	(1, 'gás', '2023-01-01'),
	(2, 'gás', '2023-02-01'),
	(3, 'gás', '2023-03-01'),
	(4, 'gás', '2023-04-01'),
	(5, 'gás', '2023-05-01');
    

select * from empresa;
select * from funcionario; 
select * from fabrica; 
select * from endereco; 
select * from cabine; 
select * from sensor;

	SELECT 
    f.nome AS 'Nome Funcionario', 
    e.nome AS 'Nome Empresa'
FROM 
    funcionario f
JOIN 
    empresa e ON f.fkEmpresa = e.idEmpresa;
    
    SELECT 
    en.cidade AS Cidade, 
    e.nome AS 'Nome Empresa'
FROM 
    fabrica f
JOIN 
    endereco en ON f.idFabrica = en.fkFabrica
JOIN 
    empresa e ON en.fkEmpresa = e.idEmpresa;

    
    
    
    









    