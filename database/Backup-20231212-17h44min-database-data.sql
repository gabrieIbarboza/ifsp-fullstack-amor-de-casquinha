CREATE DATABASE  IF NOT EXISTS `db_sorveteria` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_sorveteria`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_sorveteria
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `profile` char(4) DEFAULT 'CLIE',
  `tbEndereco_idEndereco` int DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `emailCliente` (`emailCliente`),
  KEY `fk_tbCliente_tbEndereco1` (`tbEndereco_idEndereco`),
  CONSTRAINT `fk_tbCliente_tbEndereco1` FOREIGN KEY (`tbEndereco_idEndereco`) REFERENCES `tbendereco` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcliente`
--

LOCK TABLES `tbcliente` WRITE;
/*!40000 ALTER TABLE `tbcliente` DISABLE KEYS */;
INSERT INTO `tbcliente` VALUES (1,0,'Laura Barros','laurabarros2541@gmail.com','$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq','(11) 99798-4601','CLIE',1),(2,0,'Jéssica Bueno','jessicabuenoramos5@gmail.com','$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq','(11) 99268-4686','CLIE',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbendereco`
--

LOCK TABLES `tbendereco` WRITE;
/*!40000 ALTER TABLE `tbendereco` DISABLE KEYS */;
INSERT INTO `tbendereco` VALUES (1,'08110-600','Rua Padre Montoya',37,'Casa','Vila Alabama'),(2,'09190-804','Rua Euclides Pacheco',3321000,'Apto 903','Vila Gomes Cardim');
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
  `profile` char(4) DEFAULT 'FUNC',
  `nomeFuncionario` varchar(50) DEFAULT NULL,
  `telefoneFuncionario` varchar(25) DEFAULT NULL,
  `emailFuncionario` varchar(60) DEFAULT NULL,
  `senhaFuncionario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `emailFuncionario` (`emailFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfuncionario`
--

LOCK TABLES `tbfuncionario` WRITE;
/*!40000 ALTER TABLE `tbfuncionario` DISABLE KEYS */;
INSERT INTO `tbfuncionario` VALUES (1,0,0,'FUNC','Caroliny Rocha','(11)998984901','carolinyr9@gmail.com','$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq'),(2,0,1,'FUNC','Gabriel Barboza','(11)975864309','gabrielbarb@gmail.com','$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq'),(3,1,0,'FUNC','Peter Costa','(11)948985648','petercosta663@gmail.com','');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido`
--

LOCK TABLES `tbpedido` WRITE;
/*!40000 ALTER TABLE `tbpedido` DISABLE KEYS */;
INSERT INTO `tbpedido` VALUES (1,'2023-12-11 23:56:28',34.50,1,'Entregue',1,NULL,1),(2,'2023-12-12 16:49:08',50.48,0,'Enviado',1,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbproduto`
--

LOCK TABLES `tbproduto` WRITE;
/*!40000 ALTER TABLE `tbproduto` DISABLE KEYS */;
INSERT INTO `tbproduto` VALUES (2,0,1,'Pote de Sorvete','Pote','poteLogo.png'),(3,0,1,'Picolé','Picolé','picoleLogo.png'),(4,0,1,'Açaí','Açaí','acaiLogo.png'),(5,0,1,'ChupChup','ChupChup','chupLogo.png'),(6,0,1,'Sundae','Sundae','sundaeLogo.png');
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
INSERT INTO `tbprodutopedido` VALUES (1,1,2,4,1,34.50),(2,2,2,2,1,34.50),(3,2,3,11,2,15.98);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbvariacaoproduto`
--

LOCK TABLES `tbvariacaoproduto` WRITE;
/*!40000 ALTER TABLE `tbvariacaoproduto` DISABLE KEYS */;
INSERT INTO `tbvariacaoproduto` VALUES (1,1,'Morango - Pote 2L',34.50,'morangoPote.png',2),(2,1,'Coco Branco - Pote 2L',34.50,'cocoPote.png',2),(3,1,'Leite Condensado - Pote 2L',34.50,'leite-condensadoPote.png',2),(4,1,'Milho Verde - Pote 2L',34.50,'milho-verdePote.png',2),(5,1,'Napolitano - Pote 2L',36.50,'napolitanoPote.png',2),(6,1,'Havaiano',36.50,'havaianoPote.png',2),(7,1,'Chocolitano',36.50,'chocolitanoPote.png',2),(8,1,'Picolé - Grego Morango',7.99,'grego-morangoPicole.png',3),(9,1,'Picolé - Mousse de Doce de Leite',7.99,'mousse-doce-leitePicole.png',3),(10,1,'Picolé - Açaí',7.99,'acaiPicole.png',3),(11,1,'Picolé - Flocos',7.99,'flocosPicole.png',3),(12,1,'Pote 2L - Açaí com Morango ',46.50,'acai-morangoAcai.png',4),(13,1,'Pote 2L - Açaí com Banana ',46.50,'acai-bananaAcai.png',4),(14,1,'Pote 2L - Açaí com Guaraná',46.50,'acai-guaranaAcai.png',4),(15,1,'Pote 2L - Açaí com Iogurte',46.50,'acai-iogurteAcai.png',4),(16,1,'Pote 2L - Açaí com Leitinho',46.50,'acai-leitinhoAcai.png',4),(17,1,'Picolé - Coraçãozinho',7.99,'coracaozinhoPicole.png',3),(18,1,'ChupChup - Unicórnio',3.99,'unicornioChup.png',5),(19,1,'Chup Chup - Coco',3.99,'cocoChup.png',5),(20,1,'Chup Chup - Morango',3.99,'morangoChup.png',5),(21,1,'ChupChup - Maracujá',3.99,'maracujaChup.png',5),(22,1,'Chup Chup - Leite Condensado',3.99,'leite-condensadoChup.png',5),(23,1,'Sundae - Morango',6.99,'morangoSundae.png',6),(24,1,'Sundae - Baunilha',6.99,'baunilhaSundae.png',6);
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GetClienteId`(`email` VARCHAR(60)) RETURNS int
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GetEnderecoId`(`cepEnd` VARCHAR(20), `ruaEnd` VARCHAR(100), `numeroEnd` INT, `complementoEnd` VARCHAR(15), `bairroEnd` VARCHAR(45)) RETURNS int
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteCreate`(`cepEnd` VARCHAR(20), `ruaEnd` VARCHAR(100), `numeroEnd` INT, `complementoEnd` VARCHAR(15), `bairroEnd` VARCHAR(45), `nomeClie` VARCHAR(50), `emailClie` VARCHAR(60), `senhaClie` VARCHAR(255), `telefoneClie` VARCHAR(25))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteDeleteByEmail`(`emailClie` VARCHAR(60))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteReadByEmail`(`emailClie` VARCHAR(60))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteUpdate`(`emailClie` VARCHAR(60), `newEmailClie` VARCHAR(60), `nomeClie` VARCHAR(50), `telefoneClie` VARCHAR(25), `cepEnd` VARCHAR(20), `ruaEnd` VARCHAR(100), `numeroEnd` INT, `complementoEnd` VARCHAR(15), `bairroEnd` VARCHAR(45))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioCreate`(`emailF` VARCHAR(60), `senhaF` VARCHAR(255), `nomeF` VARCHAR(50), `telefoneF` VARCHAR(25), `adm` TINYINT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioDeleteByEmail`(`emailF` VARCHAR(60))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioReadAllActive`(`limitF` INT, `offsetF` INT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioReadByEmail`(`emailF` VARCHAR(60))
BEGIN
	IF NOT EXISTS (SELECT emailFuncionario from tbFuncionario where emailFuncionario like emailF)
	THEN
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message';
	ELSE
		SELECT * 
			FROM tbFuncionario 
            WHERE emailFuncionario like emailF 
            LIMIT 1;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FuncionarioUpdate`(`emailF` VARCHAR(60), `newEmailF` VARCHAR(60), `nomeF` VARCHAR(50), `telefoneF` VARCHAR(25), `adm` TINYINT)
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Login`(`email` VARCHAR(60))
BEGIN
	IF EXISTS (SELECT emailFuncionario FROM tbFuncionario WHERE emailFuncionario like email)
    THEN
		SELECT * FROM tbFuncionario WHERE emailFuncionario LIKE email LIMIT 1;
	ELSEIF EXISTS (SELECT emailCliente FROM tbCliente WHERE emailCliente LIKE email)
		THEN
			SELECT * 
				FROM tbCliente 
				INNER JOIN tbEndereco
				ON tbCliente.tbEndereco_idEndereco = tbEndereco.idEndereco
				WHERE emailCliente LIKE email
                LIMIT 1;
	ELSE
		SELECT '403' AS 'Status', 'ERROR_EMAIL_NAO_ENCONTRADO' AS 'Error', '' AS 'Message', '' AS 'Body';
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoCreate`(`dataP` DATETIME, `isDeliveryP` TINYINT, `email` VARCHAR(60), `endereco` INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_PedidoReadAllNotCompleted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadAllNotCompleted`()
BEGIN
	SELECT * 
		FROM tbPedido
        LEFT OUTER JOIN tbProdutoPedido
		ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
        WHERE (tbPedido.statusPedido not like 'Finalizado'
        AND tbPedido.statusPedido not like 'Entregue');
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadByCliente`(`email` VARCHAR(60), `limitF` INT, `offsetF` INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_PedidoReadById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadById`(
	idP int
)
BEGIN
	SELECT * 
		FROM tbPedido
        LEFT OUTER JOIN tbProdutoPedido
		ON tbPedido.idPedido = tbProdutoPedido.tbPedido_idPedido
        WHERE tbPedido.idPedido = idP;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoReadByStatus`(`statusP` VARCHAR(20))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoUpdate`(`idP` INT, `dataP` DATETIME, `isDeliveryP` TINYINT, `statusP` VARCHAR(20), `funcionario` INT, `endereco` INT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoCreate`(`nome` VARCHAR(50), `tipo` VARCHAR(20), `foto` VARCHAR(255))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoDeleteByName`(`nome` VARCHAR(50))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoPedidoCreate`(`pedido` INT, `variacao` INT, `qntd` INT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadAll`(`limitF` INT, `offsetF` INT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadAllActive`(`limitF` INT, `offsetF` INT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoReadByName`(`nome` VARCHAR(50))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdutoUpdate`(`nome` VARCHAR(50), `newNome` VARCHAR(50), `tipo` VARCHAR(20), `foto` VARCHAR(255), `act` TINYINT)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpdatePassword`(`email` VARCHAR(60), `newPass` VARCHAR(255))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoCreate`(`nome` VARCHAR(50), `preco` DECIMAL(10,2), `foto` VARCHAR(255), `produto` VARCHAR(50))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadAllActive`(`limitF` INT, `offsetF` INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_VariacaoReadById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadById`(`id` INT)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE isActive = 1
		AND idVariacao = id;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadByName`(`nome` VARCHAR(50))
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_VariacaoReadByProduto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadByProduto`(`produto` VARCHAR(50))
BEGIN
	SET @produto_id := (SELECT idProduto FROM tbProduto WHERE nomeProduto like produto);
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE tbProduto_idProduto = @produto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VariacaoReadByProdutoId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoReadByProdutoId`(`idProduto` INT)
BEGIN
	SELECT * 
		FROM tbVariacaoProduto 
        WHERE tbProduto_idProduto = idProduto;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VariacaoUpdate`(`nome` VARCHAR(50), `newNome` VARCHAR(50), `preco` DECIMAL(10,2), `foto` VARCHAR(255), `act` TINYINT)
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

-- Dump completed on 2023-12-12 17:41:54
