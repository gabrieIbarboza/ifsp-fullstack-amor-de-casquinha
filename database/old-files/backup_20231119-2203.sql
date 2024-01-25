-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: db_sorveteria
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbcliente`
--

DROP TABLE IF EXISTS `tbcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `isDeleted` tinyint DEFAULT '0',
  `nomeCliente` varchar(50) DEFAULT NULL,
  `emailCliente` varchar(60) DEFAULT NULL,
  `senhaCliente` varchar(255) DEFAULT NULL,
  `telefoneCliente` varchar(25) DEFAULT NULL,
  `tbEndereco_idEndereco` int NOT NULL,
  `profile` char(4) DEFAULT 'CLIE',
  PRIMARY KEY (`idCliente`,`tbEndereco_idEndereco`),
  UNIQUE KEY `emailCliente` (`emailCliente`),
  KEY `fk_tbCliente_tbEndereco1` (`tbEndereco_idEndereco`),
  CONSTRAINT `fk_tbCliente_tbEndereco1` FOREIGN KEY (`tbEndereco_idEndereco`) REFERENCES `tbendereco` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcliente`
--

LOCK TABLES `tbcliente` WRITE;
/*!40000 ALTER TABLE `tbcliente` DISABLE KEYS */;
INSERT INTO `tbcliente` VALUES (1,NULL,NULL,NULL,NULL,NULL,1,'CLIE'),(2,0,'Mafe','rodrigo@gmail.com','jhkagkfasgkgafgwequiuijkasaa1','(11) 99999-9999',2,'CLIE'),(3,0,'Cliente Teste','teste@gmail.com','senhacomhash123','(11) 99999-9999',4,'CLIE');
/*!40000 ALTER TABLE `tbcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbendereco`
--

DROP TABLE IF EXISTS `tbendereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbendereco` (
  `idEndereco` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(20) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `complemento` varchar(15) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbendereco`
--

