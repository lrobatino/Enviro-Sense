create database enviro;
use enviro;

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45), 
email varchar(100), 
cnpj char(14), 
telefone char(11));

create table funcionario (
idFuncionario int auto_increment,
fkEmpresa int,
	primary key(idFuncionario, fkEmpresa),
nome varchar(45),
dtNasc date,
fkSupervisor int,
	constraint fkSupervisorFunc foreign key (fkSupervisor) 
		references funcionario (idFuncionario),
	constraint fkEmpresaFunc foreign key (fkEmpresa)
		references empresa (idEmpresa)
    );
    
    
create table fabrica (
idFabrica int auto_increment,
fkEmpresa int,
	primary key(idFabrica, fkEmpresa),
nome varchar(45),
	constraint fkEmpresaFabrica foreign key (fkEmpresa)
		references empresa (idEmpresa));
        
create table endereco (
idEndereco int primary key auto_increment,
logradouro varchar(45),
cep char(8),
numero int,
bairro varchar(45),
cidade varchar(45),
fkFabrica int,
fkEmpresa int,
	constraint fkFabricaEndereco foreign key (fkFabrica)
    references fabrica (idFabrica),
    constraint fkEmpresaEndereco foreign key (fkEmpresa)
    references empresa (idEmpresa));
    

create table cabine (
idCabine int,
qtdAlerta int,
fkFabrica int,
fkEmpresaFabrica int,
fkSensor int,
	primary key (idCabine, fkFabrica, fkEmpresaFabrica),
    constraint fkFabricaCabine foreign key (fkFabrica)
    references fabrica (idFabrica),
    constraint fkEmpresaFabricaCabine foreign key (fkEmpresaFabrica)
    references empresa (idEmpresa));
    
create table sensor (
idSensor int primary key auto_increment,
tipoSensor varchar(10),
dtInstalacao date);

create table registros (
idRegistro int auto_increment,
nvMedicao varchar(20),
nvAlerta varchar(20),
dtRegistro date,
fkSensor int,
	primary key(idRegistro, fkSensor),
    constraint fkSensorRegistros foreign key (fkSensor)
    references sensor (idSensor));
    
    show tables;

