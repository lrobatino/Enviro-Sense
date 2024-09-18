CREATE DATABASE Enviro_Sense_DB;
USE Enviro_Sense_DB;

-- TABELA PARA RECEBIMENTO DOS DADOS DE USUÁRIOS CADASTRADOS --
CREATE TABLE CadastroUsuario(
idUser INT PRIMARY KEY AUTO_INCREMENT,
Nome varchar(45) NOT NULL,
Sobrenome varchar(45) NOT NULL,
Senha varchar(45) NOT NULL,
EmailCorporativo varchar(45),
Telefone varchar(45),
Empresa varchar(45),
Cnpj varchar(45)
);
INSERT INTO CadastroUsuario (Nome, Sobrenome, Senha, EmailCorporativo, Telefone, Empresa, Cnpj) VALUES
('Guilherme', 'Silva', 'senha123', 'g.silva@colorplus.com', '(11) 98765-4321', 'ColorPlus Tintas Automotivas', '12.345.678/0001-90'),
('Maria', 'Ferreira', 'tinta2024', 'm.ferreira@autopaint.com', '(21) 91234-5678', 'AutoPaint Soluções em Pintura', '98.765.432/0001-23'),
('Pedro', 'Oliveira', 'segredo789', 'p.oliveira@tintasmaster.com', '(31) 99876-5432', 'Tintas Master Automotivas', '45.678.901/0001-56'),
('Ana', 'Costa', 'minhasenha321', 'a.costa@pinturamoderna.com', '(41) 98765-1234', 'Pintura Moderna Veículos', '67.890.123/0001-78');

SELECT * FROM CadastroUsuario;

SELECT * FROM CadastroUsuario 
	WHERE Empresa LIKE 'T%';
    
SELECT Nome, Empresa FROM CadastroUsuario
	WHERE Nome = 'Pedro';

-- TABELA DE MONITORAMENTO DOS DADOS RECEBIDOS PELO SENSOR INSTALADO EM NOSSOS CLIENTES --
CREATE TABLE Sensor(
id INT PRIMARY KEY AUTO_INCREMENT,
Empresa_parceira varchar(45),
Leitura_do_sensor DECIMAL(4,2),
Hora_data_leitura timestamp
);
ALTER TABLE Sensor MODIFY COLUMN Hora_data_leitura datetime default current_timestamp;

INSERT INTO Sensor (Empresa_parceira, Leitura_do_sensor, hora_data_leitura) VALUES
('AutoPaint Soluções em Pintura', 0.56, default),
('ColorPlus Tintas Automotivas', 0.21, default),
('Tintas Master Automotivas', 0.89, default),
('Pintura Moderna Veículos', 0.34, default);

SELECT concat('A ', Empresa_parceira, ' está emitindo valores de COV acima do desejável ') AS Leitura_do_sensor FROM Sensor
	WHERE Leitura_do_sensor >= 0.40;
    
SELECT Empresa_parceira AS 'Cliente', Leitura_do_sensor AS 'Dados Obtidos', Hora_data_leitura AS 'Horário',
	CASE 
    WHEN Leitura_do_sensor >= 0.40 THEN 'Emissão acima do desejável'
    WHEN Leitura_do_sensor <= 0.40 THEN 'Emissão dentro dos limites'
	END AS 'Emissão' FROM Sensor;

-- TABELA PARA EMPRESAS ACOMPANHAR QUAIS TINTAS/PRIMERS EM SEUS PROCESSOS ESTÃO OCASIONANDO A MAIOR LIBERAÇÃO DE COV --
CREATE TABLE Veiculos(
idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
Modelo_veiculo varchar(45),
Area_superficial DECIMAL(5,2),
Qtde_carrocerias INT,
Tinta varchar(45),
Primer varchar(45),
FISPQ_COV_Tinta DECIMAL(5,2),
FISPQ_COV_Primer DECIMAL(5,2)
);

INSERT INTO Veiculos VALUES 
(default, 'Carro Sedan', 38, 120, 'PU Poliuretano Automotivo', 'Primer Epóxi', 500.0, 250.0),
(default, 'Caminhão Baú', 120, 30, 'Esmalte Sintético', 'Primer PU Alto Sólidos', 420.0, 200.0),
(default, 'Ônibus Urbano', 250, 15, 'Tinta Base Água', 'Primer Epóxi', 60.0, 180.0),
(default, 'Van de Transporte', 60, 50, 'PU Poliuretano Alto Brilho', 'Primer PU Médio Sólidos', 550.0, 220.0),
(default, 'Carro Hatchback', 35, 100, 'Esmalte Sintético Automotivo', 'Primer Epóxi Alto Desempenho', 430.0, 190.0);

SELECT Modelo_veiculo, Area_superficial AS 'Area superficial (m²)', Qtde_carrocerias, Tinta, Primer, FISPQ_COV_Tinta AS 'COV Tintas (g/L)', FISPQ_COV_Primer AS 'COV Primer (g/L)' FROM Veiculos;

SELECT * FROM Veiculos 
	WHERE Primer LIKE '%Epóxi%';

SELECT * FROM 




