create database enviro;
use enviro;

CREATE TABLE Fabrica (
    idFabrica INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) UNIQUE,
    qtdCabine INT,
    codAtivacao CHAR(5)
);


select * from Fabrica;


CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(9),
    cidade VARCHAR(45),
    bairro VARCHAR(45),
    numero INT,
    logradouro VARCHAR(100),
    fkFabrica varchar(45),
    FOREIGN KEY (fkFabrica) REFERENCES Fabrica(nome)
);

select * from endereco;

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
INSERT INTO Cabine VALUES (1,1);
CREATE TABLE Sensor (
    idSensor INT,
    dtInstalacao DATETIME,
    fkCabine INT,
    fkCabineFabrica INT,
    FOREIGN KEY (fkCabine) REFERENCES Cabine(idCabine),
    FOREIGN KEY (fkCabineFabrica) REFERENCES Fabrica(idFabrica),
    PRIMARY KEY(idSensor, fkCabine, fkCabineFabrica)
);

select * FROM Sensor;

INSERT INTO Sensor VALUES 
	(1,now(),1,1);


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
    idRegistro INT AUTO_INCREMENT,
    nvMedicao VARCHAR(20),
    dtRegistro DATETIME,
    zonaPerigo INT,
    zonaAviso INT,
    fkSensor INT,
    FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY(idRegistro, fkSensor)
);


select * from Registros;

SELECT 
    TRUNCATE(AVG(nvMedicao), 0) AS media
FROM
    Registros
WHERE
    DATE(dtRegistro) = CURDATE();

SELECT 
    TRUNCATE(AVG(nvMedicao), 0) AS media
FROM
    Registros
WHERE
    DATE(dtRegistro) BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE();
    
SELECT 
    TRUNCATE(nvMedicao, 0)  nivelCOV,
    TIME(dtRegistro) horaRegistro,
    zonaPerigo,
    zonaAviso
FROM
    Registros
ORDER BY dtRegistro desc limit 1;





