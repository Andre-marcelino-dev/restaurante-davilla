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

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_cardapio`
--

LOCK TABLES `categorias_cardapio` WRITE;
/*!40000 ALTER TABLE `categorias_cardapio` DISABLE KEYS */;
INSERT INTO `categorias_cardapio` VALUES (1,'Entradas','Pratos pequenos para iniciar a refeições','ATIVO'),(2,'Pratos Principais','Refeições completas e substanciais','ATIVO'),(3,'Bebidas não alcolicas','Sucos, refrigerantes, aguas e chãs','ATIVO'),(4,'Bebidas Alcolicas','Vinhos, cervejas e destilados','ATIVO'),(5,'Sobremesas','Doces e sobremesas para finalizar','ATIVO');
/*!40000 ALTER TABLE `categorias_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Carolina Silva','(11) 98765-4321','ana.silva@email.com','2026-06-03 11:13:37'),(2,'Bruno Mendes','(11) 99876-5432','bruno.mendes@email.com','2026-06-03 11:13:37'),(3,'Carla Pereira','(11) 91234-5678','carla.pereira@email.com','2026-06-03 11:13:37'),(4,'Daniel Rocha','(11) 92345-6789','daniel.rocha@email.com','2026-06-03 11:13:37'),(5,'Eduarda Santos','(11) 93456-7890','eduarda.santos@email.com','2026-06-03 11:13:37');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Felipe Almeida','Gerente','(11) 94567-8901','2022-03-15','ATIVO'),(2,'Gabriela Costa','Garsom','(11) 95678-9012','2023-06-20','ATIVO'),(3,'Henrique Souza','Garsom','(11) 96789-0123','2023-08-10','ATIVO'),(4,'Isabela Fernandes','Cozinheiro','(11) 97890-1234','2021-11-05','ATIVO'),(5,'João Victor','Auxiliar de Cozinha','(11) 98901-2345','2024-01-12','ATIVO');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

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
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `fk_item_categoria` (`id_categoria`),
  CONSTRAINT `fk_item_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_cardapio` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_cardapio`
--

LOCK TABLES `itens_cardapio` WRITE;
/*!40000 ALTER TABLE `itens_cardapio` DISABLE KEYS */;
INSERT INTO `itens_cardapio` VALUES (1,1,'Bruschetta','PÃ£o italiano grelhado com tomate, manjericÃ£o e azeite',18.90,1,'produto_6a79da6b913e5.png'),(2,1,'Camarão Empanado','Camarões frescos empanados e fritos, servidos com molho tartaro',32.50,1,'produto_6a79dab64b7fb.png'),(3,2,'File Mignon ao Molho Madeira','File de carne nobre com molho rico de vinho madeira e cogumelos',64.90,1,'produto_6a79db2ac09bb.png'),(4,2,'Risoto de Cogumelos','Arroz arabe cozido lentamente com cogumelos variados e queijo parmesão',48.50,1,'produto_6a79dbc24c324.png'),(5,3,'Suco de Laranja Natural','Suco fresco de laranjas selecionadas - 500ml',9.80,1,'produto_6a79dbb1e72d7.png'),(6,3,'Refrigerante','Diversos sabores - 350ml',6.50,1,'produto_6a79db7a1f6bc.png'),(7,4,'Vinho Tinto Seco','Garrafa 750ml - Safra 2022',89.00,1,'produto_6a79ded9ae6dd.png'),(8,4,'Cerveja Artesanal','Lata 355ml',14.20,1,'produto_6a79dadf3abf1.png'),(9,5,'Pudim de Leite','Pudim tradicional com calda caramelizada e coco queimado',16.90,1,'produto_6a79db696b7b7.png'),(10,5,'Torta de Limão','Massa crocante com recheio cremoso de limão e cobertura de merengue',19.50,1,'produto_6a79dec59ff89.png');
/*!40000 ALTER TABLE `itens_cardapio` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,1,1,18.90,''),(2,1,3,1,64.90,'Sem pimenta'),(3,1,6,2,6.50,''),(4,1,9,1,16.90,''),(5,2,2,1,32.50,''),(6,2,4,1,48.50,'Mais queijo parmesÃ£o'),(7,2,5,1,9.80,''),(8,3,1,1,18.90,''),(9,3,7,1,89.00,''),(10,4,3,2,64.90,''),(11,4,8,4,14.20,'Gelo Ã  parte');
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,1,4,'disponivel'),(2,2,6,'disponivel'),(3,3,2,'disponivel'),(4,4,8,'ocupada'),(5,5,4,'disponivel'),(6,6,10,'manutencao'),(7,7,2,'disponivel'),(8,8,6,'reservada');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_05_09_154936_add_foto_to_itens_cardapio_table',1),(5,'2026_05_10_154817_create_horarios_table',1),(6,'2026_05_25_112634_create_itens_cardapio_table',1),(7,'2026_08_10_134048_add_status_categoria_to_categorias_cardapio_table',2),(8,'2026_08_10_143407_add_status_to_funcionarios_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,4,NULL,2,'2026-06-03 11:13:37','pago',128.70),(2,1,1,3,'2026-06-03 11:13:37','em_preparo',89.40),(3,5,3,2,'2026-06-03 11:13:37','entregue',76.30),(4,8,NULL,3,'2026-06-03 11:13:37','em_preparo',152.60);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,2,2,'2026-05-05','19:00:00',5,'confirmada','AniversÃ¡rio de casal - preferem mesa perto da janela','2026-06-03 11:13:37'),(2,2,3,3,'2026-05-05','20:30:00',2,'confirmada','Cliente com alergia a camarÃ£o','2026-06-03 11:13:37'),(3,3,5,2,'2026-05-06','18:45:00',4,'confirmada',' ','2026-06-03 11:13:37'),(4,4,7,3,'2026-05-06','19:15:00',2,'cancelada','Cliente ligou e desmarcou','2026-06-03 11:13:37'),(5,5,1,2,'2026-05-07','20:00:00',4,'confirmada','Grupo de amigos - chegam separados','2026-06-03 11:13:37');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1lFET424OfGh3lIWhk1M35lSmX2Wb9799OQyLwfa',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiI2N3BzMHVrZFpuV29iaU1rUUpIV0lHV0JhSG9URDh1djQyZnF6bEdkIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1786372927),('3kVnnCWYcFm2zm063OH8zBAPbgIW4wFICUt6rPbS',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJ0VUw2RjZ3aTRGeXVFUnhjVXZIZXJJWmZKRnlZaWJuVUhxTWJWSTJBIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786369795),('7bsOrxPWXDR0vL0GbpmqHAcju8W5cVxfMv7GGopm',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJJRWJIV1MwSEVPTnVQbUhzRXYwSHlYVGNrVG5XM2VSQmpTMG4yUkZGIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786369936),('A0o1fDbAMqfsS4YkG9k0pHUDkdIhyBFAfTp8XcWr',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJuVkdoM2xCVjd6VnpnVHFnM01ZSXpuRDJFTDZWUlZiV2RHVmFHRTZZIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1786369987),('aSbXoikvQXyIbWdo04KgcSAczFUCxWf4r05XEF4x',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJpTGQ5bDJETTBHT0FrR3BMZXVub0xyWmZaUnllbWcyZExXbmVPaEZ4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6WyJzdWNjZXNzIl0sIm5ldyI6W119LCJzdWNjZXNzIjoiRnVuY2lvblx1MDBlMXJpbyBjYWRhc3RyYWRvIGNvbSBzdWNlc3NvISJ9',1786373014),('BU75a1YwfTO3iGPgbZ62xUvyIY286zX1vNhMFp3W',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiIyYTU5SGFOWU9WcFhJQWk5WjE4Z3duNk8zSktKNEtqaU50TU9qdXlnIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6WyJzdWNjZXNzIl0sIm5ldyI6W119LCJzdWNjZXNzIjoiRnVuY2lvblx1MDBlMXJpbyBhdGl2YWRvIGNvbSBzdWNlc3NvISJ9',1786373173),('CwDfvmeYBP73NiscIO3TEkzxaopBlu69U5sCTcMe',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJxaEhlRzBobzJpMGxrSUxobXlxWEF1QXgzTGlqd2VCc3BIeEFCUjFUIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1786372849),('froGEfnYfnYPXhtdAfYyHYTfc43Pfc1UYkKbrlXk',NULL,'172.21.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0','eyJfdG9rZW4iOiJPQU9haGR2Q3FJQXJmSHR3enpKT3J5VUIza3I3ODhJcEU2TU5IV01wIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1786373268),('HYUgzZfORD03WHFHZvdiPwGuxH1dAxo9DVDtJsPf',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJteGdyMEV2VEVXQjYxTGhUR0NxMld4VXVPcXpsWFZVUExtZW5mcnk2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1786372942),('infOqtNjQGeeezNZOChJiy5oyGHwI9DNZzeSXWbB',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJ0V1E0VUNEcGdTY0VWa2x6THlYSzJvS3g3cEg5WjlGamJtQkxBTnFtIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786369786),('jqm8uZmEfk2KNaonaIeBMfxpCYh3sQ0qEH7jKaDo',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJFbTE3bXRDcXAwRDNQb1M3d3J2M1VRRFU0NDJqSnVRYm1FNjc4Wk9MIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOlsic3VjY2VzcyJdLCJuZXciOltdfSwic3VjY2VzcyI6IlByb2R1dG8gYXR1YWxpemFkbyBjb20gc3VjZXNzbyEifQ==',1786370144),('lf2M2QMNU9VTK0nEP46MNkRo3pF0Y8zLymHfOMdi',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJLbUhOZkNnQm5ac21OQ2ZKemFLUXFmbzJ0aUphcWNrRFdMRURVdU1TIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786369829),('LJIJxReLeXRuxC0HgeobrOeVB69dXgq2Uv2mNDSE',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJ4WFVPcFQ0RUhiWjR4RFh5SHZwRWdEZHRPY1lHbHVtNzVaUGRwQVNDIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvY2F0ZWdvcmlhcyIsInJvdXRlIjoiYWRtaW4uY2F0ZWdvcmlhcyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1786370239),('myej4UmfLMO5VAZ3jJGI9IvLX63fSDkesvyPimNG',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJsMnJlckN5enZsNk5lUDhIUGdQekVZenlDb1N0RkR2S3VnY0lkcWsxIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvY2F0ZWdvcmlhcyIsInJvdXRlIjoiYWRtaW4uY2F0ZWdvcmlhcyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1786369791),('qu9K1Hv2frLVJVwcz0wDMpkptcRpcusCJVQNpRlU',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJKRDJZWG9kc0R1UnQ3MmZNOUU5U3ZONVRRRXJyc2dzRGxRa3hKWGlTIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786371740),('R5j4117TI5yCXr5dluocLMKISTXAQv4DOtw1EQln',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJVSWdzb1VSckxnWmZwY1lmM3RZM3phQWpyM2tzSUM5aFNSdmUyOG95IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvY2F0ZWdvcmlhcyIsInJvdXRlIjoiYWRtaW4uY2F0ZWdvcmlhcyJ9LCJfZmxhc2giOnsib2xkIjpbInN1Y2Nlc3MiXSwibmV3IjpbXX0sInN1Y2Nlc3MiOiJDYXRlZ29yaWEgYXR1YWxpemFkYSBjb20gc3VjZXNzbyEifQ==',1786370157),('rd6tDYtnnDP6sq5xZTOupO0DRC58oP30TvRfX99n',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJJOHRGT2NFVTc4a0lTZGRrNUltWjdSbDJ0ZFIzU3dZSDdyenhCNGFEIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6WyJzdWNjZXNzIl0sIm5ldyI6W119LCJzdWNjZXNzIjoiRnVuY2lvblx1MDBlMXJpbyBjYWRhc3RyYWRvIGNvbSBzdWNlc3NvISJ9',1786372962),('RF2pXPrmPW7ULn01YZsaugS59hksxadh1y2KN3QH',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJUWVF5QUlpVFNQRkk5Q1N0aXY3TUpzZUZsNmdOTzkxdW93aU1UU3pGIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOlsic3VjY2VzcyJdLCJuZXciOltdfSwic3VjY2VzcyI6IlByb2R1dG8gY2FkYXN0cmFkbyBjb20gc3VjZXNzbyEifQ==',1786369965),('V1arClczV6qwUbOvPQLI3MkO8GjtZq5LQ5Rwtg2L',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJvSmJvZ2F5NURsZmdkaVpJZU80WjRpMWN2OXdSSDVhb3JLWVMwbEgwIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvY2F0ZWdvcmlhcyIsInJvdXRlIjoiYWRtaW4uY2F0ZWdvcmlhcyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1786370202),('vgpQPf5aC0wHZkNyYGzgQjpQvhpQhhlD86zr36Vu',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiJmdjB6RjRIZ3hOMjcwbUpTT2VBOFduR2cxOWRGZWhjYldOVFZpZU1EIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvZnVuY2lvbmFyaW9zIiwicm91dGUiOiJhZG1pbi5mdW5jaW9uYXJpb3MifSwiX2ZsYXNoIjp7Im9sZCI6WyJzdWNjZXNzIl0sIm5ldyI6W119LCJzdWNjZXNzIjoiRnVuY2lvblx1MDBlMXJpbyBjYWRhc3RyYWRvIGNvbSBzdWNlc3NvISJ9',1786372955),('YZDDtNmSzxoy5oZ3h2GLEpu6tdTzQLJb4eQvyGFi',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiIzU1VYV3BzcnRLT2ZwNWptSVJUSkxXeWtIUGpvSFNJdlR0U3QzejJWIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786369791),('ZIopwvwYSi62AxWZiB5m6GufQxBLOzGEXd6UElEa',NULL,'172.21.0.1','curl/8.17.0','eyJfdG9rZW4iOiIzZFZ3VkZZMGZ3R3U1YUxRRHR0ZDlhb3hVUkxNbTcyTXBLV1M5eTVXIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDgxXC9hZG1pblwvcHJvZHV0b3MiLCJyb3V0ZSI6ImFkbWluLnByb2R1dG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1786371520);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2026-08-10 14:55:05
