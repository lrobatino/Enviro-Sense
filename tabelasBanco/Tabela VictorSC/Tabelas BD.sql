CREATE DATABASE Enviro_Sense_DB;
USE Enviro_Sense_DB;

CREATE TABLE Empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
NomeEmpresa varchar(45) NOT NULL,
Cnpj char(14),
EmailCorporativo varchar(100),
Telefone char(11)
); 
insert into Empresa (idEmpresa, NomeEmpresa, Cnpj, EmailCorporativo, Telefone) values
(default, 'FIAT', '12345678000190', 'contato@fiat.com.br', '11987654321'),
(default, 'TOYOTA', '56789012000134', 'contato@toyota.com.br', '11934567890'),
(default, 'CHEVROLET', '78901234000156', 'contato@chevrolet.com.br', '11912345678'),
(default, 'Honda', '90123456000178', 'contato@honda.com.br', '11923456789');


CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(45),
nomeUsuario VARCHAR(45),
email VARCHAR(100),
senha VARCHAR(100) NOT NULL,
dtNasc DATE,
telefone CHAR(11),
fkEmpresa int,
constraint fkUsuarioEmpresa foreign key (fkEmpresa)
	references Empresa(idEmpresa)
);
insert into Usuario (idUsuario , nome, nomeUsuario, email, senha, dtNasc, telefone, fkEmpresa) values
(default, 'Ana Carolina', 'ana.c', 'ana.silva@email.com', 'AnaC234@', '1990-06-06', '11912345789', 1),
(default, 'Joao Carlos', 'Joao_Carlos', 'Joao.Carlos@email.com', 'joaoC35678@', '1980-04-06', '11912337489', 2),
(default, 'Bruna Luise', 'Bruna-Luise', 'Bruna.Luise@email.com', 'BruunaL234@', '1970-08-12', '11912342437', 3),
(default, 'Carol Dias', 'Carol-Dias', 'Carol.Dias@email.com', 'CarolDiasC234@', '1990-10-06', '11912342347', 4),
(default, 'Pedro Barroso', 'Pedro_Barroso', 'Pedro.Barroso@email.com', 'PedroBC24562@', '1995-12-06', '1191234130', 1),
(default, 'Victor Alberto', 'Victor.Alberto1', 'Victor.Alberto1@email.com', 'VictorAl234@', '1980-01-20', '11912341352', 2),
(default, 'Jose Oliveira', 'Jose-Oliveira34', 'Jose.Oliveira34@email.com', 'JoseOli48@', '1970-04-30', '11912347490', 3),
(default, 'Julia Costa', 'Julia-Costa27', 'Julia.Costa27@email.com', 'JuiaCosta23451@', '1991-11-10', '11912342317', 4);

CREATE TABLE Sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipoSensor Varchar(10), 
dtInstalacao DATE,
fkEmpresa int,
constraint fkSensorEmpresa foreign key (fkEmpresa)
	references Empresa(idEmpresa)
);
insert into Sensor (idSensor , tipoSensor, dtInstalacao, fkEmpresa) values
(default, 'MQ-2 1.0', '2024-05-05', 1),
(default, 'MQ-2 1.1', '2024-01-10', 1),
(default, 'MQ-2 2.0', '2024-02-05', 2),
(default, 'MQ-2 2.1', '2024-04-12', 2),
(default, 'MQ-2 3.0', '2024-07-20', 3),
(default, 'MQ-2 3.1', '2024-02-10', 3),
(default, 'MQ-2 4.0', '2024-03-15', 4),
(default, 'MQ-2 4.1', '2024-06-14', 4);

CREATE TABLE Registros(
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
nvEmissaoCOV VARCHAR(20),
nvAlerta VARCHAR(20),
dtMedicao datetime default current_timestamp,
fkSensor int,
constraint fkSensorRegistro foreign key (fkSensor)
	references Sensor(idSensor)
);
insert into Registros (idRegistro , nvEmissaoCOV, nvAlerta, dtMedicao,fkSensor) values
(default, '0.60', 'Padrão',now(), 1),
(default, '0.35', 'Abaixo',now(), 2),
(default, '0.40', 'Abaixo',now(), 3),
(default, '0.50', 'Abaixo',now(), 4),
(default, '0.90', 'Grave',now(), 5),
(default, '0.150', 'Grave',now(), 6),
(default, '0.120', 'Grave',now(), 7),
(default, '0.70', 'Grave',now(), 8);



