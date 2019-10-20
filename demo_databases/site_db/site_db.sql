-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: site_db
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT 'код баннера',
  `html` text COMMENT 'HTML-код баннера',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='баннеры';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (12,'GOOGLE_ADSENSE','<div style=\"border: solid red 1px; background-color: lightyellow; padding: 20px\">баннер google adsense</div>'),(14,'AKAVITA_COUNTER','<div style=\"border: solid red 1px; background-color: lightyellow; padding: 20px\">баннер акавиты</div>');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_types`
--

DROP TABLE IF EXISTS `block_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT 'код',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT 'название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='типы блоков';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_types`
--

LOCK TABLES `block_types` WRITE;
/*!40000 ALTER TABLE `block_types` DISABLE KEYS */;
INSERT INTO `block_types` VALUES (1,'HEADER','заголовок'),(2,'FORMATTED_TEXT','форматированный текст'),(3,'IMAGE','изображение'),(4,'WEATHER_FORECAST','прогноз погоды'),(5,'BANNER','баннер'),(6,'SEARCH','строка поиска'),(7,'URL_NEW_HEADER','новость из УРЛа: заголовок'),(8,'URL_NEW_TEXT','новость из УРЛа: контент'),(9,'CONTACTS','контакты'),(10,'CONTAINER_LTR','контейнер: укладка слева направо'),(11,'CONTAINER_2COL','контейнер: укладка в две колонки'),(12,'URL_INDPAGE_TEXT','содержимое страницы из УРЛа: контент'),(13,'NEWS_LIST','список новостей');
/*!40000 ALTER TABLE `block_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `comment` varchar(200) NOT NULL DEFAULT '' COMMENT 'комментарий (для слушателей курса)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='контенты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (11,'макет \"страница одной новости\", контент места \"реклама\"'),(22,'макет \"страница одной новости\", контент места \"шапка\"'),(33,'макет \"страница одной новости\", контент места \"подвал\"'),(44,'макет \"страница одной новости\", контент места \"новость из УРЛа\"'),(55,'макет \"индивидуальная страница\", контент места \"содержимое страницы из УРЛа\"'),(333,'контент индивидуальной страницы \"главная\"'),(444,'контент индивидуальной страницы \"список новостей\"'),(555,'контент новости \"goodmorning\"'),(566,'контент новости \"goodevening\"'),(777,'контент блока с укладкой слева направо на странице новости \"goodevening\"'),(888,'контент левой колонки в двухколоночном блоке в контенте новости \"goodevening\"'),(999,'контент правой колонки в двухколоночном блоке в контенте новости \"goodevening\"');
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_blocks`
--

DROP TABLE IF EXISTS `contents_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents_blocks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `content` int(11) unsigned DEFAULT '0' COMMENT 'контент, которому принадлежит блок',
  `content_ord` int(11) NOT NULL DEFAULT '0' COMMENT 'порядок расположения блока внутри контента',
  `block_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'тип блока',
  `block_attributes` mediumtext COMMENT 'атрибуты блока (для каждого типа блока свои!)',
  PRIMARY KEY (`id`),
  KEY `contents_blocks_c_co_i` (`content`,`content_ord`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='блоки в контентах';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_blocks`
--

LOCK TABLES `contents_blocks` WRITE;
/*!40000 ALTER TABLE `contents_blocks` DISABLE KEYS */;
INSERT INTO `contents_blocks` VALUES (1,22,1,6,NULL),(2,11,1,5,'{\"banner\":12}'),(3,11,2,5,'{\"banner\":14}'),(4,33,1,9,NULL),(5,44,1,7,NULL),(6,44,2,8,NULL),(7,555,1,1,'{\"text\":\"Всем привет!\"}'),(9,555,2,2,'{\"text\":\"С <b>давних</b> времён...\"}'),(10,555,3,2,'{\"text\":\"Но с <i>недавних</i> пор...\"}'),(11,555,4,3,'{\"image\":1}'),(12,555,5,4,'{\"location\":\"Минск\",\"period\":\"неделя\"}'),(13,555,6,2,'{\"text\":\"Всего вам доброго!\"}'),(14,566,1,1,'{\"text\":\"Снова всем привет!\"}'),(15,566,2,2,'{\"text\":\"С <b>давних</b> времён...\"}'),(16,566,3,10,'{\"content\":777}'),(17,777,1,3,'{\"image\":1}'),(18,777,2,4,'{\"location\":\"Минск\",\"period\":\"неделя\"}'),(19,566,4,11,'{\"content1\":888,\"content2\":999}'),(20,888,2,3,'{\"image\":1}'),(21,888,1,2,'{\"text\":\"А вот картинка дня:\"}'),(22,999,1,4,'{\"location\":\"Минск\",\"period\":\"неделя\"}'),(23,999,2,2,'{\"text\":\"важней всего погода в доме!\"}'),(24,333,0,1,'{\"text\":\"Добро пожаловать на наш сайт!\"}'),(25,444,0,2,'{\"text\":\"текст для новостей\"}'),(26,55,1,12,NULL),(27,333,1,2,'{\"text\":\"Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт / Добро пожаловать на наш сайт!\"}'),(28,444,1,13,NULL);
/*!40000 ALTER TABLE `contents_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT 'код изображения',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT 'локальный путь к изображению',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='изображения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'SUNRISING','/images/sunrising.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indpages`
--

DROP TABLE IF EXISTS `indpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indpages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `url_code` varchar(50) NOT NULL DEFAULT '' COMMENT 'код для УРЛа',
  `content` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'контент страницы',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT 'текст для title',
  `metakeywords` text NOT NULL COMMENT 'ключевые слова для meta keywords',
  `metadescription` text NOT NULL COMMENT 'текст для meta description',
  PRIMARY KEY (`id`),
  KEY `news_uc_i` (`url_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='индивидуальные страницы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indpages`
--

LOCK TABLES `indpages` WRITE;
/*!40000 ALTER TABLE `indpages` DISABLE KEYS */;
INSERT INTO `indpages` VALUES (1,'main',333,'главная','погода, новости, настроение','наш самый лучший сайт с новостями и прогнозом погоды'),(2,'news',444,'новости','новости','новости о погоде');
/*!40000 ALTER TABLE `indpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  `url_code` varchar(50) NOT NULL DEFAULT '' COMMENT 'код для УРЛа',
  `header` varchar(200) NOT NULL DEFAULT '' COMMENT 'заголовок новости (и он же в title)',
  `content` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'текст новости (контент)',
  `metakeywords` text NOT NULL COMMENT 'ключевые слова для meta keywords',
  `metadescription` text NOT NULL COMMENT 'текст для meta description',
  PRIMARY KEY (`id`),
  KEY `news_uc_i` (`url_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='новости';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'goodmorning','С добрым утром всех!',555,'доброе утро, приветствие','поздравление с добрым утром'),(2,'goodevening','Доброго вечера всем!',566,'добрый вечер, приветствие','пожелание доброго вечера');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-20 10:44:52
