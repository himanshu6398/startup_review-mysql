-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: startupreviewdb
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `description` text,
  `rating_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe3087q6lb6xq4cm11ypkhcqkm` (`rating_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`),
  CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKe3087q6lb6xq4cm11ypkhcqkm` FOREIGN KEY (`rating_id`) REFERENCES `ratings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2021-05-04 21:55:06','thnx',4,1),(2,'2021-05-04 21:57:32','cool',4,2),(3,'2021-05-17 10:25:27','agree',5,2),(4,'2021-05-17 10:25:27','agree',5,2),(5,'2021-05-17 10:28:44','thats right\n',5,4),(6,'2021-05-17 11:35:40','yep, thats one problem',9,2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` text,
  `rating` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `startup_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlvbtu5ki2qe9dcms8nw7wc7jj` (`startup_id`),
  KEY `FKb3354ee2xxvdrbyq9f42jdayd` (`user_id`),
  CONSTRAINT `FKb3354ee2xxvdrbyq9f42jdayd` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKlvbtu5ki2qe9dcms8nw7wc7jj` FOREIGN KEY (`startup_id`) REFERENCES `startups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (3,NULL,'Food delivered is hot at all the times that I\'ve ordered and almost all the good restaurants are aailable in the app.',9,'good platform for ordering hot food ',5,1,'2021-04-28 18:12:26'),(4,NULL,'love this app, got my food delivered within half an hour.',8,'waiting time',5,2,'2021-05-02 15:21:39'),(5,NULL,'always on time good service\n',8,'on time',24,2,'2021-05-17 10:25:04'),(6,NULL,'good service rides always available',8,'availability',3,4,'2021-05-17 10:28:17'),(7,NULL,'The teachers on this platform are amazing and provides a great learning curve',9,'Best teachers',9,4,'2021-05-17 10:29:37'),(8,NULL,'best app for ordering medicines online and easily available over doctor\'s prescription',9,'easy access',25,4,'2021-05-17 10:37:57'),(9,NULL,'sellers can\'t be trusted, they can sell you a  furbished item of low quality',6,'fishy sellers',20,4,'2021-05-17 11:34:48');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_MODERATOR'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startups`
--

DROP TABLE IF EXISTS `startups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `startups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text,
  `name` varchar(20) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `launch_date` datetime DEFAULT NULL,
  `tags` text,
  `logo_link` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKe2j7pts8cm0223w9pmqg6o0pj` (`name`),
  KEY `FKkbubfvl2ekx6ev22m0pha2e58` (`user_id`),
  CONSTRAINT `FKkbubfvl2ekx6ev22m0pha2e58` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startups`
--

