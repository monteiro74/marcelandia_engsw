#
# Structure for table "alunos"
#

CREATE TABLE `alunos` (
  `IdAluno` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Telefone` varchar(50) DEFAULT NULL,
  `Saldo` float(10,2) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Observacao` varchar(255) DEFAULT NULL,
  `Foto` longblob,
  PRIMARY KEY (`IdAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16le COMMENT='tabela de alunos';

#
# Data for table "alunos"
#

INSERT INTO `alunos` VALUES (1,'ana','5555-1234',10000.00,NULL,NULL,NULL),(2,'beth','5554-4321',5678.00,NULL,NULL,NULL),(3,'joão','5553-1234',8956.00,NULL,NULL,NULL),(4,'paulo','55-555-1234',11435.00,NULL,NULL,NULL),(5,'maria','5555-0000',9653.00,NULL,NULL,NULL);

#
# Structure for table "pets"
#

CREATE TABLE `pets` (
  `IdPet` int NOT NULL AUTO_INCREMENT,
  `Apelido` varchar(50) DEFAULT NULL,
  `IdAluno` int DEFAULT NULL,
  `Raca` varchar(30) DEFAULT NULL,
  `Sexo` varchar(30) DEFAULT NULL,
  `Idade` int DEFAULT NULL,
  `Valor` float(10,2) DEFAULT NULL,
  `Foto` longblob,
  PRIMARY KEY (`IdPet`),
  KEY `idx_pets` (`IdAluno`),
  CONSTRAINT `idx_pets` FOREIGN KEY (`IdAluno`) REFERENCES `alunos` (`IdAluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

#
# Data for table "pets"
#

INSERT INTO `pets` VALUES (1,'gato1',1,NULL,NULL,NULL,NULL,NULL),(2,'gato2',2,NULL,NULL,NULL,NULL,NULL),(3,'cao1',3,NULL,NULL,NULL,NULL,NULL),(4,'cao2',2,NULL,NULL,NULL,NULL,NULL),(5,'cao3',2,NULL,NULL,NULL,NULL,NULL),(6,'cao4',3,NULL,NULL,NULL,NULL,NULL),(7,'gato3',1,NULL,NULL,NULL,NULL,NULL);


CREATE TABLE `agenda` (
  `IdAgenda` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) DEFAULT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Responsavel` varchar(50) DEFAULT NULL,
  `Completado` int DEFAULT NULL,
  `Observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdAgenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;


CREATE TABLE `projetos` (
  `IdProjeto` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) DEFAULT NULL,
  `Valor` float(10,2) DEFAULT NULL,
  `DataTermino` date DEFAULT NULL,
  PRIMARY KEY (`IdProjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;