LOCK TABLES `tbendereco` WRITE;
/*!40000 ALTER TABLE `tbendereco` DISABLE KEYS */;
INSERT INTO `tbendereco` VALUES (1,NULL,NULL,NULL,NULL,NULL),(2,'07061-002','Av. ',3845,'Apt 72','Bairro Povão'),(3,'00000-000','Rua',1,'CS 00','Bairro'),(4,'00000-777','Minha Rua',123,'CS 03','Meu Bairro');
/*!40000 ALTER TABLE `tbendereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbfuncionario`
--

DROP TABLE IF EXISTS `tbfuncionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbfuncionario` (
  `idFuncionario` int NOT NULL AUTO_INCREMENT,
  `isDeleted` tinyint DEFAULT '0',
  `isAdm` tinyint DEFAULT NULL,
  `nomeFuncionario` varchar(50) DEFAULT NULL,
  `telefoneFuncionario` varchar(25) DEFAULT NULL,
  `emailFuncionario` varchar(60) DEFAULT NULL,
  `senhaFuncionario` varchar(255) DEFAULT NULL,
  `profile` char(4) DEFAULT 'FUNC',
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `emailFuncionario` (`emailFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfuncionario`
--

LOCK TABLES `tbfuncionario` WRITE;
/*!40000 ALTER TABLE `tbfuncionario` DISABLE KEYS */;
INSERT INTO `tbfuncionario` VALUES (1,1,1,'Funcionario Teste','(11) 99999-9999','funcionario@gmail.com','newPassHashed123','FUNC'),(2,0,0,'Funcionario Teste','(11) 99999-9999','teste@amornacasquinha.com','senhasegurahashed123','FUNC');
/*!40000 ALTER TABLE `tbfuncionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpedido`
--

DROP TABLE IF EXISTS `tbpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `dataPedido` datetime DEFAULT NULL,
  `totalPedido` decimal(10,2) DEFAULT NULL,
  `isDelivery` tinyint DEFAULT '1',
  `statusPedido` varchar(20) DEFAULT NULL,
  `tbCliente_idCliente` int DEFAULT NULL,
  `tbFuncionario_idFuncionario` int DEFAULT NULL,
  `tbEndereco_idEndereco` int DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_tbPedido_tbCliente1` (`tbCliente_idCliente`),
  KEY `fk_tbPedido_tbFuncionario1` (`tbFuncionario_idFuncionario`),
  KEY `fk_tbPedido_tbEndereco1` (`tbEndereco_idEndereco`),
  CONSTRAINT `fk_tbPedido_tbCliente1` FOREIGN KEY (`tbCliente_idCliente`) REFERENCES `tbcliente` (`idCliente`),
  CONSTRAINT `fk_tbPedido_tbEndereco1` FOREIGN KEY (`tbEndereco_idEndereco`) REFERENCES `tbendereco` (`idEndereco`),
  CONSTRAINT `fk_tbPedido_tbFuncionario1` FOREIGN KEY (`tbFuncionario_idFuncionario`) REFERENCES `tbfuncionario` (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido`
--

LOCK TABLES `tbpedido` WRITE;
/*!40000 ALTER TABLE `tbpedido` DISABLE KEYS */;
INSERT INTO `tbpedido` VALUES (1,'2023-11-19 21:37:25',170.00,1,'Recebido',3,2,4);
/*!40000 ALTER TABLE `tbpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbproduto`
--

DROP TABLE IF EXISTS `tbproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbproduto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `isDeleted` tinyint DEFAULT '0',
  `isActive` tinyint DEFAULT '1',
  `nomeProduto` varchar(50) DEFAULT NULL,
  `tipoProduto` varchar(20) DEFAULT NULL,
  `fotoProduto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `nomeProduto` (`nomeProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbproduto`
--

LOCK TABLES `tbproduto` WRITE;
/*!40000 ALTER TABLE `tbproduto` DISABLE KEYS */;
INSERT INTO `tbproduto` VALUES (1,1,0,NULL,NULL,NULL),(2,0,1,'Produto Teste','Picole','/img/teste.jpg'),(3,0,1,'Açaí Teste','Teste','img/acai.jpg');
/*!40000 ALTER TABLE `tbproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbprodutopedido`
--

DROP TABLE IF EXISTS `tbprodutopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbprodutopedido` (
  `idProdutoPedido` int NOT NULL AUTO_INCREMENT,
  `tbPedido_idPedido` int NOT NULL,
  `tbVariacaoProduto_idProduto` int NOT NULL,
  `tbVariacaoProduto_idVariacao` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `subTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProdutoPedido`),
  KEY `fk_tbPedido_has_tbProduto_tbPedido1` (`tbPedido_idPedido`),
  KEY `fk_tbPedido_has_tbProduto_tbProduto1` (`tbVariacaoProduto_idProduto`,`tbVariacaoProduto_idVariacao`),
  CONSTRAINT `fk_tbPedido_has_tbProduto_tbPedido1` FOREIGN KEY (`tbPedido_idPedido`) REFERENCES `tbpedido` (`idPedido`),
  CONSTRAINT `fk_tbPedido_has_tbProduto_tbProduto1` FOREIGN KEY (`tbVariacaoProduto_idProduto`, `tbVariacaoProduto_idVariacao`) REFERENCES `tbvariacaoproduto` (`tbProduto_idProduto`, `idVariacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprodutopedido`
--

LOCK TABLES `tbprodutopedido` WRITE;
/*!40000 ALTER TABLE `tbprodutopedido` DISABLE KEYS */;
INSERT INTO `tbprodutopedido` VALUES (1,1,3,2,1,10.00),(2,1,3,2,1,10.00),(3,1,3,3,10,150.00);
/*!40000 ALTER TABLE `tbprodutopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbvariacaoproduto`
--

DROP TABLE IF EXISTS `tbvariacaoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbvariacaoproduto` (
  `idVariacao` int NOT NULL AUTO_INCREMENT,
  `isActive` tinyint DEFAULT '1',
  `nomeVariacao` varchar(50) DEFAULT NULL,
  `precoVariacao` decimal(10,2) DEFAULT NULL,
  `fotoVariacao` varchar(255) DEFAULT NULL,
  `tbProduto_idProduto` int NOT NULL,
  PRIMARY KEY (`idVariacao`),
  UNIQUE KEY `nomeVariacao` (`nomeVariacao`),
  KEY `fk_tbVariacaoProduto_tbProduto1` (`tbProduto_idProduto`),
  CONSTRAINT `fk_tbVariacaoProduto_tbProduto1` FOREIGN KEY (`tbProduto_idProduto`) REFERENCES `tbproduto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbvariacaoproduto`
--

LOCK TABLES `tbvariacaoproduto` WRITE;
/*!40000 ALTER TABLE `tbvariacaoproduto` DISABLE KEYS */;
INSERT INTO `tbvariacaoproduto` VALUES (1,0,'Picole Azul',0.90,'/img/sorvete-teste.jpg',2),(2,1,'Açaí com Banana',10.00,'img/acai/banana.jpg',3),(3,1,'Açaí com Paçoca',15.00,'img/acai/pacoca.jpg',3);
/*!40000 ALTER TABLE `tbvariacaoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_sorveteria'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_GetClienteId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GetClienteId`(
	email varchar(60)
) RETURNS int
    DETERMINISTIC
BEGIN
	IF EXISTS (SELECT idCliente FROM tbCliente WHERE emailCliente like email)
		THEN
			RETURN (SELECT idCliente FROM tbCliente WHERE emailCliente like email LIMIT 1);
	ELSE
        RETURN NULL;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_GetEnderecoId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GetEnderecoId`(
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45)
) RETURNS int
    DETERMINISTIC
BEGIN
	IF EXISTS (SELECT idEndereco FROM tbEndereco 
				WHERE cep like cepEnd AND rua like ruaEnd AND numero = numeroEnd AND complemento like complementoEnd AND bairro like bairroEnd)
		THEN
			RETURN (SELECT idEndereco FROM tbEndereco 
					WHERE (cep like cepEnd AND rua like ruaEnd AND numero = numeroEnd AND complemento like complementoEnd AND bairro like bairroEnd)
                    LIMIT 1);
	ELSE
		INSERT INTO tbEndereco(`cep`, `rua`, `numero`, `complemento`, `bairro`) 
			VALUES (cepEnd, ruaEnd, numeroEnd, complementoEnd, bairroEnd
		);
        RETURN LAST_INSERT_ID();
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ClienteCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteCreate`(
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45),
    nomeClie varchar(50), emailClie varchar(60), senhaClie varchar(255), telefoneClie varchar(15)
)
BEGIN
	IF EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
		INSERT INTO tbEndereco(`cep`, `rua`, `numero`, `complemento`, `bairro`) 
		VALUES (cepEnd, ruaEnd, numeroEnd, complementoEnd, bairroEnd
		);
        SET @last_id_in_tbEndereco = LAST_INSERT_ID();
        INSERT INTO tbCliente(
			`nomeCliente`,
			`emailCliente`,
			`senhaCliente`,
			`telefoneCliente`,
			`tbEndereco_idEndereco`) 
		VALUES (nomeClie, emailClie, senhaClie, telefoneClie, @last_id_in_tbEndereco
		);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ClienteDeleteByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteDeleteByEmail`(
	emailClie varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @enderecoId := (SELECT tbEndereco_idEndereco FROM tbCliente WHERE emailCliente like emailClie LIMIT 1);
		UPDATE tbEndereco SET
			cep = NULL, 
			rua = NULL, 
			numero = NULL, 
			complemento = NULL, 
			bairro = NULL
            WHERE idEndereco = @enderecoId;
        UPDATE tbCLiente SET
			isDeleted = 1,
			nomeCliente = NULL,
			emailCliente = NULL,
            senhaCliente = NULL,
			telefoneCliente = NULL
			WHERE emailCliente like emailClie;
        SELECT
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_DELETED' AS 'Message';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ClienteReadByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteReadByEmail`(
	emailClie varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbCliente 
			INNER JOIN tbEndereco
            ON tbCliente.tbEndereco_idEndereco = tbEndereco.idEndereco
            WHERE emailCliente like emailClie LIMIT 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ClienteUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteUpdate`(
	emailClie varchar(60), newEmailClie varchar(60), nomeClie varchar(50), telefoneClie varchar(15),
	cepEnd varchar(20), ruaEnd varchar(100), numeroEnd int, complementoEnd varchar(15), bairroEnd varchar(45)
)
BEGIN
	IF NOT EXISTS (SELECT emailCliente from tbCliente where emailCliente like emailClie)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @enderecoId := (SELECT tbEndereco_idEndereco FROM tbCliente WHERE emailCliente like emailClie LIMIT 1);
		UPDATE tbEndereco SET
			cep = cepEnd, 
			rua = ruaEnd, 
			numero = numeroEnd, 
			complemento = complementoEnd, 
			bairro = bairroEnd
            WHERE idEndereco = @enderecoId;
		UPDATE tbCLiente SET
			nomeCliente = nomeClie,
			emailCliente = newEmailClie,
			telefoneCliente = telefoneClie
			WHERE emailCliente like emailClie;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FuncionarioCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioCreate`(
    emailF varchar(60), senhaF varchar(255), nomeF varchar(50), telefoneF varchar(15), adm tinyint
)
BEGIN
	IF EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
        INSERT INTO tbFuncionario(
			`nomeFuncionario`,
			`emailFuncionario`,
			`senhaFuncionario`,
			`telefoneFuncionario`,
			`isAdm`)
			VALUES (nomeF, emailF, senhaF, telefoneF, adm);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FuncionarioDeleteByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioDeleteByEmail`(
	emailF varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailFuncionario FROM tbFuncionario WHERE emailFuncionario like emailF AND isDeleted != 1)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_ATIVO_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
        UPDATE tbFuncionario SET
			isDeleted = 1,
            senhaFuncionario = NULL
			WHERE emailFuncionario like emailF;
        SELECT
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_DELETED' AS 'Message';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FuncionarioReadAllActive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioReadAllActive`(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbFuncionario 
        WHERE isDeleted != 1
		LIMIT limitF 
        OFFSET offsetF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FuncionarioReadByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioReadByEmail`(
	emailF varchar(60)
)
BEGIN
	IF NOT EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbFuncionario 
            WHERE emailFuncionario like emailF LIMIT 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FuncionarioUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioUpdate`(
	emailF varchar(60), newEmailF varchar(60), nomeF varchar(50), telefoneF varchar(15), adm tinyint
)
BEGIN
	IF NOT EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		UPDATE tbFuncionario SET
			nomeFuncionario = nomeF,
			emailFuncionario = newEmailF,
			telefoneFuncionario = telefoneF,
            isAdm = adm
			WHERE emailFuncionario like emailF;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PedidoCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoCreate`(
    dataP datetime, isDeliveryP tinyint, email varchar(60), endereco int
)
BEGIN
	IF NOT EXISTS (SELECT rua FROM tbEndereco WHERE idEndereco = endereco)
	THEN
		SELECT '403' AS 'Status', 'ERROR_ENDERECO_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @status_pedido := 'Enviado';
        SET @id_cliente := (SELECT FN_GetClienteId(email));
        INSERT INTO tbPedido(
			`dataPedido`,
			`isDelivery`,
			`statusPedido`,
			`tbCliente_idCliente`,
			`tbEndereco_idEndereco`)
			VALUES (dataP, isDeliveryP, @status_pedido, @id_cliente, endereco);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message',
            LAST_INSERT_ID() AS 'Body';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PedidoReadByCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadByCliente`(
	email varchar(60), limitF int, offsetF int
)
BEGIN
	SET @id_cliente := (SELECT FN_GetClienteId(email));
    IF (isnull(@id_cliente))
    THEN
		SELECT '403' AS 'Status', 'ERROR_CLIENTE_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbPedido 
            LEFT OUTER JOIN tbProdutoPedido
            ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
			WHERE tbPedido.tbCliente_idCliente = @id_cliente
			LIMIT limitF 
			OFFSET offsetF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PedidoReadByStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadByStatus`(
	statusP varchar(20)
)
BEGIN
	SELECT * 
		FROM tbPedido
        LEFT OUTER JOIN tbProdutoPedido
		ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
        WHERE tbPedido.statusPedido like statusP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PedidoUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoUpdate`(
	idP int, dataP datetime, isDeliveryP tinyint, statusP varchar(20), funcionario int, endereco int
)
BEGIN
	SET @total_do_pedido := (SELECT sum(subtotal) FROM tbProdutoPedido WHERE tbPedido_idPedido = idP);
	UPDATE tbPedido SET
		dataPedido = dataP,
        totalPedido = @total_do_pedido,
		isDelivery = isDeliveryP,
		statusPedido = statusP,
		tbFuncionario_idFuncionario = funcionario,
		tbEndereco_idEndereco = endereco
		WHERE idPedido = idP;
	SELECT 
		'204' AS 'Status',
		'' AS 'Error',
		'SUCCESS_UPDATED' AS 'Message';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ProdutoCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoCreate`(
    nome varchar(50), tipo varchar(20), foto varchar(255)
)
BEGIN
	IF EXISTS (SELECT nomeProduto FROM tbProduto where nomeProduto like nome)
	THEN
		SELECT '403' AS 'Status', 'ERROR_NOME_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
        INSERT INTO tbProduto(
			`nomeProduto`,
			`tipoProduto`,
			`fotoProduto`)
			VALUES (nome, tipo, foto);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ProdutoDeleteByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoDeleteByName`(
	nome varchar(50)
)
BEGIN
	IF NOT EXISTS (SELECT idProduto FROM tbProduto WHERE nomeProduto like nome AND isDeleted != 1)
	THEN
		SELECT '403' AS 'Status', 'ERROR_PRODUTO_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
        UPDATE tbProduto SET
			isDeleted = 1,
            isActive = 0
			WHERE nomeProduto like nome;
        SELECT
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_DELETED' AS 'Message';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ProdutoPedidoCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoPedidoCreate`(
	pedido int, variacao int, qntd int
)
BEGIN
	SET @produto := (SELECT tbProduto_idProduto FROM tbVariacaoProduto WHERE idVariacao = variacao);
    SET @preco := (SELECT precoVariacao FROM tbVariacaoProduto WHERE idVariacao = variacao);
    SET @total := @preco * qntd;
	INSERT INTO tbProdutoPedido(
			`tbPedido_idPedido`,
			`tbVariacaoProduto_idProduto`,
			`tbVariacaoProduto_idVariacao`,
            `quantidade`,
            `subTotal`)
			VALUES (pedido, @produto, variacao, qntd, @total);
	SET @total_do_pedido := (SELECT sum(subtotal) FROM tbProdutoPedido WHERE tbPedido_idPedido = pedido);
    UPDATE tbPedido SET
		totalPedido = @total_do_pedido
		WHERE idPedido = pedido;
	SELECT
		'201' AS 'Status',
		'' AS 'Error',
		'SUCCESS_CREATED' AS 'Message';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ProdutoReadAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadAll`(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0
		LIMIT limitF 
        OFFSET offsetF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ProdutoReadAllActive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadAllActive`(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0 AND isActive = 1
		LIMIT limitF 
        OFFSET offsetF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ProdutoReadByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadByName`(
	nome varchar(50)
)
BEGIN
	SELECT * 
		FROM tbProduto 
        WHERE isDeleted = 0 
        AND isActive = 1
		AND nomeProduto like nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ProdutoUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoUpdate`(
	nome varchar(50), newNome varchar(50), tipo varchar(20), foto varchar(255), act tinyint
)
BEGIN
	IF NOT EXISTS (SELECT nomeProduto from tbProduto where nomeProduto like nome)
	THEN
		SELECT '403' AS 'Status', 'ERROR_NOME_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		UPDATE tbProduto SET
			nomeProduto = newNome,
			tipoProduto = tipo,
			fotoProduto = foto,
            isActive = act
			WHERE nomeProduto like nome;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UpdatePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpdatePassword`(
	email varchar(60), newPass varchar(255)
)
BEGIN
	IF EXISTS (SELECT emailFuncionario FROM tbFuncionario WHERE emailFuncionario like email)
    THEN
		UPDATE tbFuncionario SET
			senhaFuncionario = newPass
			WHERE emailFuncionario like email;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	ELSEIF EXISTS (SELECT emailCliente from tbCliente where emailCliente like email)
		THEN
			UPDATE tbCliente SET
				senhaCliente = newPass
				WHERE emailCliente like email;
			SELECT 
				'204' AS 'Status',
				'' AS 'Error',
				'SUCCESS_UPDATED' AS 'Message';
	ELSE
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VariacaoCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoCreate`(
    nome varchar(50), preco DECIMAL(10,2), foto varchar(255), produto varchar(50)
)
BEGIN
	IF EXISTS (SELECT nomeVariacao FROM tbvariacaoproduto WHERE nomeVariacao like nome)
    THEN
		SELECT '403' AS 'Status', 'ERROR_VARIACAO_CADASTRADA' AS 'Error', '' AS 'Message';
	ELSEIF NOT EXISTS (SELECT nomeProduto FROM tbProduto where nomeProduto like produto)
		THEN
			SELECT '403' AS 'Status', 'ERROR_PRODUTO_NAO_CADASTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SET @produto_id := (SELECT idProduto FROM tbProduto WHERE nomeProduto like produto);
        INSERT INTO tbVariacaoProduto(
			`nomeVariacao`,
			`precoVariacao`,
			`fotoVariacao`,
            `tbProduto_idProduto`)
			VALUES (nome, preco, foto, @produto_id);
		SELECT 
			'201' AS 'Status',
			'' AS 'Error',
			'SUCCESS_CREATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VariacaoReadAllActive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadAllActive`(
	limitF int, offsetF int
)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		LIMIT limitF 
        OFFSET offsetF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VariacaoReadByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadByName`(
	nome varchar(50)
)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		AND nomeVariacao like nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VariacaoUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoUpdate`(
	nome varchar(50), newNome varchar(50), preco DECIMAL(10,2), foto varchar(255), act tinyint
)
BEGIN
	IF NOT EXISTS (SELECT nomeVariacao from tbVariacaoProduto where nomeVariacao like nome)
	THEN
		SELECT '403' AS 'Status', 'ERROR_NOME_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		UPDATE tbVariacaoProduto SET
			nomeVariacao = newNome,
			precoVariacao = preco,
			fotoVariacao = foto,
            isActive = act
			where nomeVariacao like nome;
		SELECT 
			'204' AS 'Status',
			'' AS 'Error',
			'SUCCESS_UPDATED' AS 'Message';
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 22:03:47
