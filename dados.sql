CREATE TABLE `cliente` (
  `cpf` varchar(15) NOT NULL,
  `status_pagamento` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  CONSTRAINT `cpf` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `documento` (
  `ID_Documento` int NOT NULL,
  `ID_Responsavel` varchar(15) NOT NULL,
  `situacao` varchar(15) NOT NULL,
  `ID_Obra` int NOT NULL,
  PRIMARY KEY (`ID_Documento`),
  UNIQUE KEY `ID_Documento_UNIQUE` (`ID_Documento`),
  UNIQUE KEY `ID_Obra_UNIQUE` (`ID_Obra`),
  KEY `Responsavel_idx` (`ID_Responsavel`),
  CONSTRAINT `Obra` FOREIGN KEY (`ID_Obra`) REFERENCES `obra` (`ID_Obra`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `Responsavel` FOREIGN KEY (`ID_Responsavel`) REFERENCES `funcionario` (`cpf`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fornece` (
  `ID_Obra` int NOT NULL,
  `ID_Fornecedor` int NOT NULL,
  `expiracao_contrato` datetime NOT NULL,
  PRIMARY KEY (`ID_Obra`,`ID_Fornecedor`),
  KEY `Forneceddor_idx` (`ID_Fornecedor`),
  CONSTRAINT `Fornecedor_For` FOREIGN KEY (`ID_Fornecedor`) REFERENCES `fornecedor` (`ID_Fornecedor`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `Obra_For` FOREIGN KEY (`ID_Obra`) REFERENCES `obra` (`ID_Obra`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fornecedor` (
  `ID_Fornecedor` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Fornecedor`),
  UNIQUE KEY `ID_Fornecedor_UNIQUE` (`ID_Fornecedor`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fornecedor_produtos` (
  `ID_Fornecedor` int NOT NULL,
  `produtos` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Fornecedor`,`produtos`),
  CONSTRAINT `Fornecedor_ForPro` FOREIGN KEY (`ID_Fornecedor`) REFERENCES `fornecedor` (`ID_Fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `funcionario` (
  `cpf` varchar(15) NOT NULL,
  `salario` decimal(7,2) NOT NULL,
  `data_admissao` datetime DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  CONSTRAINT `cpf_Func` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `obra` (
  `ID_Obra` int NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `localizacao` varchar(45) NOT NULL,
  `status_obra` varchar(45) NOT NULL,
  `ID_Gerente` varchar(45) NOT NULL,
  `ID_Engenheiro` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Obra`),
  UNIQUE KEY `ID_Obra_UNIQUE` (`ID_Obra`),
  UNIQUE KEY `ID_Gerente_UNIQUE` (`ID_Gerente`),
  UNIQUE KEY `ID_Engenheiro_UNIQUE` (`ID_Engenheiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `obra_clientes` (
  `ID_Obra` int NOT NULL,
  `ID_Cliente` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Obra`,`ID_Cliente`),
  UNIQUE KEY `ID_Cliente_UNIQUE` (`ID_Cliente`),
  UNIQUE KEY `ID_Obra_UNIQUE` (`ID_Obra`),
  CONSTRAINT `ID_Cliente_ObraCli` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_Obra_ObraCli` FOREIGN KEY (`ID_Obra`) REFERENCES `obra` (`ID_Obra`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `participa` (
  `cpf` varchar(15) NOT NULL,
  `ID_Obra` int NOT NULL,
  `permissao` varchar(15) NOT NULL,
  PRIMARY KEY (`cpf`,`ID_Obra`),
  KEY `ID_Obra_idx` (`ID_Obra`),
  CONSTRAINT `cpf_Part` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_Obra_Part` FOREIGN KEY (`ID_Obra`) REFERENCES `obra` (`ID_Obra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pessoa` (
  `cpf` varchar(15) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