LOCK TABLES `startups` WRITE;
/*!40000 ALTER TABLE `startups` DISABLE KEYS */;
INSERT INTO `startups` VALUES (3,'Rapido is India’s first and fastest-growing Bike taxi app with a whopping 25 Million+ app downloads. This company is running operations in more than 100 cities. It also provides an opportunity for people with a two-wheeler (along with the license) to become a rider on the platform and earn some extra money in their spare time.','rapido',1,'2021-05-05 10:24:35','2020-09-28 00:00:00','bike,taxi,ride,test','https://upload.wikimedia.org/wikipedia/en/e/e7/Rapido-logo.png'),(5,'Swiggy is an on-demand food delivery platform that brings food from neighborhood restaurants directly to customers\' doors. Swiggy is based in Bangalore and operated by Bundl Technologies Private Limited.','swiggy',1,'2021-05-16 09:34:51','2014-08-08 00:00:00','food,delivery','https://upload.wikimedia.org/wikipedia/en/1/12/Swiggy_logo.svg'),(6,'Zoom is a videotelephony proprietary software program developed by Zoom Video Communications. The free plan provides a video chatting service that allows up to 100 concurrent participants, with a 40-minute time restriction. Users have the option to upgrade by subscribing to a paid plan. The highest plan supports up to 1,000 concurrent participants for meetings lasting up to 30 hours. Zoom is a U.S. company, founded and headquartered in San Jose, California. Initially released September 10, 2012.','zoom',1,'2021-05-16 12:51:58','2012-09-08 00:00:00','video calling,audio,chat,webinar','https://www.pngarts.com/files/7/Zoom-Logo-PNG-Photo.png'),(7,'Ola Cabs is an Indian multinational ridesharing company offering services that include vehicle for hire and food delivery. The company is based in Bengaluru, Karnataka, India. As of October 2019, Ola was valued at about US$ 6.5 billion, A variety of venture capitalists including Softbank have large stakes in the company. In January 2018, Ola extended into its first overseas market, Australia, and in New Zealand in September 2018.In March 2019, Ola began its UK operations introducing auto rickshaws in UK. More than 10,000 drivers have applied both in online and offline mode ahead of its launch in London. In February 2020, Ola launched its taxi-hailing services with over 25,000 drivers registered.','ola cabs',1,'2021-05-16 11:58:29','2010-12-03 00:00:00','taxi,ride sharing,cab,auto,bike','https://upload.wikimedia.org/wikipedia/en/0/0f/Ola_Cabs_logo.svg'),(8,'Lyft, Inc. develops, markets, and operates a mobile app, offering vehicles for hire, motorized scooters, a bicycle-sharing system, and food delivery. The company is based in San Francisco, California and operates in 644 cities in the United States and 12 cities in Canada. Lyft was launched in the summer of 2012 by computer programmers Logan Green and John Zimmer as a service of Zimride, a long-distance intercity carpooling company they founded in 2007.\n\nWith a 30% market share, Lyft is the second-largest ridesharing company in the United States after Uber.','lyft',1,'2021-05-16 12:25:45','2012-06-09 00:00:00','bike,taxi,ride,sharing,vehicle for hire,rental cars','https://upload.wikimedia.org/wikipedia/commons/a/a0/Lyft_logo.svg'),(9,'Unacademy is an Indian educational technology company, based in Bangalore. Originally created as a YouTube channel in 2010 by Gaurav Munjal, the company was founded in 2015 by Munjal, Roman Saini, and Hemesh Singh.The company has a network of over 18,000 educators, and offers preparation material for several professional and educational entrance exams. Unacademy lessons are in the form of Live Classes both free and via subscription','unacademy',1,'2021-05-16 12:28:57','2015-06-16 00:00:00','education,online,learning,live,classes','https://upload.wikimedia.org/wikipedia/commons/f/f6/Unacademy_Logo.png'),(10,'Zerodha Broking Limited is an Indian financial services company, that offers retail and institutional broking, currencies and commodities trading, mutual funds, and bonds. Founded in 2010, the company is headquartered in Bangalore and has physical presence in several major Indian cities. As of December 2020, Zerodha was the largest retail stockbroker in India by active client base, and contributes upwards of 15% of daily retail volumes across Indian stock exchanges.','zerodha',1,'2021-05-16 12:33:24','2010-08-15 00:00:00','broker,trading,mutual funds,retail,stock','https://upload.wikimedia.org/wikipedia/en/9/9d/Zerodha_logo.svg'),(11,'Zomato is an Indian multinational restaurant aggregator and food delivery company founded by Pankaj Chaddah and Deepinder Goyal in 2008. Zomato provides information, menus and user-reviews of restaurants as well as food delivery options from partner restaurants in select cities. Zomato was founded as Foodiebay in 2008, and was renamed Zomato on 18 January 2010 as Zomato Media Pvt. Ltd. In 2011, Zomato expanded across India to Delhi NCR, Mumbai, Bangalore, Chennai, Pune and Kolkata. In 2012, the company expanded operations internationally in several countries, including the United Arab Emirates, Sri Lanka, Qatar, the United Kingdom, the Philippines, and South Africa.','zomato',1,'2021-05-16 12:39:00','2010-01-18 00:00:00','food,delivery,restaurants','https://logodownload.org/wp-content/uploads/2020/02/zomato-logo-0.png'),(12,'Paytm is an Indian e-commerce payment system and financial technology company, based in Noida, Uttar Pradesh, India. Paytm is currently available in 11 Indian languages and offers online use-cases like mobile recharges, utility bill payments, travel, movies, and events bookings as well as in-store payments at grocery stores, fruits and vegetable shops, restaurants, parking, tolls, pharmacies and educational institutions with the Paytm QR code. As of January 2018, Paytm is valued at $10 billion.','paytm',1,'2021-05-16 12:44:13','2010-08-16 00:00:00','e-commerce,technology,payment,recharge,online wallet','https://cdn.iconscout.com/icon/free/png-256/paytm-226448.png'),(13,'Flipkart is an Indian e-commerce company, headquartered in Bangalore, Karnataka, India, and incorporated in Singapore as a private limited company. The company initially focused on online book sales before expanding into other product categories such as consumer electronics, fashion, home essentials, groceries, and lifestyle products.\n\nThe service competes primarily with Amazon\'s Indian subsidiary and domestic rival Snapdeal. As of March 2017, Flipkart held a 39.5% market share of India\'s e-commerce industry. Flipkart has a dominant position in the apparel segment, bolstered by its acquisition of Myntra, and was described as being \"neck and neck\" with Amazon in the sale of electronics and mobile phones. Flipkart also owns PhonePe, a mobile payments service based on the Unified Payments Interface.','flipkart',1,'2021-05-16 12:48:39','2007-09-15 00:00:00','e-commerce,electronics,fashion,online shopping','https://upload.wikimedia.org/wikipedia/commons/8/85/Flipkart_india.png'),(14,'Snapdeal is an Indian e-commerce company, based in New Delhi, India. The company was founded in February 2010 by Kunal Bahl and Rohit Bansal, alumni of The Wharton School and Indian Institute of Technology Delhi respectively.\nSnapdeal’s focus is on the value ecommerce segment - a market that is three times larger than the size of the branded goods market. Sellers on Snapdeal offer good quality (local / regional / seller  branded)  merchandise, that offers customers value-for-money options, similar to what would sell in local markets and high streets in a city. Fashion, home and general merchandise account for a majority of the products sold by more than 500,000 independent sellers on Snapdeal platform.','snapdeal',1,'2021-05-16 12:56:14','2010-02-04 00:00:00','e-commerce,fashion,electronics,online shopping','https://findvectorlogo.com/wp-content/uploads/2019/03/snapdeal-vector-logo.png'),(15,'BookMyShow is India\'s biggest online movie and events ticketing brand. The website caters to ticket sales for movies, plays, concerts and sporting events via the online platform. Launched in 2007, it is headquartered in Mumbai, Maharashtra. It additionally has offices in New Delhi, Bangalore, Hyderabad, Chennai and Kolkata. \nIt is an online ticketing facility like Movietickets.com, Explara and Ticketmaster.com. BookMyShow took the primary services provided by these two websites and consolidated it into one website for movies, plays, events and sports tickets.','bookmyshow',1,'2021-05-16 13:04:16','2007-07-15 00:00:00','movie tickets,plays,sports,events,cinemas,booking','https://upload.wikimedia.org/wikipedia/commons/7/75/Bookmyshow-logoid.png'),(16,'Urban Ladder is an omnichannel furniture and decor retailer based out of Bangalore, India. Urban Ladder currently has 3 stores in Bangalore and distribution across 75+ cities in India through its website. Urban Ladder has both online and offline business model for distribution. The company delivers and installs all the products it offers. The brand has also put its products on marketplaces Amazon and Flipkart.\n\nThe furniture exchange offer is provided by Urban Ladder’s partners Zefo and Quikr. The old furniture will be picked up, and the new piece delivered to the customer at no additional cost.','urban ladder',1,'2021-05-16 13:11:33','2012-10-14 00:00:00','furniture,online,home decor,e-commerce','https://m.media-amazon.com/images/I/31omNRpYnNL.jpg'),(17,'Yatra.com is an Indian online travel agency and travel search engine. It is based in Gurugram, Haryana. It was founded by Dhruv Shringi, Manish Amin and Sabina Chopra in August 2006. Yatra.com’s one-stop-shop mission is to create “happy travelers,” so its users can reserve rooms at over 22,000 hotels in India and over 500,000 hotels around the world, and receive information, pricing, and availability to book domestic and international air travel, holiday packages, and bus and railway reservations.','yatra',1,'2021-05-16 13:23:06','2006-07-31 00:00:00','holidays,travel,flight,hotels,bus,train,tickets,online','https://upload.wikimedia.org/wikipedia/en/e/e4/Yatra_company_logo.png'),(18,'MakeMyTrip is an Indian online travel company founded in 2000. Headquartered in Gurugram, Haryana, the company provides online travel services including flight tickets, domestic and international holiday packages, hotel reservations, rail, and bus tickets. As of 31 March 2018, they have 14 company-owned travel stores in 14 cities, over 30 franchisee-owned travel stores in 28 cities, and counters in four major airports in India. MakeMyTrip has offices in New York, Singapore, Kuala Lumpur, Phuket, Bangkok, and Dubai.','makemytrip',1,'2021-05-16 13:22:19','2000-07-13 00:00:00','flight,villas,apartments,trains,bus,tickets,cab,hotel,booking,online,travel','https://upload.wikimedia.org/wikipedia/commons/a/a2/MakeMyTrip_Logo.png'),(19,'Quikr is an Indian online marketplace and classified advertising platform, Headquartered in Bangalore, India. Quikr has listings in over 1000 cities in India in categories such as mobile phones, household goods, cars, real estate, jobs, services and education. It was founded by Pranay Chulet and Jiby Thomas in 2008. Quikr is a free classifieds and online marketplace that helps users to sell, buy, rent, or discover anything across India. Community members can come to their site to find an apartment to live in, sell their old car, bike, music system, laptop or furniture, promote their small business, find a tuition class and much more.','quikr',1,'2021-05-16 13:27:53','2008-08-20 00:00:00','ads,online,e-commerce,rental,marketplace','https://entrackr.com/wp-content/uploads/2017/11/quikr-image.jpg'),(20,'OnLine eXchange also known as OLX Group is a Dutch-domiciled online marketplace headquartered in Amsterdam, and owned by Prosus, the international assets division of Naspers, founded in 2006 and operating in 45 countries.\n\nThe OLX marketplace is a platform for buying and selling services and goods such as electronics, fashion items, furniture, household goods, cars and bikes. In 2014, the platform reportedly had 11 billion page views, 200 million monthly active users, 25 million listings, and 8.5 million transactions per month.','olx',1,'2021-05-16 13:32:06','2006-06-11 00:00:00','online,marketplace,classifieds,forums,ads','https://upload.wikimedia.org/wikipedia/commons/4/42/OLX_New_Logo.png'),(21,'CarDekho.com is India\'s leading car search venture that helps users buy cars that are right for them. Its website and app carry rich automotive content such as expert reviews, detailed specs and prices, comparisons as well as videos and pictures of all car brands and models available in India. The company has tie-ups with many auto manufacturers, more than 4000 car dealers and numerous financial institutions to facilitate the purchase of vehicles. It has launched many innovative features to ensure that users get an immersive experience of the car model before visiting a dealer showroom.','cardekho',1,'2021-05-16 13:36:49','2008-10-16 00:00:00','website,online,cars,buy,sell,adds','https://static.businessworld.in/article/article_extra_large_image/1600687084_EIFjpa_cardekho.jpg'),(22,'Policybazaar is an Indian insurance aggregator and a global financial technology company based in Gurgaon, India. The company was founded in June 2008 by Yashish Dahiya,[1] Alok Bansal[2] and Avaneesh Nirjar.[3] It provides a digital platform - website and app - where users compare financial services from major insurance companies. The company is India\'s largest insurance aggregator,[4] and has expanded its operations to the United Arab Emirates.','policybazaar',1,'2021-05-16 13:42:02','2008-06-11 00:00:00','policy,insurance,financial,health insurance,motor insurance,travel insurance,life insurance','https://bsmedia.business-standard.com/_media/bs/img/article/2018-06/26/full/1530007716-0302.jpg'),(23,'Dailyhunt (formerly Newshunt), is an Indian content and news aggregator application based in Bangalore, India that provides local language content in 14 Indian languages from multiple content providers. The company\'s mission is \"the Indic platform empowering a billion Indians to discover, consume and socialise with content that informs, enriches and entertains\".\nIn November 2018, Virendra Gupta, Founder & CEO, Dailyhunt and Umang Bedi, President, Dailyhunt were honoured with the exchange4media Influencer of the Year Award.','dailyhunt',1,'2021-05-16 13:48:10','2010-09-27 00:00:00','news,articles,content','https://2monkeysandme.com/wp-content/uploads/2020/07/Dailyhuntlogo.png'),(24,'Shuttl is a mobile app based office commute bus aggregator based out of Gurgaon, India. The company was founded in 2015. It operates in more than 6 metro cities across the country. The company was founded by IITians Amit Singh and Deepanshu Malviya. Shuttl began intra-city bus fleet operations in 2015 within Delhi-NCR.','shuttl',2,'2021-05-17 10:21:15','2015-04-17 00:00:00','bus,office,transportation,work,mobile','https://cdn.theorg.com/e9f2c5a2-d24d-45bd-8c83-011bcaef642b_thumb.jpg'),(25,'1mg is an India-based online healthcare platform that claims to provide information about medicines and allow its users to order prescription-based medicines, supplements, healthcare devices, lab tests at home, and medical consultations. Currently headquartered in Gurgaon, Haryana, they have a mobile application available on Android as well as iOS platform along with web availability. 1mg was launched in April 2015 after Healthkart separated its generic drug search business, HealthkartPlus, and rebranded it as 1mg. The company has three business verticals — Pharmaceuticals, Labs, and Doctors.','1mg',4,'2021-05-17 10:36:41','2015-04-15 00:00:00','pharmaceutical,medical,e-pharma,pharmacy,health,doctor,medicine,health,lab,online','data:image/png;base64,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');
/*!40000 ALTER TABLE `startups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(1,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','admin','$2a$10$BRmAjIiWbphbBlGKhZzXAuX4wg.uRbc2qHUhT81Tt.ydDjMalmPJm','admin'),(2,'user@gmail.com','user','$2a$10$hK21NR6S3BidX8LfCm.mOeQ9CDbWjjkY6VodZ2bzE.E6A/o0JBmhe','user'),(3,'user@iiitb.org','user','$2a$10$DaX6JVMPD4JL3ln1/MuPUeykSAjkvMs0atlcO4cxMN38Zq0H2S1Za','user1'),(4,'abc@yahoo.com','abc','$2a$10$ob6ozNXZC1ugq07.BlNDuexTnEgnMw.bunWWQLPe8Blrdozfj24B.','abc');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 15:35:54
