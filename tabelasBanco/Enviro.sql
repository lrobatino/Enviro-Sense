create database enviro;
use enviro;

CREATE TABLE Fabrica (
    idFabrica INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) UNIQUE,
    qtdCabine INT,
    codAtivacao CHAR(5)
);

INSERT INTO Fabrica (nome, qtdCabine, codAtivacao)
VALUES
('Fábrica A', 5, 'A0001'),
('Fábrica B', 8, 'B0002'),
('Fábrica C', 10, 'C0003'),
('Fábrica D', 12, 'D0004'),
('Fábrica E', 12, 'E0005'),
('Fábrica F', 12, 'F0006'),
('Fábrica G', 10, 'G0007'),
('Fábrica H', 8, 'H0008'),
('Fábrica I', 6, 'I0009'),
('Fábrica J', 4, 'J0010'),
('Fábrica K', 3, 'K0011');



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

INSERT INTO Cabine (idCabine, fkFabrica)
VALUES
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 4),
(9, 4),
(10, 5),
(11, 5),
(12, 6);

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



INSERT INTO Sensor (idSensor, dtInstalacao, fkCabine, fkCabineFabrica) 
VALUES
(2, '2024-12-04 08:00:00', 1, 2),
(3, '2024-12-04 08:05:00', 2, 1),
(4, '2024-12-04 08:10:00', 3, 2),
(5, '2024-12-04 08:15:00', 4, 2),
(6, '2024-12-04 08:20:00', 5, 3),
(7, '2024-12-04 08:25:00', 6, 3),
(8, '2024-12-04 08:30:00', 7, 4),
(9, '2024-12-04 08:35:00', 8, 4),
(10, '2024-12-04 08:40:00', 9, 5),
(11, '2024-12-04 08:45:00', 10, 5),
(12, '2024-12-04 08:50:00', 11, 6);


select * FROM Sensor;

INSERT INTO Sensor VALUES 
	(1,now(),1,1);


CREATE TABLE Alertas (
    idAlerta INT AUTO_INCREMENT,
    fkSensor INT,
    fkSensorCabine INT,
    fkSensorCabineFabrica INT,
    tipoAlerta VARCHAR(45),
    dtAlerta DATETIME,
    FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    PRIMARY KEY(idAlerta, fkSensor, fkSensorCabine, fkSensorCabineFabrica)
);

INSERT INTO Alertas (fkSensor, fkSensorCabine, fkSensorCabineFabrica, tipoAlerta, dtAlerta)
VALUES 
    -- Alertas para fkSensor 2
    (2, 1, 1, 'Perigo', '2024-12-01 14:30:00'),
    (2, 2, 2, 'Aviso', '2024-12-01 15:00:00'),

    -- Alertas para fkSensor 3
    (3, 1, 1, 'Perigo', '2024-12-02 09:10:00'),
    (3, 2, 2, 'Aviso', '2024-12-02 09:45:00'),
    (3, 3, 1, 'Perigo', '2024-12-02 10:30:00'),

    -- Alertas para fkSensor 4
    (4, 1, 2, 'Aviso', '2024-12-03 08:00:00'),
    (4, 2, 3, 'Aviso', '2024-12-03 08:45:00'),
    (4, 3, 1, 'Perigo', '2024-12-03 09:30:00'),
    (4, 3, 2, 'Perigo', '2024-12-03 10:15:00'),

    -- Alertas para fkSensor 5
    (5, 1, 1, 'Perigo', '2024-12-04 11:00:00'),
    (5, 1, 2, 'Aviso', '2024-12-04 11:30:00'),
    (5, 2, 3, 'Aviso', '2024-12-04 12:00:00'),
    (5, 3, 1, 'Perigo', '2024-12-04 12:45:00'),

    -- Alertas para fkSensor 6
    (6, 2, 2, 'Perigo', '2024-12-05 08:15:00'),
    (6, 3, 3, 'Aviso', '2024-12-05 09:00:00'),

    -- Alertas para fkSensor 7
    (7, 1, 2, 'Aviso', '2024-12-06 08:30:00'),
    (7, 2, 3, 'Perigo', '2024-12-06 09:00:00'),
    (7, 3, 1, 'Aviso', '2024-12-06 10:15:00'),
    (7, 3, 2, 'Perigo', '2024-12-06 11:00:00'),

    -- Alertas para fkSensor 8
    (8, 1, 1, 'Perigo', '2024-12-07 08:00:00'),
    (8, 2, 2, 'Aviso', '2024-12-07 09:30:00'),

    -- Alertas para fkSensor 9
    (9, 3, 3, 'Aviso', '2024-12-08 10:45:00'),
    (9, 1, 1, 'Perigo', '2024-12-08 11:15:00'),
    (9, 2, 2, 'Perigo', '2024-12-08 12:00:00'),

    -- Alertas para fkSensor 10
    (10, 3, 1, 'Aviso', '2024-12-09 08:00:00'),
    (10, 3, 2, 'Perigo', '2024-12-09 09:00:00'),
    (10, 1, 3, 'Aviso', '2024-12-09 10:30:00'),

    -- Alertas para fkSensor 11
    (11, 2, 1, 'Aviso', '2024-12-10 08:00:00'),
    (11, 3, 2, 'Perigo', '2024-12-10 09:00:00'),

    -- Alertas para fkSensor 12
    (12, 1, 3, 'Perigo', '2024-12-11 10:30:00'),
    (12, 2, 1, 'Aviso', '2024-12-11 11:15:00'),
    (12, 3, 2, 'Perigo', '2024-12-11 12:00:00'),
    (12, 3, 3, 'Aviso', '2024-12-11 12:45:00');




select * from Alertas;

select tipoAlerta, count(*) as qtdAlertas from Alertas group by tipoAlerta;

SELECT 
    sum(count(tipoAlerta)) as qtdAlertas
FROM
    Alertas
GROUP BY fkSensor;

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





