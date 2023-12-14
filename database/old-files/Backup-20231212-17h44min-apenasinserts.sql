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
-- Dumping data for table `tbcliente`
--

LOCK TABLES `tbcliente` WRITE;
/*!40000 ALTER TABLE `tbcliente` DISABLE KEYS */;
INSERT INTO `tbcliente` VALUES (1,0,'Laura Barros','laurabarros2541@gmail.com','$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq','(11) 99798-4601','CLIE',1),(2,0,'Jéssica Bueno','jessicabuenoramos5@gmail.com','$2y$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq','(11) 99268-4686','CLIE',2);
/*!40000 ALTER TABLE `tbcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbendereco`
--

LOCK TABLES `tbendereco` WRITE;
/*!40000 ALTER TABLE `tbendereco` DISABLE KEYS */;
INSERT INTO `tbendereco` VALUES (1,'08110-600','Rua Padre Montoya',37,'Casa','Vila Alabama'),(2,'09190-804','Rua Euclides Pacheco',3321000,'Apto 903','Vila Gomes Cardim');
/*!40000 ALTER TABLE `tbendereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbfuncionario`
--

LOCK TABLES `tbfuncionario` WRITE;
/*!40000 ALTER TABLE `tbfuncionario` DISABLE KEYS */;
INSERT INTO `tbfuncionario` VALUES (1,0,0,'FUNC','Caroliny Rocha','(11)998984901','carolinyr9@gmail.com','$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq'),(2,0,1,'FUNC','Gabriel Barboza','(11)975864309','gabrielbarb@gmail.com','$2y$10$yy9LKdz0kbC72v8q7kDfZurvpKJ9Bmqo3HDjYYE4GfwhyOi8oDXUq'),(3,1,0,'FUNC','Peter Costa','(11)948985648','petercosta663@gmail.com','');
/*!40000 ALTER TABLE `tbfuncionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbpedido`
--

LOCK TABLES `tbpedido` WRITE;
/*!40000 ALTER TABLE `tbpedido` DISABLE KEYS */;
INSERT INTO `tbpedido` VALUES (1,'2023-12-11 23:56:28',34.50,1,'Entregue',1,NULL,1),(2,'2023-12-12 16:49:08',50.48,0,'Enviado',1,NULL,1);
/*!40000 ALTER TABLE `tbpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbproduto`
--

LOCK TABLES `tbproduto` WRITE;
/*!40000 ALTER TABLE `tbproduto` DISABLE KEYS */;
INSERT INTO `tbproduto` VALUES (2,0,1,'Pote de Sorvete','Pote','poteLogo.png'),(3,0,1,'Picolé','Picolé','picoleLogo.png'),(4,0,1,'Açaí','Açaí','acaiLogo.png'),(5,0,1,'ChupChup','ChupChup','chupLogo.png'),(6,0,1,'Sundae','Sundae','sundaeLogo.png');
/*!40000 ALTER TABLE `tbproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbprodutopedido`
--

LOCK TABLES `tbprodutopedido` WRITE;
/*!40000 ALTER TABLE `tbprodutopedido` DISABLE KEYS */;
INSERT INTO `tbprodutopedido` VALUES (1,1,2,4,1,34.50),(2,2,2,2,1,34.50),(3,2,3,11,2,15.98);
/*!40000 ALTER TABLE `tbprodutopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbvariacaoproduto`
--

LOCK TABLES `tbvariacaoproduto` WRITE;
/*!40000 ALTER TABLE `tbvariacaoproduto` DISABLE KEYS */;
INSERT INTO `tbvariacaoproduto` VALUES (1,1,'Morango - Pote 2L',34.50,'morangoPote.png',2),(2,1,'Coco Branco - Pote 2L',34.50,'cocoPote.png',2),(3,1,'Leite Condensado - Pote 2L',34.50,'leite-condensadoPote.png',2),(4,1,'Milho Verde - Pote 2L',34.50,'milho-verdePote.png',2),(5,1,'Napolitano - Pote 2L',36.50,'napolitanoPote.png',2),(6,1,'Havaiano',36.50,'havaianoPote.png',2),(7,1,'Chocolitano',36.50,'chocolitanoPote.png',2),(8,1,'Picolé - Grego Morango',7.99,'grego-morangoPicole.png',3),(9,1,'Picolé - Mousse de Doce de Leite',7.99,'mousse-doce-leitePicole.png',3),(10,1,'Picolé - Açaí',7.99,'acaiPicole.png',3),(11,1,'Picolé - Flocos',7.99,'flocosPicole.png',3),(12,1,'Pote 2L - Açaí com Morango ',46.50,'acai-morangoAcai.png',4),(13,1,'Pote 2L - Açaí com Banana ',46.50,'acai-bananaAcai.png',4),(14,1,'Pote 2L - Açaí com Guaraná',46.50,'acai-guaranaAcai.png',4),(15,1,'Pote 2L - Açaí com Iogurte',46.50,'acai-iogurteAcai.png',4),(16,1,'Pote 2L - Açaí com Leitinho',46.50,'acai-leitinhoAcai.png',4),(17,1,'Picolé - Coraçãozinho',7.99,'coracaozinhoPicole.png',3),(18,1,'ChupChup - Unicórnio',3.99,'unicornioChup.png',5),(19,1,'Chup Chup - Coco',3.99,'cocoChup.png',5),(20,1,'Chup Chup - Morango',3.99,'morangoChup.png',5),(21,1,'ChupChup - Maracujá',3.99,'maracujaChup.png',5),(22,1,'Chup Chup - Leite Condensado',3.99,'leite-condensadoChup.png',5),(23,1,'Sundae - Morango',6.99,'morangoSundae.png',6),(24,1,'Sundae - Baunilha',6.99,'baunilhaSundae.png',6);
/*!40000 ALTER TABLE `tbvariacaoproduto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-12 17:42:24
