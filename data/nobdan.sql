-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: nobdan
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Adrianna BB',1),(2,'Renato BB',1),(3,'Adrianna Cartão Santander',2),(4,'Renato Cartão BB',2);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Renato','jrdantas@yahoo.com.br','Boas vindas!');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(100) NOT NULL,
  `due_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` decimal(9,2) NOT NULL,
  `installment_group` int(11) DEFAULT NULL,
  `installment` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `group1` varchar(50) DEFAULT NULL,
  `group2` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `expense_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_expense_group_idx` (`expense_group_id`),
  CONSTRAINT `fk_expense_group` FOREIGN KEY (`expense_group_id`) REFERENCES `expense_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (352,'Coelce','2017-10-05 00:00:00',291.79,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(353,'Cagece','2017-10-01 00:00:00',96.94,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(354,'Vivo Celular','2017-10-20 00:00:00',109.80,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(355,'Vivo','2017-10-20 00:00:00',153.03,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(356,'Corpus','2017-10-10 00:00:00',226.60,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(357,'Associação Alphaville','2017-10-10 00:00:00',506.57,NULL,NULL,2,'Serviço','Condomínio','jrdantas@yahoo.com.br',0,NULL),(358,'Otto','2017-10-01 00:00:00',100.00,NULL,NULL,1,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(359,'Jardineiro','2017-10-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(360,'Faxineira','2017-10-01 00:00:00',900.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(361,'Colégio Sofia','2017-10-15 00:00:00',2153.77,NULL,NULL,1,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(362,'Inglês Sofia','2017-10-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(363,'Seguro Tucsson','2017-10-10 00:00:00',289.58,6,4,2,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(364,'Alphaville Urbanismo','2017-10-05 00:00:00',1832.21,24,8,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(365,'Cartão família Adrianna','2017-10-03 00:00:00',7387.55,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(366,'Cartão familia Renato','2017-10-05 00:00:00',524.43,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(367,'Coelce','2017-09-05 00:00:00',220.53,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(368,'Cagece','2017-09-01 00:00:00',112.90,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(369,'Vivo Celular','2017-09-20 00:00:00',169.54,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(370,'Vivo','2017-09-20 00:00:00',157.67,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(371,'Corpus','2017-09-10 00:00:00',226.60,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(372,'Associação Alphaville','2017-09-10 00:00:00',506.57,NULL,NULL,2,'Serviço','Condomínio','jrdantas@yahoo.com.br',0,NULL),(373,'Otto','2017-09-01 00:00:00',100.00,NULL,NULL,2,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(374,'Jardineiro','2017-09-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(375,'Faxineira','2017-09-01 00:00:00',800.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(376,'Colégio Sofia','2017-09-15 00:00:00',2153.77,NULL,NULL,1,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(377,'Inglês Sofia','2017-09-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(378,'Seguro Tucsson','2017-09-10 00:00:00',289.58,6,3,2,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(379,'Alphaville Urbanismo','2017-09-05 00:00:00',1830.45,24,7,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(380,'Cartão família Adrianna','2017-09-03 00:00:00',5943.58,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(381,'Cartão familia Renato','2017-09-05 00:00:00',543.00,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(382,'Coelce','2017-08-05 00:00:00',221.69,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(383,'Cagece','2017-08-01 00:00:00',69.29,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(384,'Vivo Celular','2017-08-20 00:00:00',169.54,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(385,'Vivo','2017-08-20 00:00:00',157.67,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(386,'Corpus','2017-08-10 00:00:00',226.60,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(387,'Jardineiro','2017-08-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(388,'Faxineira','2017-08-01 00:00:00',1000.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(389,'Colégio Sofia','2017-08-15 00:00:00',1917.27,NULL,NULL,1,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(390,'Inglês Sofia','2017-08-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(391,'Karatê Sofia','2017-08-10 00:00:00',92.00,NULL,NULL,2,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(392,'Seguro Tucsson','2017-08-10 00:00:00',289.58,6,2,2,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(393,'Alphaville Urbanismo','2017-08-05 00:00:00',1843.65,24,6,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(394,'Cartão família Adrianna','2017-08-03 00:00:00',6426.55,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(395,'Cartão familia Renato','2017-08-05 00:00:00',1749.77,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(396,'Coelce','2017-07-05 00:00:00',390.94,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(397,'Cagece','2017-07-01 00:00:00',78.97,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(398,'Vivo Celular','2017-07-20 00:00:00',169.54,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(399,'Vivo','2017-07-20 00:00:00',153.03,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(400,'Corpus','2017-07-10 00:00:00',226.60,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(401,'Jardineiro','2017-07-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(402,'Faxineira','2017-07-01 00:00:00',800.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(403,'Colégio Sofia','2017-07-15 00:00:00',2019.17,NULL,NULL,2,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(404,'Inglês Sofia','2017-07-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(405,'Beach Park','2017-07-09 00:00:00',273.03,NULL,NULL,2,'Lazer','Passeio','jrdantas@yahoo.com.br',0,NULL),(406,'Seguro Tucsson','2017-07-10 00:00:00',289.58,6,1,2,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(407,'Alphaville Urbanismo','2017-07-05 00:00:00',1856.02,24,5,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(408,'Viagem a Flexeiras','2017-07-15 00:00:00',300.00,NULL,NULL,1,'Lazer','Viagem Lazer','jrdantas@yahoo.com.br',0,NULL),(409,'Cartão família Adrianna','2017-07-03 00:00:00',8119.52,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(410,'Cartão familia Renato','2017-07-05 00:00:00',620.60,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(411,'Coelce','2017-06-05 00:00:00',317.46,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(412,'Cagece','2017-06-01 00:00:00',57.71,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(413,'Vivo Celular','2017-06-20 00:00:00',258.14,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(414,'Vivo','2017-06-20 00:00:00',119.00,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(415,'Corpus','2017-06-10 00:00:00',226.60,NULL,NULL,1,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(416,'Otto','2017-06-01 00:00:00',150.00,NULL,NULL,1,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(417,'Jardineiro','2017-06-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(418,'Faxineira','2017-06-01 00:00:00',900.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(419,'Colégio Sofia','2017-06-15 00:00:00',2249.97,NULL,NULL,1,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(420,'Inglês Sofia','2017-06-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(421,'Karatê Sofia','2017-06-01 00:00:00',92.00,NULL,NULL,2,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(422,'Paracuru','2017-06-10 00:00:00',200.00,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(423,'Dedetizadora','2017-06-09 00:00:00',200.00,NULL,NULL,1,'Lazer','Passeio','jrdantas@yahoo.com.br',0,NULL),(424,'Academia','2017-06-01 00:00:00',120.00,NULL,NULL,1,'Saúde','Academia','jrdantas@yahoo.com.br',0,NULL),(425,'Alphaville Urbanismo','2017-06-05 00:00:00',1873.45,24,4,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(426,'Manutenção Casa','2017-06-01 00:00:00',140.00,NULL,NULL,2,'Serviço','Casa','jrdantas@yahoo.com.br',0,NULL),(427,'Cartão família Adrianna','2017-06-03 00:00:00',8463.50,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(428,'Cartão familia Renato','2017-06-05 00:00:00',850.12,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(429,'Coelce','2017-05-05 00:00:00',265.77,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(430,'Cagece','2017-05-01 00:00:00',57.71,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(431,'Vivo Celular','2017-05-20 00:00:00',169.99,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(432,'Vivo','2017-05-20 00:00:00',157.67,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(433,'Corpus','2017-05-10 00:00:00',216.70,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(434,'Gás','2017-05-01 00:00:00',68.00,NULL,NULL,1,'Serviço','Gás','jrdantas@yahoo.com.br',0,NULL),(435,'Faxineira','2017-05-01 00:00:00',900.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(436,'Colégio Sofia','2017-05-15 00:00:00',2243.97,NULL,NULL,2,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(437,'Inglês Sofia','2017-05-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(438,'Conserto ventilador','2017-05-09 00:00:00',30.00,NULL,NULL,2,'Serviço','Casa','jrdantas@yahoo.com.br',0,NULL),(439,'Alphaville Urbanismo','2017-05-05 00:00:00',1894.23,24,3,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(440,'Conserto alarme','2017-05-10 00:00:00',35.00,NULL,NULL,2,'Serviço','Casa','jrdantas@yahoo.com.br',0,NULL),(441,'Manutenção Casa','2017-05-10 00:00:00',650.40,NULL,NULL,2,'Serviço','Casa','jrdantas@yahoo.com.br',0,NULL),(442,'Desentupidora','2017-05-15 00:00:00',150.00,NULL,NULL,1,'Serviço','Casa','jrdantas@yahoo.com.br',0,NULL),(443,'Cartão família Adrianna','2017-05-03 00:00:00',4434.54,NULL,NULL,1,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(444,'Cartão familia Renato','2017-05-05 00:00:00',2215.11,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(445,'Coelce','2017-04-05 00:00:00',332.28,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(446,'Cagece','2017-04-01 00:00:00',87.82,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(447,'Vivo Celular','2017-04-20 00:00:00',169.54,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(448,'Vivo','2017-04-20 00:00:00',157.67,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(449,'Corpus','2017-04-10 00:00:00',216.70,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(450,'Jardineiro','2017-04-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(451,'Faxineira','2017-04-01 00:00:00',800.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(452,'Colégio Sofia','2017-04-15 00:00:00',2421.34,NULL,NULL,1,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(453,'Inglês Sofia','2017-04-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(454,'Karatê Sofia','2017-04-01 00:00:00',18.00,NULL,NULL,2,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(455,'Licenciamento','2017-04-10 00:00:00',206.15,NULL,NULL,2,'Imposto','Imposto','jrdantas@yahoo.com.br',0,NULL),(456,'Seguro Tracker','2017-04-10 00:00:00',321.40,6,6,1,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(457,'Alphaville Urbanismo','2017-04-05 00:00:00',1893.95,24,2,1,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(458,'Cartão família Adrianna','2017-04-03 00:00:00',3990.70,NULL,NULL,1,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(459,'Cartão familia Renato','2017-04-05 00:00:00',3076.76,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(460,'Coelce','2017-03-05 00:00:00',309.11,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(461,'Cagece','2017-03-01 00:00:00',99.10,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(462,'Vivo Celular','2017-03-20 00:00:00',163.84,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(463,'Vivo','2017-03-20 00:00:00',148.49,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(464,'Corpus','2017-03-10 00:00:00',216.70,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(465,'Gás','2017-03-15 00:00:00',90.00,NULL,NULL,1,'Serviço','Gás','jrdantas@yahoo.com.br',0,NULL),(466,'Otto','2017-03-01 00:00:00',25.00,NULL,NULL,1,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(467,'Jardineiro','2017-03-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(468,'Faxineira','2017-03-01 00:00:00',900.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(469,'Colégio Sofia','2017-03-15 00:00:00',1052.27,NULL,NULL,2,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(470,'Inglês Sofia','2017-03-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(471,'Seguro Tracker','2017-03-10 00:00:00',321.40,6,5,1,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(472,'Alphaville Urbanismo','2017-03-05 00:00:00',1892.37,24,1,1,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(473,'Chopp','2017-03-01 00:00:00',228.00,NULL,NULL,1,'Lazer','Viagem Lazer','jrdantas@yahoo.com.br',0,NULL),(474,'Carnaval','2017-03-01 00:00:00',340.00,NULL,NULL,1,'Lazer','Viagem Lazer','jrdantas@yahoo.com.br',0,NULL),(475,'Cartão família Adrianna','2017-03-03 00:00:00',4618.77,NULL,NULL,1,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(476,'Cartão familia Renato','2017-03-05 00:00:00',3725.06,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(477,'Coelce','2017-02-05 00:00:00',186.31,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(478,'Cagece','2017-02-01 00:00:00',30.61,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(479,'Vivo Celular','2017-02-20 00:00:00',189.99,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(480,'Vivo','2017-02-20 00:00:00',148.49,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(481,'Corpus','2017-02-10 00:00:00',216.70,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(482,'Gás','2017-02-01 00:00:00',90.00,NULL,NULL,2,'Serviço','Gás','jrdantas@yahoo.com.br',0,NULL),(483,'Deusiane','2017-02-01 00:00:00',560.00,NULL,NULL,2,'Mão de obra','Doméstica','jrdantas@yahoo.com.br',0,NULL),(484,'Encargos Deusiane','2017-02-07 00:00:00',306.26,NULL,NULL,2,'Mão de obra','Doméstica','jrdantas@yahoo.com.br',0,NULL),(485,'Recisão Deusiane','2017-02-01 00:00:00',2951.62,NULL,NULL,2,'Mão de obra','Doméstica','jrdantas@yahoo.com.br',0,NULL),(486,'Jardineiro','2017-02-15 00:00:00',70.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(487,'Faxineira','2017-02-01 00:00:00',180.00,NULL,NULL,1,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(488,'Colégio Sofia','2017-02-15 00:00:00',935.10,NULL,NULL,2,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(489,'Inglês Sofia','2017-02-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(490,'IPTU','2017-02-05 00:00:00',364.99,NULL,NULL,2,'Imposto','Imposto','jrdantas@yahoo.com.br',0,NULL),(491,'IPVA','2017-02-10 00:00:00',1466.04,NULL,NULL,2,'Imposto','Imposto','jrdantas@yahoo.com.br',0,NULL),(492,'Legumes','2017-02-10 00:00:00',94.00,NULL,NULL,2,'Alimentação','Supermercado','jrdantas@yahoo.com.br',0,NULL),(493,'Seguro Tracker','2017-02-10 00:00:00',321.40,6,4,1,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(494,'Alphaville Urbanismo','2017-02-05 00:00:00',1892.37,NULL,NULL,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(495,'Otto','2017-02-01 00:00:00',50.00,NULL,NULL,2,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(496,'Cartão família Adrianna','2017-02-03 00:00:00',4243.18,NULL,NULL,1,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(497,'Cartão familia Renato','2017-02-05 00:00:00',4797.90,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(498,'Coelce','2017-01-05 00:00:00',355.94,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(499,'Cagece','2017-01-02 00:00:00',85.68,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(500,'Vivo Celular','2017-01-20 00:00:00',189.99,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(501,'Vivo','2017-01-20 00:00:00',148.49,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(502,'Corpus','2017-01-10 00:00:00',216.70,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(503,'Gás','2017-01-01 00:00:00',90.00,NULL,NULL,2,'Serviço','Gás','jrdantas@yahoo.com.br',0,NULL),(504,'Deusiane','2017-01-01 00:00:00',1120.65,NULL,NULL,2,'Mão de obra','Doméstica','jrdantas@yahoo.com.br',0,NULL),(505,'Encargos Deusiane','2017-01-07 00:00:00',677.71,NULL,NULL,2,'Mão de obra','Doméstica','jrdantas@yahoo.com.br',0,NULL),(506,'Otto','2017-01-01 00:00:00',1236.00,NULL,NULL,2,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(507,'Jardineiro','2017-01-15 00:00:00',150.00,NULL,NULL,2,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(508,'Faxineira','2017-01-01 00:00:00',180.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(509,'Colégio Sofia','2017-01-15 00:00:00',935.10,NULL,NULL,2,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(510,'Doação','2017-01-01 00:00:00',200.00,NULL,NULL,1,'Serviço','Doação','jrdantas@yahoo.com.br',0,NULL),(511,'Material escolar','2017-01-02 00:00:00',145.00,NULL,NULL,2,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(512,'Natação Sofia','2017-01-02 00:00:00',90.00,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(513,'Karatê Sofia','2017-01-02 00:00:00',60.00,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(514,'Jiu-Jitu Sofia','2017-01-02 00:00:00',90.00,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(515,'Natação Renato','2017-01-02 00:00:00',108.00,NULL,NULL,1,'Saúde','Academia','jrdantas@yahoo.com.br',0,NULL),(516,'Academia Adrianna','2017-01-02 00:00:00',80.00,NULL,NULL,1,'Saúde','Academia','jrdantas@yahoo.com.br',0,NULL),(517,'Legumes','2017-01-02 00:00:00',94.00,NULL,NULL,2,'Alimentação','Supermercado','jrdantas@yahoo.com.br',0,NULL),(518,'Seguro Tracker','2017-01-10 00:00:00',321.40,6,3,1,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(519,'Alphaville Urbanismo','2017-01-05 00:00:00',1882.21,NULL,NULL,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(520,'Beach Park','2017-01-01 00:00:00',130.30,NULL,NULL,2,'Lazer','Passeio','jrdantas@yahoo.com.br',0,NULL),(521,'Cartão família Adrianna','2017-01-03 00:00:00',6526.66,NULL,NULL,1,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(522,'Cartão familia Renato','2017-01-05 00:00:00',349.88,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(523,'Coelce','2017-11-05 00:00:00',258.85,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(524,'Cagece','2017-11-01 00:00:00',85.77,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(525,'Vivo Celular','2017-11-20 00:00:00',110.50,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(526,'Vivo','2017-11-20 00:00:00',126.02,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(527,'Corpus','2017-11-10 00:00:00',226.60,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(528,'Associação Alphaville','2017-11-10 00:00:00',506.57,NULL,NULL,2,'Serviço','Condomínio','jrdantas@yahoo.com.br',0,NULL),(529,'Otto','2017-11-15 00:00:00',100.00,NULL,NULL,1,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(530,'Jardineiro','2017-11-01 00:00:00',90.00,NULL,NULL,1,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(531,'Faxineira','2017-11-15 00:00:00',900.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(532,'Colégio Sofia','2017-11-15 00:00:00',2120.77,NULL,NULL,1,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(533,'Inglês Sofia','2017-11-17 00:00:00',300.10,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(534,'Seguro Tracker','2017-11-10 00:00:00',348.26,6,1,1,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(535,'Seguro Tucsson','2017-11-10 00:00:00',289.58,6,5,2,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(536,'Alphaville Urbanismo','2017-11-05 00:00:00',1840.78,24,9,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(537,'Cartão família Adrianna','2017-11-03 00:00:00',6441.86,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(538,'Cartão familia Renato','2017-11-05 00:00:00',721.02,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(539,'Coelce','2017-12-05 00:00:00',376.90,NULL,NULL,2,'Serviço','Energia','jrdantas@yahoo.com.br',0,NULL),(540,'Cagece','2017-12-01 00:00:00',116.90,NULL,NULL,2,'Serviço','Água','jrdantas@yahoo.com.br',0,NULL),(541,'Vivo Celular','2017-12-20 00:00:00',110.50,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(542,'Vivo','2017-12-20 00:00:00',126.02,NULL,NULL,1,'Serviço','Telefone','jrdantas@yahoo.com.br',0,NULL),(543,'Corpus','2017-12-10 00:00:00',226.60,NULL,NULL,2,'Serviço','Segurança','jrdantas@yahoo.com.br',0,NULL),(544,'Associação Alphaville','2017-12-10 00:00:00',506.57,NULL,NULL,2,'Serviço','Condomínio','jrdantas@yahoo.com.br',0,NULL),(545,'Otto','2017-12-15 00:00:00',50.00,NULL,NULL,2,'Serviço','Animal','jrdantas@yahoo.com.br',0,NULL),(546,'Jardineiro','2017-12-01 00:00:00',70.00,NULL,NULL,2,'Mão de obra','Jardineiro','jrdantas@yahoo.com.br',0,NULL),(547,'Faxineira','2017-12-15 00:00:00',400.00,NULL,NULL,2,'Mão de obra','Faxineira','jrdantas@yahoo.com.br',0,NULL),(548,'Colégio Sofia','2017-12-15 00:00:00',2057.27,NULL,NULL,1,'Educação','Colégio','jrdantas@yahoo.com.br',0,NULL),(549,'Inglês Sofia','2017-12-15 00:00:00',408.50,NULL,NULL,1,'Educação','Cursos','jrdantas@yahoo.com.br',0,NULL),(550,'Licenciamento','2017-12-10 00:00:00',206.15,NULL,NULL,2,'Imposto','Imposto','jrdantas@yahoo.com.br',0,NULL),(551,'Seguro Tracker (2/6)','2017-12-10 00:00:00',348.26,6,2,1,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(552,'Seguro Tucsson (6/6)','2017-12-10 00:00:00',289.58,6,6,2,'Seguro','Carro','jrdantas@yahoo.com.br',0,NULL),(553,'Alphaville Urbanismo','2017-12-05 00:00:00',1844.40,24,10,2,'Investimento','Imóvel','jrdantas@yahoo.com.br',0,NULL),(554,'Cartão família Adrianna','2017-12-03 00:00:00',7094.64,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL),(555,'Cartão familia Renato','2017-12-05 00:00:00',545.98,NULL,NULL,2,'cc','cc','jrdantas@yahoo.com.br',0,NULL);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_group`
