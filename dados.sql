
-- Pessoa Talbe
CREATE TABLE Pessoa (
    cpf INT  UNIQUE NOT NULL,
    nome VARCHAR(45),
    PRIMARY KEY(cpf)
);
--Multi valued attribute table
CREATE TABLE Obra_Pessoa (
    cpf INT UNIQUE NOT NULL,
    ID_Obra INT UNIQUE NOT NULL,
    PRIMARY KEY(cpf, ID_Obra),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra)
);
--Disjoint
CREATE TABLE Cliente (
    cpf INT UNIQUE NOT NULL,
    status_pagamento VARCHAR(15) NOT NULL,
    PRIMARY KEY(cpf),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

--Disjoint
CREATE TABLE Funcionario (
    cpf INT UNIQUE NOT NULL,
    salario DECIMAL(7,2),
    data_admissao DATE NOT NULL,
    PRIMARY KEY(cpf),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

--Obra table creation
CREATE TABLE Obra (
    ID_Obra INT UNIQUE NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    localizacao VARCHAR(45) NOT NULL,
    status_obra VARCHAR(45) NOT NULL,
    ID_Gerente INT UNIQUE NOT NULL,
    ID_Engenheiro INT UNIQUE NOT NULL,
    PRIMARY KEY(ID_Obra)
);

--Multi valued attribute
CREATE TABLE Obra_Clientes (
    ID_Obra INT UNIQUE NOT NULL,
    ID_Cliente INT UNIQUE NOT NULL,
    PRIMARY KEY(ID_Obra, ID_Cliente),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente (cpf)
);

--Multi valued attribute
CREATE TABLE Obra_Documentos (
    ID_Obra INT UNIQUE NOT NULL,
    ID_Documento INT UNIQUE NOT NULL,
    PRIMARY KEY(ID_Obra, ID_Documento),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra),
    FOREIGN KEY (ID_Documento) REFERENCES Documento (ID_Documento)
);

--Documento table creation
CREATE TABLE Documento (
    ID_Documento INT UNIQUE NOT NULL,
    ID_Responsavel INT UNIQUE NOT NULL,
    satatus VARCHAR(15) NOT NULL,
    ID_Obra INT UNIQUE NOT NULL,
    PRIMARY KEY(ID_Documento),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra),
    FOREIGN KEY (ID_Responsavel) REFERENCES Pessoa (cpf)
);

--Fornecedor table creation
CREATE TABLE Fornecedor (
    ID_Fornecedor INT UNIQUE NOT NULL,
    nome VARCHAR(45)  NOT NULL,
    PRIMARY KEY(ID_Fornecedor)
    
);

--Multi valued attribute
CREATE TABLE Fornecedor_Obra (
    ID_Fornecedor INT UNIQUE NOT NULL,
    ID_Obra INT UNIQUE NOT NULL,
    PRIMARY KEY(ID_Fornecedor, ID_Obra),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor (ID_Fornecedor)
);

--Multi valued attribute
CREATE TABLE Fornecedor_Produtos (
    ID_Fornecedor INT UNIQUE NOT NULL,
    produtos VARCHAR(45)  NOT NULL,
    PRIMARY KEY(ID_Fornecedor, produtos),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor)
);

--Participa relation table creation
CREATE TABLE Participa (
    cpf INT UNIQUE NOT NULL,
    ID_Obra INT UNIQUE NOT NULL,
    permissao VARCHAR(15) NOT NULL,
    PRIMARY KEY(cpf, ID_Obra),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra)
);

--Fornece relation table creation
CREATE TABLE Fornece (
    ID_Obra INT UNIQUE NOT NULL,
    ID_Fornecedor INT UNIQUE NOT NULL,
    expiracao_contrato DATE NOT NULL,
    PRIMARY KEY(ID_Obra, ID_Fornecedor),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor (ID_Fornecedor)
);