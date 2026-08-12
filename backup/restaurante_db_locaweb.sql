-- MySQL dump 10.13  Distrib 8.4.8, for Linux (x86_64)
--
-- Host: localhost    Database: restaurante_db
-- ------------------------------------------------------
-- Server version	8.4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;

--
-- Table structure for table `categorias_cardapio`
--

DROP TABLE IF EXISTS `categorias_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_cardapio` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(50) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `status_categoria` varchar(10) NOT NULL DEFAULT 'ATIVO',
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nome_categoria` (`nome_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_cardapio`
--

/*!40000 ALTER TABLE `categorias_cardapio` DISABLE KEYS */;
INSERT INTO `categorias_cardapio` VALUES (1,'Entradas','Pratos pequenos para iniciar a refeições','ATIVO'),(2,'Pratos Principais','Refeições completas e substanciais','ATIVO'),(3,'Bebidas não alcolicas','Sucos, refrigerantes, aguas e chãs','ATIVO'),(4,'Bebidas Alcolicas','Vinhos, cervejas e destilados','ATIVO'),(5,'Sobremesas','Doces e sobremesas para finalizar','ATIVO');
/*!40000 ALTER TABLE `categorias_cardapio` ENABLE KEYS */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Carolina Silva','(11) 98765-4321','ana.silva@email.com','2026-06-03 11:13:37'),(2,'Bruno Mendes','(11) 99876-5432','bruno.mendes@email.com','2026-06-03 11:13:37'),(3,'Carla Pereira','(11) 91234-5678','carla.pereira@email.com','2026-06-03 11:13:37'),(4,'Daniel Rocha','(11) 92345-6789','daniel.rocha@email.com','2026-06-03 11:13:37'),(5,'Eduarda Santos','(11) 93456-7890','eduarda.santos@email.com','2026-06-03 11:13:37');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

--
-- Table structure for table `conteudos_site`
--

DROP TABLE IF EXISTS `conteudos_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteudos_site` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pagina` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chave` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('texto','imagem') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'texto',
  `valor` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `conteudos_site_pagina_secao_chave_unique` (`pagina`,`secao`,`chave`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudos_site`
--

