create database enviro;
use enviro;

CREATE TABLE Fabrica (
    idFabrica INT PRIMARY KEY,
    nome VARCHAR(45),
    qtdCabine INT,
    codAtivacao CHAR(5)
);

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY,
    cep CHAR(9),
    cidade VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    logradouro VARCHAR(100),
    fkFabrica INT,
    FOREIGN KEY (fkFabrica) REFERENCES Fabrica(idFabrica)
);

CREATE TABLE Funcionario (
    idFuncionario INT,
    fkFabrica INT,
		PRIMARY KEY(idFuncionario, fkFabrica),
    nome VARCHAR(45),
    email VARCHAR(100),
    senha VARCHAR(25),
    FOREIGN KEY (fkFabrica) REFERENCES Fabrica(idFabrica)
);

CREATE TABLE areas (
    fkFuncionario INT,
    fkFabrica INT,
    fkSupervisor INT,
    nome VARCHAR(45),
    FOREIGN KEY (fkFuncionario) REFERENCES Funcionario(idFuncionario),
    FOREIGN KEY (fkFabrica) REFERENCES Fabrica(idFabrica),
    PRIMARY KEY (fkFuncionario, fkFabrica, fkSupervisor)
);

CREATE TABLE Cabine (
    idCabine INT PRIMARY KEY,
    fkFabrica INT,
    FOREIGN KEY (fkFabrica) REFERENCES Fabrica(idFabrica)
);

CREATE TABLE Sensor (
    idSensor INT,
    tipoSensor VARCHAR(45),
    dtInstalacao DATE,
    fkCabine INT,
    fkCabineFabrica INT,
    FOREIGN KEY (fkCabine) REFERENCES Cabine(idCabine),
    FOREIGN KEY (fkCabineFabrica) REFERENCES Fabrica(idFabrica),
    PRIMARY KEY(idSensor, fkCabine, fkCabineFabrica)
);

CREATE TABLE Alertas (
    idAlerta INT,
    fkSensor INT,
    fkSensorCabine INT,
    fkSensorCabineFabrica INT,
    tipoAlerta VARCHAR(45),
    dtAlerta DATETIME,
    FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY(idAlerta, fkSensor, fkSensorCabine, fkSensorCabineFabrica)
);

CREATE TABLE Registros (
    idRegistro INT,
    nvMedicao VARCHAR(20),
    dtRegistro DATETIME,
    fkSensor INT,
    FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY(idRegistro, fkSensor)
);




