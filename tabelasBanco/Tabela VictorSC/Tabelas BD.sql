CREATE DATABASE Enviro_Sense_DB;
USE Enviro_Sense_DB;

CREATE TABLE Empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
NomeEmpresa varchar(45) NOT NULL,
Cnpj char(14),
EmailCorporativo varchar(45),
Senha varchar(45) NOT NULL,
Telefone char(11)
); 

CREATE TABLE Usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(45),
email VARCHAR(45),
senha VARCHAR(30),
dtNasc DATE,
telefone CHAR(11)
);

CREATE TABLE Veiculos(
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
Modelo_veiculo VARCHAR(45),
Area_superficial VARCHAR(10),
Qtde_carrocerias INT
);

CREATE TABLE Tintas(
tipoTinta varchar(45),
tipoPrimer varchar(45),
qtdTinta varchar(5),
qtdPrimer varchar(5)
);

CREATE TABLE Sensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipoSensor Varchar(10), 
dtInstalacao DATE
);

CREATE TABLE Registros(
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
nvEmissaoCOV VARCHAR(20),
nvAlerta VARCHAR(20),
dtMedicao datetime default current_timestamp
);




