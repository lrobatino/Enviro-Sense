CREATE DATABASE eviroSense;
USE enviroSense;


CREATE TABLE cadastroFabrica(
cnpj INT PRIMARY KEY,
nomeResponsavel VARCHAR(45),
endereco VARCHAR(100),
email VARCHAR(100),
senha VARCHAR(45),
tipoVeiculo VARCHAR(45),
qtdVeiculos INT,
anoLicenca DATE
);


INSERT INTO cadastroFabrica (cnpj, nomeResponsavel, endereco, email, senha, tipoVeiculo, qtdVeiculos, anoLicenca)
VALUES(12352, 'João','AV.Paulista, 22','mercedebenz@gmail.com', 'mercedebenz1230','automovel', 889, '2007-12-31'),
      (997667,'Stefane','Rua Haddok Lobo, 677', 'ford@gmail.com', 'ford1230','caminhoes', 889, '2009-12-31'),
      (89584,'Carlos','Rua das Limeiras, 12', 'axalta@gmail.com', 'axalta1230','automovel', 889, '2007-12-31'),
      (75646,'Diego','Av. Eusebio Matoso 766', 'sherwinwillians@gmail.com', 'sherwinwillians1230','automovel', 889, '2007-12-31'),
      (099339,'Tabata', 'Av. Brasil, 89','scania@gmail.com', 'scania1230','caminhões', 889, '2007-12-31');
      
SELECT * FROM cadastroFabrica;


CREATE TABLE sensor(idSensor INT PRIMARY KEY AUTO_INCREMENT,
medidaSensor DECIMAL(5,2),
dtMedicao DATETIME DEFAULT CURRENT_TIMESTAMP,
nomeFabrica VARCHAR(45)); -- (dtMedicao datetime default current_timestamp) para data/hora atual

INSERT INTO sensor (idSensor, medidaSensor, dtMedicao, nomeFabrica)
VALUES (DEFAULT, 361.67, DEFAULT, 'mercedebenz'),
       (DEFAULT, 899.67, DEFAULT, 'ford'),
       (DEFAULT, 234.67, DEFAULT, 'axalta'),
       (DEFAULT, 111.67, DEFAULT, 'sherwinwillians'),
        (DEFAULT, 111.67, DEFAULT, 'scania');
        

-- ALTER TABLE sensor modify column dtMedicao datetime default current_timestamp;

SELECT * FROM sensor;


CREATE TABLE chamine(idChamine INT PRIMARY KEY,
sensor VARCHAR(45),
nomeFabrica VARCHAR(45));

insert into chamine(idChamine, sensor, nomeFabrica)
VALUES(1, 1, 'mercedebenz'),
(2, 2, 'ford'),
(3, 3, 'axalta'),
(4, 4,  'sherwinwillians'),
(5, 5, 'scania');

SELECT * FROM chamine;

drop database enviroSense;