CREATE DATABASE enviro;
USE enviro;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT, 
email VARCHAR(100), 
senha VARCHAR(32),
cnpj CHAR(14),
nomeFantasia VARCHAR(50),
razaoSocial VARCHAR(50),
telefone CHAR(11),
email2 VARCHAR(100),
telefone2 CHAR(11));

CREATE TABLE funcionario (
idFuncionario INT AUTO_INCREMENT,
fkEmpresa INT,
	PRIMARY KEY(idFuncionario, fkEmpresa),
nome VARCHAR(45),
dtNasc DATE,
fkSupervisor INT,
	CONSTRAINT fkSupervisorFunc FOREIGN KEY (fkSupervisor) 
		REFERENCES funcionario (idFuncionario),
	CONSTRAINT fkEmpresaFunc FOREIGN KEY (fkEmpresa)
		REFERENCES empresa (idEmpresa)
    );
    
    
CREATE TABLE fabrica (
idFabrica INT AUTO_INCREMENT,
fkEmpresa INT,
	PRIMARY KEY(idFabrica, fkEmpresa),
nome VARCHAR(45),
limiteDeAlerta VARCHAR(45),
	CONSTRAINT fkEmpresaFabrica FOREIGN KEY (fkEmpresa)
		REFERENCES empresa (idEmpresa));
        
CREATE TABLE endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
logradouro VARCHAR(45),
cep CHAR(8),
numero INT,
bairro VARCHAR(45),
fkFabrica INT,
fkEmpresa INT,
	CONSTRAINT fkFabricaEndereco FOREIGN KEY (fkFabrica)
    REFERENCES fabrica (idFabrica),
    CONSTRAINT fkEmpresaEndereco FOREIGN KEY (fkEmpresa)
    REFERENCES empresa (idEmpresa));
    

CREATE TABLE cabine (
idCabine INT,
qtdAlerta INT,
fkFabrica INT,
fkEmpresaFabrica INT,
fkSensor INT,
	PRIMARY KEY (idCabine, fkFabrica, fkEmpresaFabrica),
    CONSTRAINT fkFabricaCabine FOREIGN KEY (fkFabrica)
    REFERENCES fabrica (idFabrica),
    CONSTRAINT fkEmpresaFabricaCabine FOREIGN KEY (fkEmpresaFabrica)
    REFERENCES empresa (idEmpresa));
    
CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipoSensor VARCHAR(10),
dtInstalacao DATE);

CREATE TABLE registros (
idRegistro INT AUTO_INCREMENT,
nvMedicao VARCHAR(20),
nvAlerta VARCHAR(20),
dtRegistro DATE,
fkSensor INT,
	PRIMARY KEY(idRegistro, fkSensor),
    CONSTRAINT fkSensorRegistros FOREIGN KEY (fkSensor)
    REFERENCES sensor (idSensor));
    
    
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

    
    
    
    









    