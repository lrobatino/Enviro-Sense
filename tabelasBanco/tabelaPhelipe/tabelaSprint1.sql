-- Tabelas do Banco De Dados
CREATE DATABASE projetoSprint1;
USE projetoSprint11;

-- Criando a tabela cadastro com os campos pertinentes à tabela
CREATE TABLE cadastro(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(20) NOT NULL,
    endereco VARCHAR(250) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(16) NOT NULL,  
    nomeRepresentanteEmpresa VARCHAR(45)
);

-- Inserindo dados na tabela cadastro
INSERT INTO cadastro VALUES
	(default, 'Honda' , '12.345.678/0001-90', ' Rua das Oficinas, 123 - Bairro Industrial, São Paulo', 'joaoSilva@honda.com.br', 'Honda2024', 'João Silva'),
    (default, 'General Motors', '98.765.432/0001-12', 'Avenida dos Carros, 456 - São Caetano do Sul, São Paulo', 'mariaOliveira@gm.com.br', 'GM2024', 'Maria Oliveira'),
    (default, 'Ford', '11.223.344/0001-55', 'Rua dos Mecânicos, 789 - São Bernardo do Campo, São Paulo', 'carlosEduardo@ford.com.br', 'Ford2024', 'Carlos Eduardo'),
    (default, 'Toyota', '22.334.556/0001-77', 'Rua das Ferramentas, 321 - Sorocaba, São Paulo', 'anaPaula@toyota.com.br', 'Toyota2024', 'Ana Paula'),
    (default, 'Mercedes-Benz', '33.445.667/0001-88', 'Avenida dos Trabalhadores, Iracemápolis, São Paulo', 'ricardoAlmeida@mercedes.com.br', 'Mercedes2024', 'Ricardo Almeida');
 
 -- Exibe todos os dados da tabela cadastro, com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT nomeEmpresa AS 'Empresa', CNPJ, endereco AS 'Endereço', email AS 'E-mail', senha AS 'Senha', nomeRepresentanteEmpresa AS 'Representante'
	FROM cadastro;
-- Exibe dados das empresas que terminam com a letra 'A', com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT nomeEmpresa AS 'Empresa', CNPJ, endereco AS 'Endereço', email AS 'E-mail', senha AS 'Senha', nomeRepresentanteEmpresa AS 'Representante'
	FROM cadastro
    WHERE nomeEmpresa LIKE '%a';
-- Exibe dados das empresas que o nome dos representante contem a letra 'O', com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT nomeEmpresa AS 'Empresa', CNPJ, endereco AS 'Endereço', email AS 'E-mail', senha AS 'Senha', nomeRepresentanteEmpresa AS 'Representante'
	FROM cadastro
    WHERE nomeRepresentanteEmpresa LIKE '%o%';
			
-- Criando a tabela dadosSensor para captar e armazenar os dados
CREATE TABLE dadosSensor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    medidaSensor FLOAT,
	dataMedicao datetime default current_timestamp
);
-- Inserindo dados na tabela dadosSensor
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(45, default);    
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(60, default);
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(72, default);
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(55, default);
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(68, default);
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(110, default);
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(95, default);
INSERT INTO dadosSensor(medidaSensor, dataMedicao) VALUES
	(120, default);

 -- Exibe todos os dados da tabela dadosSensor, com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT medidaSensor AS 'Emissão COV (g/m²)', dataMedicao AS 'Data da Medição' FROM dadosSensor; 
 -- Exibe emissões de COV menores do que 60, com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT medidaSensor AS 'Emissão COV (g/m²)', dataMedicao AS 'Data da Medição' FROM dadosSensor
	WHERE medidaSensor < 60;
 -- Exibe emissões de COV maiores ou iguais 90, com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT medidaSensor AS 'Emissão COV (g/m²)', dataMedicao AS 'Data da Medição' FROM dadosSensor 
	WHERE medidaSensor >= 90;    

-- Criando a tabela monitoramentoCOV
CREATE TABLE monitoramentoCOV(
	idCOV INT PRIMARY KEY AUTO_INCREMENT,
    tipoVeiculo VARCHAR(50) CONSTRAINT chkTipoVeiculo
		CHECK(tipoVeiculo in('Automóvel', 'Caminhão', 'Ônibus')),
    areaVeiculo DECIMAL(4,2),
    qtdVeiculo INT,
    limiteEmissao FLOAT,
    qtdTinta FLOAT,		
    qtdPrimer FLOAT,
    anoLicenca year
);	

INSERT INTO monitoramentoCOV VALUES
	(default, 'Automóvel', 6.0, 25, 6.75, 50, 30, 2022),
	(default, 'Caminhão', 12.5, 10, 8.75, 80, 50, 2023),
    (default, 'Ônibus', 25.0, 8, 30.0, 100, 70, 2021),
    (default, 'Automóvel', 5.5, 40, 13.2, 60, 40, 2005),
    (default, 'Caminhão', 13.0, 15, 17.55, 90, 60, 2003),
    (default, 'Ônibus', 6.0, 30, 40.5, 20, 10, 2000);

-- Exibe todos os dados da tabela monitoramentoCOV, com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT tipoVeiculo AS 'Veiculo', areaVeiculo AS 'Area (m²)', qtdVeiculo, 
	   limiteEmissao AS 'Limite Emissão COV (g/m²)', qtdTinta AS 'Qtd Tintas (L)', qtdPrimer AS 'Qtd Primer (L)', anoLicenca AS 'Ano de Licença' FROM monitoramentoCOV;
-- Exibe os dados da tabela onde o ano de licença é menor que 2007, com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT tipoVeiculo AS 'Veiculo', areaVeiculo AS 'Area (m²)', qtdVeiculo, 
	   limiteEmissao AS 'Limite Emissão COV (g/m²)', qtdTinta AS 'Qtd Tintas (L)', qtdPrimer AS 'Qtd Primer (L)', anoLicenca AS 'Ano de Licença' 
       FROM monitoramentoCOV
       WHERE anoLicenca < 2007;
-- Exibe os dados da tabela onde o tipo de veículo é automóvel, com os apelidos nos campos para ficar mais organizado a visualização no select
SELECT tipoVeiculo AS 'Veiculo', areaVeiculo AS 'Area (m²)', qtdVeiculo, 
	   limiteEmissao AS 'Limite Emissão COV (g/m²)', qtdTinta AS 'Qtd Tintas (L)', qtdPrimer AS 'Qtd Primer (L)', anoLicenca AS 'Ano de Licença' 
       FROM monitoramentoCOV
       WHERE tipoVeiculo = 'Automóvel';
	


    