/*!40000 ALTER TABLE `conteudos_site` DISABLE KEYS */;
INSERT INTO `conteudos_site` VALUES (1,'home','banner_slide_1','imagem','imagem','restaurante/images/bg/bg-image-4.webp','2026-08-11 11:32:50','2026-08-11 11:32:50'),(2,'home','banner_slide_1','pretitulo','texto','Servimos comida, harmonia e risos desde 1998','2026-08-11 11:32:50','2026-08-11 11:47:53'),(3,'home','banner_slide_1','titulo','texto','Deliciosos frutos do mar com a verdadeira essência da alta gastronomia.','2026-08-11 11:32:50','2026-08-11 11:47:53'),(4,'home','banner_slide_1','botao_primario_texto','texto','Ver mais','2026-08-11 11:32:50','2026-08-11 11:32:50'),(5,'home','banner_slide_1','botao_secundario_texto','texto','Cardapio de Comida','2026-08-11 11:32:50','2026-08-11 11:32:50'),(6,'home','banner_slide_2','imagem','imagem','restaurante/images/bg/bg-image-5.webp','2026-08-11 11:32:50','2026-08-11 11:32:50'),(7,'home','banner_slide_2','pretitulo','texto','Servimos comida, harmonia e risos desde 1998','2026-08-11 11:32:50','2026-08-11 11:32:50'),(8,'home','banner_slide_2','titulo','texto','Sabores frescos do oceano direto para a sua mesa','2026-08-11 11:32:50','2026-08-11 11:32:50'),(9,'home','banner_slide_2','botao_primario_texto','texto','Mais opções','2026-08-11 11:32:50','2026-08-11 11:32:50'),(10,'home','banner_slide_2','botao_secundario_texto','texto','Cardapio de Comida','2026-08-11 11:32:50','2026-08-11 11:32:50'),(11,'home','banner_slide_3','imagem','imagem','restaurante/images/bg/bg-image-6.webp','2026-08-11 11:32:50','2026-08-11 11:32:50'),(12,'home','banner_slide_3','pretitulo','texto','Servimos comida, harmonia e risos desde 1998','2026-08-11 11:32:50','2026-08-11 11:32:50'),(13,'home','banner_slide_3','titulo','texto','Deliciosos frutos do mar com um toque de sofisticação','2026-08-11 11:32:50','2026-08-11 11:32:50'),(14,'home','banner_slide_3','botao_primario_texto','texto','Ver mais','2026-08-11 11:32:50','2026-08-11 11:32:50'),(15,'home','banner_slide_3','botao_secundario_texto','texto','Cardapio de Comida','2026-08-11 11:32:50','2026-08-11 11:32:50'),(16,'home','blog_cabecalho','titulo','texto','Blog & Insights','2026-08-11 13:37:43','2026-08-11 13:37:43'),(17,'home','blog_cabecalho','subtitulo','texto','É a história de um caso de amor eterno, Dieter Delicioz e o Oceano Atlântico no ar livre.','2026-08-11 13:37:43','2026-08-11 13:37:43'),(18,'home','blog_post_1','imagem','imagem','restaurante/images/blog/blog-01.jpg','2026-08-11 13:37:43','2026-08-11 13:37:43'),(19,'home','blog_post_1','tag','texto','Fast Food','2026-08-11 13:37:43','2026-08-11 13:37:43'),(20,'home','blog_post_1','titulo','texto','Love and food: It is all about dinenos restaurant','2026-08-11 13:37:43','2026-08-11 13:37:43'),(21,'home','blog_post_2','imagem','imagem','restaurante/images/blog/blog-03.jpg','2026-08-11 13:37:43','2026-08-11 13:37:43'),(22,'home','blog_post_2','tag','texto','Dinner','2026-08-11 13:37:43','2026-08-11 13:37:43'),(23,'home','blog_post_2','titulo','texto','Enjoy an exceptional journey of taste of joy.','2026-08-11 13:37:43','2026-08-11 13:37:43'),(24,'home','blog_post_3','imagem','imagem','restaurante/images/blog/blog-04.jpg','2026-08-11 13:37:43','2026-08-11 13:37:43'),(25,'home','blog_post_3','tag','texto','Restaurant','2026-08-11 13:37:43','2026-08-11 13:37:43'),(26,'home','blog_post_3','titulo','texto','The opportunity to work abroad is a prospect, one','2026-08-11 13:37:43','2026-08-11 13:37:43'),(27,'home','blog_post_4','imagem','imagem','restaurante/images/blog/blog-02.jpg','2026-08-11 13:37:43','2026-08-11 13:37:43'),(28,'home','blog_post_4','tag','texto','Rice curry','2026-08-11 13:37:43','2026-08-11 13:37:43'),(29,'home','blog_post_4','titulo','texto','Food is the foundation of true happiness','2026-08-11 13:37:43','2026-08-11 13:37:43'),(30,'home','sobre_home','imagem_1','imagem','restaurante/images/about/about7.jpg','2026-08-11 14:02:50','2026-08-11 14:02:50'),(31,'home','sobre_home','imagem_2','imagem','restaurante/images/about/about8.jpg','2026-08-11 14:02:50','2026-08-11 14:02:50'),(32,'home','sobre_home','titulo','texto','Bem-vindo ao Nosso\nRestaurante de Luxo','2026-08-11 14:02:50','2026-08-11 14:02:50'),(33,'home','sobre_home','descricao','texto','É a história de um caso de amor eterno, Dieter Delicioz e o Oceano Atlântico. Nossa proximidade com as riquezas abundantes do mar e a excelente produção de Portugal.','2026-08-11 14:02:50','2026-08-11 14:02:50'),(34,'home','sobre_home','contador_numero','texto','30','2026-08-11 14:02:50','2026-08-11 14:02:50'),(35,'home','sobre_home','contador_texto','texto','Anos de Experiência','2026-08-11 14:02:50','2026-08-11 14:02:50'),(36,'home','sobre_home','botao_texto','texto','Mais Comidas','2026-08-11 14:02:50','2026-08-11 14:02:50');
/*!40000 ALTER TABLE `conteudos_site` ENABLE KEYS */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_contratacao` date NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ATIVO',
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Felipe Almeida','Gerente','(11) 94567-8901','2022-03-15','ATIVO'),(2,'Gabriela Costa','Garsom','(11) 95678-9012','2023-06-20','ATIVO'),(3,'Henrique Souza','Garsom','(11) 96789-0123','2023-08-10','ATIVO'),(4,'Isabela Fernandes','Cozinheiro','(11) 97890-1234','2021-11-05','ATIVO'),(5,'João Victor','Auxiliar de Cozinha','(11) 98901-2345','2024-01-12','ATIVO');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;

--
-- Table structure for table `itens_cardapio`
--

DROP TABLE IF EXISTS `itens_cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_cardapio` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nome_item` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `disponivel` tinyint(1) DEFAULT '1',
  `foto_cardapio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `fk_item_categoria` (`id_categoria`),
  CONSTRAINT `fk_item_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_cardapio` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_cardapio`