--

DROP TABLE IF EXISTS `expense_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `due_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(100) NOT NULL,
  `private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_group`
--

LOCK TABLES `expense_group` WRITE;
/*!40000 ALTER TABLE `expense_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `family_name` varchar(100) NOT NULL,
  `participation_factor` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(100) NOT NULL,
  `pay_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` decimal(9,2) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `typeof` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (2,'SERPRO','2017-01-31 00:00:00',8896.34,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(3,'SERPRO','2017-02-28 00:00:00',6798.09,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(4,'SERPRO','2017-03-31 00:00:00',7535.98,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(5,'SERPRO','2017-04-28 00:00:00',8393.64,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(6,'SERPRO','2017-05-31 00:00:00',8399.73,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(7,'SERPRO','2017-06-30 00:00:00',15289.99,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(8,'SERPRO','2017-07-31 00:00:00',8128.93,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(9,'SERPRO','2017-08-31 00:00:00',7812.29,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(10,'SERPRO','2017-09-29 00:00:00',7866.76,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(11,'SERPRO','2017-10-31 00:00:00',8594.14,'Salário',2,NULL,'jrdantas@yahoo.com.br',0),(12,'SERPRO','2017-11-30 00:00:00',20183.52,'Salário',2,NULL,'jrdantas@yahoo.com.br',0);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `passwd` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Renato','SERPRO','jrdantas@yahoo.com.br','$5$rounds=535000$oFVH1WxFOCTKJTV4$nNVjztvxTDtt3nPKM1KSVGHNBGSGNQem5rNU0nJMhI/'),(2,'adrianna','esposa','adriannanobrega@hotmail.com','$5$rounds=535000$mxQ/nSZa.c8l4e3P$9vBeOWBAv3YAqsSRrrhKn5wQM4SzUK7KaxVtNwRzvA6');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-08 19:11:45
