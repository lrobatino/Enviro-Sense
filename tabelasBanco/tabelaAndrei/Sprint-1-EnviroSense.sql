create database EnviroSense;
use EnviroSense;

create table cadastro (
idCadastro int primary key auto_increment,
nomeEmpresa varchar(45) not null,
cnpj varchar(15) not null,
email varchar(45),
telefone varchar(15),
endereco varchar(50),
senha varchar(100) not null
);

desc cadastro;

insert into cadastro (nomeEmpresa, cnpj, email, telefone, endereco, senha) values
('FIAT', '12345678900001', 'contato@fiat.com.br', '(11) 1234-5678', 'Avenida das Rodas, 123', 'senha123'),
('TOYOTA', '98765432100002', 'contato@toyota.com.br', '(22) 9876-5432', 'Rua dos Motores, 456', 'senha456'),
('CHEVROLET', '55555555500003', 'contato@chevrolet.com.br', '(33) 5555-5555', 'Estrada das Peças, 789', 'senha789'),
('Mercedes-Benz', '12345678900011', 'contato@mercedes.com.br', '(11) 9876-5432', 'Avenida das Estrelas, 789', 'senhaMB'),
('Honda', '98765432100012', 'contato@honda.com.br', '(22) 1234-5678', 'Rua dos Motores, 789', 'senhaHonda'),
('Audi', '55555555500013', 'contato@audi.com.br', '(33) 5555-1234', 'Estrada dos Sonhos, 456', 'senhaAudi'),
('Hyundai', '11111111100014', 'contato@hyundai.com.br', '(99) 1111-2222', 'Avenida dos Motores, 987', 'senhaHyundai'),
('Porsche', '22222222200015', 'contato@porsche.com.br', '(44) 2222-3333', 'Rua das Curvas, 123', 'senhaPorsche'),
('VOLKSWAGEN', '11111111100010', 'contato@vw.com.br', '(99) 1111-1111', 'Avenida dos Volantes, 987', 'senha987');

select * from cadastro;

create table sensor (
idSensor int primary key auto_increment,
nomeEmpresa varchar(45) not null,
dtMedicao date not null,
qtdChamines int not null,
qtdSensores int not null,
qtdCOV decimal(10,3) not null
);

desc sensor;

insert into sensor (nomeEmpresa, dtMedicao, qtdChamines, qtdSensores, qtdCOV) values
('FIAT', '2024-09-02', 1, 4, 23000.351),
('FIAT', '2024-09-03', 1, 4, 24350.328),
('FIAT', '2024-09-04', 1, 4, 28423.558),
('FIAT', '2024-09-05', 1, 4, 21458.934),
('FIAT', '2024-09-06', 1, 4, 23254.796),
('FIAT', '2024-09-07', 1, 4, 22669.781),
('FIAT', '2024-09-08', 1, 4, 23481.381),
('FIAT', '2024-09-09', 1, 4, 23054.252);

select * from sensor;

create table Limite (
idLimite int primary key auto_increment,
dtMedicao date,
nomeEmpresa varchar(45) not null,
tipoVeiculo varchar(45) not null,
constraint chkTipoVeiculo
	check (tipoVeiculo in ('carro', 'caminhão', 'ônibus')),
areaVeiculo decimal(5,2) not null,
qtdVeiculos int not null,
limiteTipoVeiculo int not null,
limiteDiario decimal(10,3) not null
);

desc limite;

insert into limite (dtMedicao, nomeEmpresa, tipoVeiculo, areaVeiculo, qtdVeiculos, limiteTipoVeiculo, limiteDiario) values
('2024-09-02', 'FIAT','carro', 30, 20, 45, 27000.000),
('2024-09-03', 'FIAT','carro', 30, 20, 45, 27000.000),
('2024-09-04', 'FIAT','carro', 30, 20, 45, 27000.000),
('2024-09-05', 'FIAT','carro', 30, 20, 45, 27000.000),
('2024-09-06', 'FIAT','carro', 30, 20, 45, 27000.000),
('2024-09-07', 'FIAT','carro', 30, 20, 45, 27000.000),
('2024-09-08', 'FIAT','carro', 30, 20, 45, 27000.000),
('2024-09-09', 'FIAT','carro', 30, 20, 45, 27000.000);

select * from limite;