--

/*!40000 ALTER TABLE `itens_cardapio` DISABLE KEYS */;
INSERT INTO `itens_cardapio` VALUES (1,1,'Bruschetta','Pão italiano grelhado com tomate, manjericão e azeite',18.90,1,'produto_6a79da6b913e5.png'),(2,1,'Camarão Empanado','Camarões frescos empanados e fritos, servidos com molho tartaro',32.50,1,'produto_6a79dab64b7fb.png'),(3,2,'File Mignon ao Molho Madeira','File de carne nobre com molho rico de vinho madeira e cogumelos',64.90,1,'produto_6a79db2ac09bb.png'),(4,2,'Risoto de Cogumelos','Arroz arabe cozido lentamente com cogumelos variados e queijo parmesão',48.50,1,'produto_6a79dbc24c324.png'),(5,3,'Suco de Laranja Natural','Suco fresco de laranjas selecionadas - 500ml',9.80,1,'produto_6a79dbb1e72d7.png'),(6,3,'Refrigerante','Diversos sabores - 350ml',6.50,1,'produto_6a79db7a1f6bc.png'),(7,4,'Vinho Tinto Seco','Garrafa 750ml - Safra 2022',89.00,1,'produto_6a79ded9ae6dd.png'),(8,4,'Cerveja Artesanal','Lata 355ml',14.20,1,'produto_6a79dadf3abf1.png'),(9,5,'Pudim de Leite','Pudim tradicional com calda caramelizada e coco queimado',16.90,1,'produto_6a79db696b7b7.png'),(10,5,'Torta de Limão','Massa crocante com recheio cremoso de limão e cobertura de merengue',19.50,1,'produto_6a79dec59ff89.png');
/*!40000 ALTER TABLE `itens_cardapio` ENABLE KEYS */;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `id_item_pedido` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_item` int NOT NULL,
  `quantidade` int NOT NULL DEFAULT '1',
  `preco_unitario` decimal(10,2) NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_item_pedido`),
  KEY `fk_item_pedido_pedido` (`id_pedido`),
  KEY `fk_item_pedido_item` (`id_item`),
  CONSTRAINT `fk_item_pedido_item` FOREIGN KEY (`id_item`) REFERENCES `itens_cardapio` (`id_item`),
  CONSTRAINT `fk_item_pedido_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,1,1,18.90,''),(2,1,3,1,64.90,'Sem pimenta'),(3,1,6,2,6.50,''),(4,1,9,1,16.90,''),(5,2,2,1,32.50,''),(6,2,4,1,48.50,'Mais queijo parmesÃ£o'),(7,2,5,1,9.80,''),(8,3,1,1,18.90,''),(9,3,7,1,89.00,''),(10,4,3,2,64.90,''),(11,4,8,4,14.20,'Gelo Ã  parte');
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id_mesa` int NOT NULL AUTO_INCREMENT,
  `numero_mesa` int NOT NULL,
  `capacidade` int NOT NULL,
  `status` varchar(20) DEFAULT 'disponivel',
  PRIMARY KEY (`id_mesa`),
  UNIQUE KEY `numero_mesa` (`numero_mesa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,1,4,'disponivel'),(2,2,6,'disponivel'),(3,3,2,'disponivel'),(4,4,8,'ocupada'),(5,5,4,'disponivel'),(6,6,10,'manutencao'),(7,7,2,'disponivel'),(8,8,6,'reservada');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_05_09_154936_add_foto_to_itens_cardapio_table',1),(5,'2026_05_10_154817_create_horarios_table',1),(6,'2026_05_25_112634_create_itens_cardapio_table',1),(7,'2026_08_10_134048_add_status_categoria_to_categorias_cardapio_table',2),(8,'2026_08_10_143407_add_status_to_funcionarios_table',3),(9,'2026_08_11_110020_rename_foto_to_foto_cardapio_in_itens_cardapio_table',4),(10,'2026_08_11_112218_create_conteudos_site_table',5),(11,'2026_08_11_125835_seed_conteudos_site_blog_home',6),(12,'2026_08_11_135232_seed_conteudos_site_sobre_home',7),(13,'2026_08_12_134722_seed_admin_user',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_mesa` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_funcionario` int NOT NULL,
  `data_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `status_pedido` varchar(20) DEFAULT 'em_preparo',
  `valor_total` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_mesa` (`id_mesa`),
  KEY `fk_pedido_cliente` (`id_cliente`),
  KEY `fk_pedido_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_pedido_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_pedido_mesa` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,4,NULL,2,'2026-06-03 11:13:37','pago',128.70),(2,1,1,3,'2026-06-03 11:13:37','em_preparo',89.40),(3,5,3,2,'2026-06-03 11:13:37','entregue',76.30),(4,8,NULL,3,'2026-06-03 11:13:37','em_preparo',152.60);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_mesa` int NOT NULL,
  `id_funcionario` int DEFAULT NULL,
  `data_reserva` date NOT NULL,
  `hora_reserva` time NOT NULL,
  `quantidade_pessoas` int NOT NULL,
  `status_reserva` varchar(20) DEFAULT 'confirmada',
  `observacao` text,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reserva`),
  UNIQUE KEY `id_mesa_horario` (`id_mesa`,`data_reserva`,`hora_reserva`),
  KEY `fk_reserva_cliente` (`id_cliente`),
  KEY `fk_reserva_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_reserva_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_reserva_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `fk_reserva_mesa` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,2,2,'2026-05-05','19:00:00',5,'confirmada','AniversÃ¡rio de casal - preferem mesa perto da janela','2026-06-03 11:13:37'),(2,2,3,3,'2026-05-05','20:30:00',2,'confirmada','Cliente com alergia a camarÃ£o','2026-06-03 11:13:37'),(3,3,5,2,'2026-05-06','18:45:00',4,'confirmada',' ','2026-06-03 11:13:37'),(4,4,7,3,'2026-05-06','19:15:00',2,'cancelada','Cliente ligou e desmarcou','2026-06-03 11:13:37'),(5,5,1,2,'2026-05-07','20:00:00',4,'confirmada','Grupo de amigos - chegam separados','2026-06-03 11:13:37');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0JNNVcv2RyzXafr3LM8Fo4CmifHn0M2WQiSdhwgM',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiI5ZEhFRkptWVJvbE5ZRmpOazVodVY1OEVQa3FRWWY3SGs3bnYyTGFtIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJ1cmwiOnsiaW50ZW5kZWQiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODA4MVwvYWRtaW5cL3Byb2R1dG9zIn0sIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODA4MVwvYWRtaW5cL3Byb2R1dG9zIiwicm91dGUiOiJhZG1pbi5wcm9kdXRvcyJ9fQ==',1786542579),('0QD1Wn5mjKPLFOrbM86K4miTCO4K51NWN04DJ233',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiI1VUIySFFQMFB4d01uVUVJNnhPc0R4cHpmQ05XMnRZendpVmFZTHdSIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvbG9naW4iLCJyb3V0ZSI6ImFkbWluLmxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786542568),('2nn4T57uJer2d4cB8cStc5y6Se2dAKPc3prd3CS7',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJ6Nk9IOGQ2RkRXcXJWTjZ0OUV1OTRuY1FCTnNwOFBOVFVvS08zZkVXIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOlsic3VjY2VzcyJdLCJuZXciOltdfSwic3VjY2VzcyI6IlByb2R1dG8gY2FkYXN0cmFkbyBjb20gc3VjZXNzbyEifQ==',1786536636),('6RRZVRwd6nNTTvZIMZtmZNfdr3VpkHiD5bwR1iW4',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJRN2RGeW5PR2EwbVhQMGx0ZkZxMHhyTE9TcGZ1Y3JhTXV6NU4xVXduIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvbG9naW4iLCJyb3V0ZSI6ImFkbWluLmxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786542556),('c0nsphRTw9vJP3mgU1G4q8rXj0HyREkHPeBHtxnk',1,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJOZ3FCRnYyOTViMWVQYnFHdTFldHRBaDR1bXdZT3V6N1luZmFDaU43IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjF9',1786542481),('cF5lhoSFVMZ4VevmpFsUD9rMpjpZRlg5q4tpHNHp',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJ3VkZRdHJINGFRWkF0RzBRT3o4MmF0cHF6U2pOMjFoNjVDZmF2T2lCIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvbG9naW4iLCJyb3V0ZSI6ImFkbWluLmxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786542503),('EAZIB4Hm4CffaQf1SJTbnG7es2iGixYxJWKMVE90',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJEdER5SkZaZlJBdXlzT21Za3JhaEhaRGFjc0pMbktNVUpvdkJsZHVzIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786537398),('FE4JYnWmh5fflp8cveG1R7W5sssfmzrHywg9aFOo',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJuaVh1dkxzRjZIT0ZKVHZZUmJFc0ZuTGw1ZmtaWWlaWEF5MlhOdHgwIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786539292),('IuLI4MalfjUIgEw23QLxZRgnvIkamYDvoiyhH3Eb',NULL,'172.21.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0','eyJfdG9rZW4iOiIzTTBtcXRPd3gxRlY2M1ludURKVDR5TW1xNVdJWVcwd0xZTE5RVzI2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786538259),('JcxfOutyZDS4whqDLJhUsd7XjXcJc2Zup0bddJDp',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJ3V2NQTXFDR0Q1em9JREFjWHRuRXhheEdiT0RaSk1SRVFUd21qR2VhIiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODFcL2FkbWluXC9wcm9kdXRvcyJ9LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODFcL2FkbWluXC9wcm9kdXRvcyIsInJvdXRlIjoiYWRtaW4ucHJvZHV0b3MifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1786542458),('MO88mnFjHuLAubVgBWuiVtT4JmnY66nEKJaFQhJf',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJETGNpZHlORUw3eDdybWxEd2tFcVplWmVZTUtNMXg0a25lMU1jaW4wIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvbG9naW4iLCJyb3V0ZSI6ImFkbWluLmxvZ2luIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786542458),('Ny8QOr6jOw4gjwgHnMdKcxsgY9TpFSJmA9sdLLeX',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJuUFRndlJ3dU5UbmpqZVAwN2RkcTZxSmRPUHhKUmZWNDhKYVdlYmFNIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOlsic3VjY2VzcyJdLCJuZXciOltdfSwic3VjY2VzcyI6IlByb2R1dG8gZXhjbHVcdTAwZWRkbyBjb20gc3VjZXNzbyEifQ==',1786536940),('pmayNkUCLeFh2JGom7eIytPT7FwoguQHJKXO8nu8',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJzY3dGRU9lQVRCbG5IZmYxVGQ3UmtXZDBxaXoxeFBFUHpNSHJNWnRSIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786536930),('tuFF76x6KxdM8gsoOf0xVNwAbtolja7c5DsAIGAk',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJMVldjdFcyWnBGSUNQSFNNbzZPZFVSOWJpeXNNc3UyTm5uaFlpdzlCIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786537361),('UFwwGCBpMZLTbvsZgG9bsEXrt7uTFfU7kWazp4qt',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJVbzdNSWo4T2RIY2l3OXNTMUJiRUQwWGlYS1J3WWl1WnZqVjJqWVA0IiwidXJsIjp7ImludGVuZGVkIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODFcL2FkbWluXC9wcm9kdXRvcyJ9LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwODFcL2FkbWluXC9wcm9kdXRvcyIsInJvdXRlIjoiYWRtaW4ucHJvZHV0b3MifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1786542458),('XOQ0jgNkOlJrtMAVahoZHHoCGYh80sikeGVI1oNu',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiI3cmxiN2VMclJ3WmtVOVVOZDJTM2xIa3p1VHlGR2o4SkJ6ZnU1QVNTIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786539285),('zaSMdKv6Dmzt2OnpCjCUJ9byUekvBgLCKieyk4TY',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJwNzFRekh3OWFsWUtwbTZrcVQ2RkRqZ2UzWmNTbm5QeFc0d1N0bVVVIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786539277),('zbZOkVgGPVJILRwANTQt1IX9YcnzA83Kme8kif0y',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJHblc3ZVVWME84OEtCMjl6VE56d2N6RE9HM1ZGemR5dkZmTDR2cjlKIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786537386);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrador','admin@davilla.com.br',NULL,'$2y$12$M0iojjnNS/xzql0t2q4P5etMjmnk0V1N6L1qASKntaa/IrkMMlfnm',NULL,'2026-08-12 13:47:32','2026-08-12 13:47:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Dumping events for database 'restaurante_db'
--

--
-- Dumping routines for database 'restaurante_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-12 13:50:53
