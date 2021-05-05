DROP DATABASE IF EXISTS HOME;
CREATE DATABASE HOME;
USE HOME;

DROP TABLE IF EXISTS old_sale;
CREATE TABLE old_sale (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255) UNIQUE,
	rooms CHAR(1),
	construction DATE,
	price VARCHAR(255),
	photos BIGINT UNSIGNED NOT null,
	mortgage BIGINT UNSIGNED NOT null,
	description VARCHAR(255),
	agents BIGINT UNSIGNED NOT null,
	
	FOREIGN key old_sale (id) REFERENCES mortgage(id),
	FOREIGN KEY (photos) REFERENCES photos(id),
	FOREIGN KEY (agents) REFERENCES agents(id)
);

DROP TABLE IF EXISTS new_sale;
CREATE TABLE new_sale (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255) UNIQUE,
	rooms CHAR(1),
	construction DATE,
	price VARCHAR(255),
	square VARCHAR(255),
	levels INT,
	description VARCHAR(255),
	agents BIGINT UNSIGNED NOT null,
	
	FOREIGN KEY new_sale(id) REFERENCES mortgage(id),
	FOREIGN KEY new_sale(id) REFERENCES photos(id),
	FOREIGN KEY (agents) REFERENCES agents(id)
);

DROP TABLE IF EXISTS house_sale;
CREATE TABLE house_sale (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255) UNIQUE,
	rooms CHAR(1),
	construction DATE,
	price VARCHAR(255),
	square VARCHAR(255),
	levels INT,
	description VARCHAR(255),
	agents BIGINT UNSIGNED NOT null,
	
	FOREIGN KEY house_sale(id) REFERENCES mortgage(id),
	FOREIGN KEY house_sale(id) REFERENCES photos(id),
	FOREIGN KEY (agents) REFERENCES agents(id)
);


DROP TABLE IF EXISTS  by_commercial_real_estate;
CREATE TABLE by_commercial_real_estate (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	warehouse VARCHAR(255),
	garage VARCHAR(255),
	office VARCHAR(255),
	agents BIGINT UNSIGNED NOT null,
	
	FOREIGN KEY by_commercial_real_estate(id) REFERENCES photos(id),
	FOREIGN KEY (agents) REFERENCES agents(id)
);



DROP TABLE IF EXISTS rent;
CREATE TABLE rent (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255) UNIQUE,
	rooms CHAR(1) ,
	construction DATE,
	price VARCHAR(255),
	square VARCHAR(255),
	levels INT,
	description VARCHAR(255),
	agents BIGINT UNSIGNED NOT null,
	
	FOREIGN KEY rent(id) REFERENCES photos(id),
	FOREIGN KEY (agents) REFERENCES agents(id)
);

DROP TABLE IF EXISTS rent_24;
CREATE TABLE rent_24 (
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	address VARCHAR(255) UNIQUE,
	rooms CHAR(1) ,
	construction DATE,
	price VARCHAR(255),
	square VARCHAR(255),
	levels INT,
	description VARCHAR(255),
	agents BIGINT UNSIGNED NOT null,
	
	FOREIGN KEY rent_24(id) REFERENCES photos(id),
	FOREIGN KEY (agents) REFERENCES agents(id)
);

DROP TABLE IF EXISTS photos;
CREATE TABLE photos (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	filename VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF exists mortgage;
CREATE TABLE mortgage (
	id SERIAL,
	term CHAR(2),
	cost VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50), 
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED unique,
	
	FOREIGN KEY users(id) REFERENCES new_sale(id),
	FOREIGN KEY users(id) REFERENCES rent(id),
	FOREIGN KEY users(id) REFERENCES rent_24(id),
	FOREIGN KEY users(id) REFERENCES agents(id),
	FOREIGN KEY users(id) REFERENCES by_commercial_real_estate(id)
);


DROP TABLE IF EXISTS agents;    
CREATE TABLE agents (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50), 
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE
);

INSERT INTO mortgage (id, term, cost)
VALUES (1,'8','1.257776'),(2,'7','9026.96'),(3,'2','1.257776'),(4,'5','145391.328952'),(5,'1','312771.879'),(6,'5',''),(7,'6','49422034.041326'),(8,'8','239161'),(9,'3',''),(10,'8','4773.75759'),(11,'4','2059334.5'),(12,'1',''),(13,'8','405506.76103901'),(14,'8','3352063.8154275'),(15,'2','40169975.3292'),(16,'6','0.17018252'),(17,'8','18149.67'),(18,'6','565631.4972'),(19,'5','6519560.7'),(20,'3','0.38');

INSERT INTO photos (id, filename, created_at, updated_at)
VALUES (1,'voluptate','2003-03-20 17:22:52','2019-01-19 10:40:09'),(2,'voluptas','2018-11-19 13:52:57','1972-06-30 03:38:31'),(3,'a','1977-05-18 07:39:14','2003-01-30 15:55:27'),(4,'iste','1978-08-05 07:10:07','1987-07-06 17:31:41'),(5,'reprehenderit','1998-12-14 14:57:34','2014-11-19 16:28:54'),(6,'quia','2000-09-27 17:05:43','2013-05-08 23:28:12'),(7,'maxime','1993-10-08 00:07:53','1974-10-01 04:22:43'),(8,'est','2002-07-25 07:10:32','2009-06-22 11:32:13'),(9,'voluptatem','1993-02-12 01:56:12','2018-05-19 23:44:54'),(10,'amet','2008-03-28 17:30:06','1994-02-22 08:19:40'),(11,'natus','2005-08-01 03:26:47','1996-10-18 21:50:01'),(12,'quis','1998-09-16 14:35:21','1993-12-26 03:29:12'),(13,'aliquid','2019-05-02 04:51:02','1986-08-17 00:59:54'),(14,'consectetur','1997-07-21 19:43:14','2009-12-20 02:55:10'),(15,'sint','2006-06-15 06:16:05','2020-04-09 08:03:13'),(16,'fuga','1971-03-30 21:16:04','2002-11-17 20:38:14'),(17,'porro','2000-03-04 10:48:03','2014-06-05 05:25:24'),(18,'eum','1986-05-22 06:34:01','1990-12-01 04:25:32'),(19,'iste','1988-11-23 19:47:23','1992-07-11 21:03:51'),(20,'earum','1980-09-22 10:03:22','1976-06-22 01:49:30');

INSERT INTO agents (id, firstname, lastname, email, password_hash, phone)
VALUES (1,'Dr. Meta Grant Jr.','Skiles','jacobi.fletcher@example.com','d24a0d8d06221a4483f0cc14722d4321c8a4d9ff',89430580938),(2,'Jordane Heathcote IV','Boyle','bednar.kelsie@example.com','212860f0ae7d6d894770d982ff5f2980b36cca6c',89606143980),(3,'Miss Beverly Toy','Rau','pattie08@example.com','5cb75abdbd17c63f5d0614fd26739e0c858c2a12',89859756401),(4,'Maci Murray','Collins','thiel.kole@example.net','b11ce8d7469995be16dcd9ff55b78c48a8cd9104',89380672715),(5,'Miss Aurelia Okuneva','Kohler','smacejkovic@example.com','fa2aca65323d53ca56941b5f5f5b5e53e3f14f93',89654663189),(6,'Fanny Grimes Jr.','Schroeder','hoppe.liam@example.com','443eac2dfeb38266b71a343bb909f71cc09bd55b',89219075310),(7,'Grant Kihn','Larkin','shields.jaylen@example.net','37abc6458d4eb856d7cdcd2a745f9e34ff3a3dd9',89004090622),(8,'Mr. Norwood Kutch','Buckridge','darwin.bradtke@example.com','101674270bdac9728ae1e8636d1fb3cf2f169274',89902332587),(9,'Prof. Vincenza Cassin','Bahringer','keven00@example.com','172bae6dbb24523bde410e977ee45df655a1a469',89250019922),(10,'Travon Welch','Rau','orin.herzog@example.org','78ef28b6c0e3e1cdf98a0fca83fe445cebb5b690',89544385664),(11,'Dr. Rodrick Hartmann','Jacobson','hfisher@example.com','54fea542f88df03e45947dd07ac9be5db87af47c',89583102901),(12,'Miss Destiny Casper','Prosacco','lyla81@example.com','5e56bd9adbb9ddc585e146e6f20b2c72fc9aebce',89038963308),(13,'Eulah Wisozk DDS','Krajcik','kimberly.larkin@example.net','473a2a7ce38e85c96381e2284276122370b63ab4',89722318127),(14,'Mariah Moore','Upton','alison.huel@example.org','189b373faf8af70f0eaf46777ddf6020aa5d29b7',89998751690),(15,'Jordane Schuppe','Larkin','jwalsh@example.org','406af4d5f5f23dfa71b20bc0075a7d35e048276b',89113877035),(16,'Darion Kshlerin DDS','Rau','co\'keefe@example.com','a06348f1bfa7668bc2214e32825e686f0ca13d3b',89150605875),(17,'Frieda Reichel III','Williamson','rosenbaum.donnie@example.com','36fa16207ac95a0067a6a455308c243297e2bb6c',89856149929),(18,'Joy Goyette','Bernhard','lysanne68@example.com','06834eaebbff0464bebebca6c73cc4a51e55ff65',89694128711),(19,'Alexandro Reichel','Stokes','eugene.jerde@example.org','322f7f6dd4514f29ea13e9f6b08645be99481ee8',89017098061),(20,'Axel Kub','Brakus','earlene59@example.net','79bd450c45247fd77caaa684529bdece5aa7289c',89383339749);

INSERT INTO new_sale (id, address, rooms, construction, price, square, levels, description, agents)
VALUES (1,'965 Maudie Tunnel Apt. 003\nBergstromborough, CO 21603','3','2000-02-16','','86',7,'Et recusandae beatae dolorum rerum sed. Dolorum non aperiam et consequatur et eum pariatur. Atque et error quaerat ipsum laudantium.',6),(2,'510 Mueller Oval\nHoppeville, AR 68731','5','1985-08-26','523.602436','55',9,'Distinctio voluptates ipsam veniam autem cupiditate veritatis. Et est vitae debitis culpa nulla sed qui. Praesentium magnam ratione aliquid tenetur voluptatem eum voluptatum. Officiis reprehenderit repudiandae tempora.',7),(3,'37766 Littel Lodge\nKayleybury, TX 21789-8926','2','1971-01-28','139.160761676','67',6,'Omnis velit ut placeat omnis ab at ratione. Vel sit est sed expedita.',2),(4,'1399 Webster Viaduct Apt. 877\nNew Lupestad, VA 51484','1','1993-12-23','5113004.858342','39',9,'Qui laboriosam eius est quis. Et provident culpa deserunt porro reiciendis et. Mollitia ut porro provident omnis vel ut.',5),(5,'827 Schiller Fort\nArmstrongview, TN 62711-0340','5','1993-01-18','180351','63',4,'Esse pariatur vero autem quos autem. Eaque libero velit officia est unde. Ab at iusto ea. Adipisci sed eius ut quaerat animi.',8),(6,'009 Bechtelar Stravenue\nMadalynside, WY 62542','2','1978-03-09','333646125.3','14',8,'Corporis omnis ut voluptates. Quod facilis deleniti tempore exercitationem voluptates aliquam.',8),(7,'0000 Hagenes Forge Apt. 805\nJuwanborough, AK 14078-7987','1','2013-06-10','3954.66','35',6,'Temporibus dolorum cumque tempora laborum quia. Non suscipit blanditiis cumque vel deserunt. Tenetur modi eaque aut odit quis ab.',1),(8,'4378 Magali Run\nNew Jammieville, IN 01244','1','1988-06-10','366.35961268','41',5,'Aliquam et enim et officiis. In eaque ut qui reprehenderit odio. Quidem error corporis facere praesentium nesciunt impedit aut.',2),(9,'9968 Meta Plain Apt. 981\nDelilahport, TX 92251-2536','2','1999-01-05','245350329.47156','99',7,'Iure et incidunt unde nisi. Voluptatem ad ut eos amet sit dolore. Quis voluptas est consequatur aliquam aut cumque. Quia voluptatem natus animi quasi odio.',4),(10,'4712 Larry Plains\nEast Roycestad, ME 06431-1424','4','1991-05-01','15607730.1','66',8,'Maxime et pariatur earum id cumque. Quis voluptates eveniet est vitae velit. In dolores consequatur nam voluptatibus consequatur. Possimus autem eaque iste facere quod atque.',5),(11,'22868 Sanford Islands Suite 198\nWest Audie, GA 23824','4','1995-08-07','','74',2,'Provident voluptatem sit necessitatibus dolorem. Non sapiente necessitatibus omnis tenetur dolorem architecto.',3),(12,'564 Trevion Plains\nEast Bennettberg, AZ 25877','1','2007-08-08','1.8','55',9,'Qui nostrum sequi ea quibusdam quia. Alias quia voluptas ut maiores non quia aut. Eum repudiandae in adipisci. Quo eligendi autem voluptatibus et placeat dolorem possimus nisi.',1),(13,'1021 Devante Locks Apt. 692\nDickinsonberg, AL 90259','4','2000-07-05','2753.99334','82',5,'Suscipit quasi dolor aliquam vero repellendus numquam dolores. Quidem vitae laudantium id sapiente est animi consequuntur. Sunt fugit non omnis qui quaerat doloremque.',3),(14,'4393 Swift Wall Suite 296\nWest Ara, MT 53141-0443','3','1983-04-25','8666.113662501','27',11,'Molestias magni quia sit aspernatur qui quia. Odit dolorum vel doloribus et aut. Rem dignissimos quo provident est est.',8),(15,'345 Merlin Stream\nLake Kareemhaven, NH 02407','5','2002-04-11','','31',4,'Fugit numquam velit quia est quis. Exercitationem sunt ut consequatur nam quo. Recusandae alias facilis veniam qui dolor quia magnam.',1),(16,'17212 Ziemann Estate\nHodkiewiczfort, WV 12385','4','1984-08-01','36.892','52',9,'Ratione qui nulla quia dolorem eos. Perferendis nesciunt quos nulla voluptas sequi. Voluptas cum qui et sint impedit.',4),(17,'44037 Champlin Curve Suite 233\nSouth Remingtonhaven, IA 71186-4931','4','2015-12-15','','90',7,'Consequatur cumque fugit dolorum natus quis quod. Voluptatem officiis non omnis non est eius. Sed praesentium quasi culpa quasi.',3),(18,'236 Lindsey Springs Suite 900\nNienowburgh, SC 04154-7748','2','1979-02-12','14124.3288','83',8,'Sint voluptas et sint modi in et aut voluptate. Debitis reiciendis veniam qui saepe. Dolorem earum quaerat voluptatem non iste qui dicta. Unde officia minima aut id numquam qui.',8),(19,'376 Lubowitz Walk\nCristobalmouth, LA 90836','1','1973-09-07','268968461.92167','10',8,'Quia in laudantium illum ut odio optio. Est ea asperiores ea. Aliquam ratione modi vero dolor corrupti. Quasi ea quidem cumque et nam quia. Reiciendis pariatur repudiandae aut doloremque.',1),(20,'41075 Padberg Walk Apt. 344\nWuckertberg, ND 96105','4','2011-11-09','','40',10,'Quia aut quasi veniam qui quas. Et culpa sit rerum esse provident. Necessitatibus placeat aut rerum deserunt perspiciatis sapiente facere. Dolorem minus nostrum libero sed. Reiciendis possimus quis eos similique.',9);

INSERT INTO house_sale (id, address, rooms, construction, price, square, levels, description, agents)
VALUES (1,'43523 Cremin Groves\nFraneckiview, AZ 83798','2','1976-02-24','1051.4','6',1,'Qui officia iste voluptatem voluptas repudiandae. Dolorem vitae consequuntur accusamus vero. Impedit tempora illo sit sint qui nostrum.',9),(2,'197 Rolfson Views\nJakubowskiburgh, NJ 24826','4','2002-04-11','','166',3,'Non voluptate mollitia sed veritatis saepe est omnis. Reiciendis dolorum ea quidem recusandae vel natus soluta. Sunt nemo quae veniam sunt qui et facilis.',3),(3,'8384 Anika Key\nHilllstad, WV 84150-7067','2','1971-04-26','','235',2,'Aut aut iure distinctio repellendus. Suscipit et ut iste excepturi voluptates est. Recusandae temporibus rerum consequatur sed soluta. Velit impedit necessitatibus sint voluptatum sint aut corporis.',6),(4,'893 Lambert Dam Apt. 696\nSchinnermouth, WY 29796-0089','3','2005-06-08','5932750.849','252',1,'Laborum qui sequi ab. Ut est dolor ea omnis soluta. Dolores quidem et inventore excepturi assumenda dolorum. Facere dolorem velit molestias quis aliquid officiis unde.',4),(5,'81394 Flo Lodge\nAnkundingfurt, WA 46536-3568','3','1986-10-15','3.869','90',1,'Nostrum fugiat eveniet autem sit et ut voluptas. Similique quas debitis perspiciatis consequatur. Magni architecto porro repudiandae ducimus deserunt accusantium. Quos aperiam alias labore itaque.',8),(6,'32257 Lue Cliff\nGranttown, HI 17980','2','1990-11-11','116553794.17435','64',1,'Voluptas ut culpa placeat deleniti voluptatem. Vel qui velit aut necessitatibus. A aut aperiam quia. Molestiae et nostrum sint non dolore.',5),(7,'0830 Kuphal Fort\nNorth Kobe, NY 81132-9154','4','2003-04-25','19991009.581209','119',2,'Minus mollitia eligendi qui. Voluptatem alias aut facere eaque sint enim nostrum sint. Molestiae doloremque deleniti aut eum soluta.',4),(8,'7389 Jayson Ford Apt. 316\nWest Saraifurt, AL 18532','1','2005-02-17','176022544','179',3,'Molestiae dolores molestiae rerum ratione quidem nihil. Id et dolores asperiores quod sint. Tempore perferendis earum veritatis ut mollitia dolores placeat.',7),(9,'388 Swift Ports\nGrantmouth, ME 06506','4','1976-07-28','149','138',3,'Sit qui et numquam sit quas repellat omnis. Illo aut sunt corrupti accusantium et blanditiis. Inventore inventore aut praesentium et explicabo.',3),(10,'71991 Molly Dale Suite 100\nJohnsstad, NJ 01589','2','2021-01-13','751.6429914','106',2,'Cum necessitatibus libero exercitationem. Tenetur inventore ipsam qui et natus quas vitae. Debitis ipsa nihil harum saepe quia rerum aut.',4),(11,'207 Quinn Ridges\nMcKenzietown, SC 41722','2','2019-08-25','575336.4','69',2,'Aspernatur soluta qui et maxime vero quasi. Mollitia architecto a quia hic ipsa omnis nihil. Ut reprehenderit vitae aut voluptas odit eum totam. Repudiandae unde quis occaecati fugit quia repudiandae aut.',8),(12,'35378 Kristin Walks Suite 082\nStantonhaven, IN 98803','3','1999-09-13','2044587.7578','159',3,'Consequatur voluptatem minima aut. Debitis quis id aut nulla qui ipsa debitis. Sed omnis a dolor ut suscipit sint iure. In voluptatem accusantium sed quod dolore ut enim.',7),(13,'87434 Treutel Divide Suite 857\nNorth Dimitriburgh, FL 02792-9235','3','1979-03-30','2274.42292459','163',3,'Maiores unde illum id sit omnis doloremque. Eum et qui possimus porro. Aspernatur autem culpa ducimus in. Odio quas eum incidunt dolorem saepe dolores commodi.',5),(14,'9027 Dino Avenue\nDaughertyfurt, OK 72614-8756','5','2002-03-09','1','234',3,'Dolorem occaecati a sint et et praesentium vel ut. Et et accusantium corporis delectus. Sed est veniam pariatur. Mollitia voluptas enim expedita aut sed.',4),(15,'6345 Metz Roads\nWolfmouth, TN 14392-1687','4','1997-11-05','3','162',1,'Maiores repellat perspiciatis placeat qui voluptate illo eos. Qui aut fugiat officia fuga vel. Voluptas et delectus fugiat corrupti.',6),(16,'986 Lesch Center Apt. 019\nNew Brandi, MA 93690-7748','5','1989-10-21','2190049.317667','61',2,'Rerum est veniam voluptatem mollitia incidunt consequatur. Consequatur vel dolor ut. Voluptatem corporis sed rem asperiores. Ut molestias et iure.',6),(17,'95678 Prohaska Ports Apt. 812\nLubowitzmouth, MA 62826-9993','4','1996-08-01','5821967.93061','214',2,'Fugit officiis necessitatibus delectus quae id est rerum nobis. Et impedit quia incidunt voluptas debitis accusantium mollitia. Sed deleniti esse velit fuga eum ipsum.',4),(18,'11010 Creola Spur\nWest Lenna, AL 51454','4','1985-09-17','50201','88',1,'Aut ducimus dolores qui quia minus voluptatem. Rerum beatae ut quia et consequatur quam hic. Voluptatem a animi eveniet magni est et voluptatem.',6),(19,'360 Kuhn Mission\nNorth Joy, AK 44891','1','1975-08-25','','97',2,'Ut aut sint harum voluptatem exercitationem et. At id dolore dolor cum veritatis quae. Voluptas vel dolore quaerat facere. Fuga voluptatum quisquam excepturi ipsam aut fugit.',9),(20,'0140 Waters Road Suite 564\nEast Romaine, WY 65926','4','1980-03-13','159.97247351','198',3,'Rerum qui ipsum doloribus quod assumenda aut impedit iusto. Assumenda eligendi magni sint sunt. Incidunt ab omnis ipsa.',5);

INSERT INTO by_commercial_real_estate (id, warehouse, garage, office, agents)
VALUES (1,'631','606377','10754',1),(2,'1160','3235','5070',9),(3,'621664439','63002','422423',5),(4,'3500266','','973099',6),(5,'47803','87499','301913',2),(6,'6697534','801','56',9),(7,'739','80','10751',7),(8,'818671071','86993','393952',8),(9,'133','7','451',3),(10,'3','5022594','55050',1),(11,'6996764','4192','',3),(12,'69198198','962648','52904',3),(13,'274038','5409067','424',5),(14,'47289862','80','38',9),(15,'78','26','1',6),(16,'','686412761','9753',9),(17,'8865','2','3417',7),(18,'658246912','2867','9845292',5),(19,'','6115','4',5),(20,'62','877192','8811',8);

INSERT INTO rent (id, address, rooms, construction, price, square, levels, description, agents)
VALUES (1,'735 Peter Station\nO\'Connerborough, KS 01292','1','1993-02-18','1.877754','33',11,'Voluptatum aut pariatur aut veritatis officia velit. Nihil ullam doloribus est rem iusto et voluptas. Repellat et sunt qui in.',3),(2,'6250 Toby Mission Apt. 972\nLake Mya, PA 18772','4','1983-04-14','3795.7','67',9,'Consequatur nihil vero sit. Totam sed voluptas quidem consequuntur qui odio. Odio consequatur dolorem voluptas rerum corrupti voluptatem vel dolores. Distinctio sapiente consequatur impedit eum impedit nisi aspernatur sed.',3),(3,'29618 Baumbach Grove\nWest D\'angelo, HI 23603-1714','2','2007-10-18','27.561','52',8,'Harum tempore cupiditate dolorum ex voluptate. Provident qui aliquid esse vel. Consequuntur rerum impedit est. Doloribus ullam nesciunt unde itaque neque corporis aut.',5),(4,'4112 Daron Drives Apt. 478\nStephanymouth, CO 98639','2','1987-03-14','125471.2068669','62',9,'Id aliquam repellendus amet. Nemo quaerat ut voluptas modi. Voluptas exercitationem autem amet voluptatem a distinctio consequatur. Nihil est aliquam esse non voluptatem qui impedit. Voluptatem harum sed omnis dolorum ratione quia et.',4),(5,'25898 Retta Isle Apt. 419\nNorth Luciofurt, OH 78201-2239','4','2003-09-18','296995.386279','47',1,'Enim dolorum fugit deleniti reprehenderit eos et. Sit et quisquam fugit consectetur. Natus iste est inventore in.',3),(6,'375 Gibson Ports Suite 259\nWest Dulce, WY 76261','2','1993-07-05','0.9478','22',10,'Est excepturi et occaecati distinctio. Porro quia quam eius et distinctio in voluptas. Aut suscipit tempora omnis facilis perferendis.',1),(7,'21764 Shanahan Glen\nMossieville, OR 77757-6445','4','1982-12-13','1.24556','35',7,'Qui architecto quia at fugiat exercitationem. Corporis laudantium ut aperiam quasi exercitationem blanditiis. Eius voluptas corporis laudantium quo qui dignissimos quia.',1),(8,'3475 Jacobson Street\nEddbury, NV 30856','3','1982-04-10','23.8792757','35',1,'Beatae sit eius sed illo sint necessitatibus accusantium vitae. Sit accusamus rem placeat doloribus autem sapiente porro blanditiis. Voluptatibus natus pariatur adipisci dolore ut consequatur sit.',2),(9,'6233 Jaden Pass\nHuelsbury, CT 56662','5','1975-05-23','5477.27','84',2,'Ut ipsam hic velit quasi tenetur accusamus. Praesentium quidem officiis a.',7),(10,'35516 Carley Divide\nNew Jaydatown, NM 33926-8262','4','2015-05-16','1628303.682319','39',6,'Enim aliquam aliquam harum sunt voluptatem. Incidunt eum consectetur officia neque ipsam sunt. Praesentium aut distinctio ullam est vel.',4),(11,'6343 Thompson Terrace\nEast Shaylee, TN 40030-8222','3','2010-01-22','6.531','26',4,'In culpa eos beatae totam et sequi. Doloremque et consequatur molestias odio sed consequatur. Id possimus aut incidunt rerum quaerat non voluptate.',4),(12,'788 Kshlerin Pine Suite 379\nWest Louie, SD 19778','3','1997-02-23','26712.04081866','28',4,'Molestiae explicabo tempora asperiores eos. Cum dolorem magni delectus vel dolore minima soluta. Ut exercitationem eius doloribus quis. Dolorem officia laboriosam recusandae cumque iste. Error sapiente rerum voluptatem maiores magnam.',6),(13,'04587 Keith Ridges\nNorth Willowborough, NH 51600','4','1998-11-03','16731876.239046','20',9,'Autem commodi dolor ut voluptas et. Porro est consequatur sint velit aut maxime tenetur. Voluptatem adipisci assumenda inventore excepturi velit sint eos. Eius architecto eius cum quaerat.',3),(14,'59258 Jacky Avenue Apt. 230\nLake Collinborough, NV 11206','2','1977-12-19','1664','56',11,'Vel magnam impedit maxime autem est officia quas. Molestiae aut numquam ex quo incidunt reiciendis ex. Voluptatem maxime illum velit quibusdam. Quo vel adipisci doloremque.',6),(15,'13636 Morar Circles\nSierraville, UT 13330','1','2007-10-15','45278.85464017','88',9,'Odio nobis porro id ipsam accusamus veritatis suscipit aut. Et culpa vel aperiam. Qui nihil expedita ipsum omnis sed atque autem. Quo quisquam ducimus asperiores eum.',5),(16,'689 Shad Forks\nNew Jayne, IN 00696','2','1981-04-07','64128.8211353','57',8,'Sit soluta ipsam minus. Inventore reprehenderit ea eos vero natus unde. Et voluptatum aut sit qui totam. Aut culpa dolor exercitationem ut sapiente libero.',6),(17,'1920 Deonte Causeway\nWest Conor, ND 82245-2432','1','2001-09-09','5173238.1','65',11,'Possimus dolorum omnis perferendis illum provident qui dolore quae. Reiciendis aliquam modi nesciunt et expedita. Necessitatibus dolore temporibus perferendis aut officiis.',1),(18,'816 Fadel Crescent\nNorth Alfredaport, KS 91471-0924','4','2020-05-16','502858','34',7,'Quas perferendis et dolorem non laudantium dolores nulla nemo. Qui ad nam tempore natus temporibus. Consectetur nihil fugit aperiam fuga. Laboriosam assumenda porro est.',1),(19,'7799 Morissette Village\nCristalfort, NH 07018-1230','2','1982-08-14','63143.29645984','38',11,'Voluptatem excepturi architecto fugiat debitis blanditiis maiores deserunt. Quo omnis cumque similique quia suscipit ut. Accusamus omnis quis nisi quia et. Id nam odio est distinctio sequi. Velit ex et iure voluptates reiciendis.',3),(20,'1950 Lebsack Junctions Apt. 669\nLuluside, NM 05928','4','1995-09-24','1286.3464388','49',6,'Architecto sit velit architecto rerum praesentium. Et ipsum quia voluptatibus ab sed veritatis possimus. Deleniti repellendus neque aut quasi non cupiditate molestiae.',4);

INSERT into rent_24 (id, address, rooms, construction, price, square, levels, description, agents)
VALUES (1,'49431 Raven Mount\nEast Dorothea, NV 92960','1','1991-09-17','206765807.64391','88',11,'Est in molestias reprehenderit omnis. Sequi ipsa impedit dicta quisquam quia quia voluptas. Velit quo autem asperiores rerum quis. Nisi eligendi perspiciatis dolorem velit dolore natus.',9),(2,'1655 Milford Islands\nNew Judgeside, VA 60798','2','2007-05-28','1.2301871','23',3,'Numquam harum minus veniam. Autem voluptatem sequi aut voluptatem molestiae cupiditate sit. Explicabo placeat soluta quis cupiditate quaerat.',5),(3,'6798 Hermiston Plaza Apt. 420\nNew Spencer, NC 66996-8577','5','1979-11-17','299477.420836','51',9,'Blanditiis nemo a in eos. Est nihil quo repudiandae vel doloremque. Impedit sint minus iure iusto sed voluptas ea. Aut qui numquam quia fugit. Id autem error quis debitis voluptas.',8),(4,'7355 Orval Expressway\nNew Berthaberg, UT 87976-2007','3','1986-08-29','508623660.69','94',1,'Autem quasi accusantium voluptas qui necessitatibus neque necessitatibus aspernatur. Culpa et occaecati veniam et. Beatae laborum deserunt excepturi magni voluptatum ut doloribus. Totam quibusdam quasi deleniti velit blanditiis.',9),(5,'17932 Cassin Camp Suite 737\nAuerland, IA 42480-6516','3','1999-05-16','1120663.432','90',4,'Dolor velit inventore pariatur. Molestiae doloribus ut vel architecto. Consectetur beatae alias ipsum quisquam.',1),(6,'6280 Wisoky Camp Suite 540\nMullerfurt, IA 84547-9516','4','2014-08-25','769.3','61',2,'Nostrum at et et et nisi neque nihil. Quas dolore et omnis harum. Error a non voluptatem excepturi accusamus. Iusto pariatur esse minima corrupti voluptatum id eum. Sunt vero nobis accusantium quos cum.',3),(7,'4336 Nienow Freeway\nWest Sammyfort, WA 04180','2','2002-05-30','2227960.4','88',2,'Et excepturi quis aut enim ut minima. Sed quam animi voluptas expedita occaecati. Ad iure doloremque quis ipsa consectetur. Quas autem voluptatem dicta eius dicta fuga.',4),(8,'32105 Ethyl Glen\nLake Odell, PA 97501','2','1996-02-03','8118','91',1,'Eum ut voluptates ut a amet. Molestiae reprehenderit magni molestiae doloribus soluta aliquid minima ut. Est et in corporis sint vel sequi.',8),(9,'942 Oceane Drives\nLake Brisaview, KS 02483','4','1972-10-11','175.9','77',7,'Provident et recusandae voluptas eaque. Beatae optio dolorum et impedit quia dolorem id. Itaque expedita minus repellendus quae.',6),(10,'8343 Odessa Fort\nWest Terrencetown, MT 53741-9956','5','1974-08-26','17.384','33',1,'Porro reprehenderit voluptatem quia sed quasi corporis voluptatem. Explicabo dolor in voluptatem a. Iure possimus autem amet unde distinctio.',1),(11,'0016 Meghan Shoals\nRauland, PA 00437-2349','4','1992-06-13','2','92',8,'Fugiat quo soluta exercitationem delectus qui in maiores atque. Dignissimos quia molestias dolor. A molestias facere velit expedita aut est voluptas voluptatibus. Omnis fuga corporis tempore.',1),(12,'05195 Arnold Haven\nPaolomouth, HI 40956-1327','4','2002-07-13','47.24777','97',9,'Harum minus eos quia sint et et consequatur. Non ipsam tempora harum amet et qui sit. Reprehenderit autem hic voluptatibus dolorem architecto.',8),(13,'7005 Walker Square\nNorth Jackelineport, PA 89704','4','2014-01-30','127.42678772','54',11,'Nobis odit iure nulla. Magni eum aspernatur esse voluptas veniam. Et temporibus aut in pariatur fuga velit quam.',9),(14,'4807 Walsh Radial\nHansenberg, WI 38989-4958','4','1992-05-12','227661615.66381','58',1,'Velit eius possimus ut et qui. Alias dolores quia rerum. Quo ab commodi sint id. Voluptatem dicta perferendis iure.',4),(15,'77393 Gusikowski Manors Apt. 893\nCruickshankberg, NY 59194-1955','2','2013-05-31','','82',1,'Voluptatem quibusdam similique et voluptatem nobis aut tempora. Voluptas doloribus est quia ut cum tenetur.',7),(16,'28072 Thiel Ports Suite 664\nDaveburgh, OH 38479-7641','4','1985-05-13','879.60002389','30',6,'Ut eos itaque debitis architecto molestias debitis fugiat similique. Quaerat saepe non est eveniet nihil modi. Temporibus alias velit inventore rem. Consequatur tempore qui consequatur quis quae autem praesentium.',5),(17,'5711 Victoria Skyway Apt. 021\nNew Jonview, NE 48411-5077','5','1973-08-30','5083201.57','33',4,'Ad et alias architecto autem ratione vel. Ex non excepturi sit. Ipsam cupiditate consequatur et.',4),(18,'467 Tyra Lake Suite 219\nPort Annaliseside, OK 81135','4','1987-03-15','363383003.29','47',10,'Hic molestiae non rerum qui dolores. Voluptatem alias id eos eius. Velit tempore rerum optio natus accusamus qui ducimus illum. Architecto distinctio modi aut minus et.',1),(19,'5488 Altenwerth Summit Suite 718\nLake Terrellstad, NE 84922-6067','3','2013-07-25','2.448','81',10,'Eveniet et et quia est. Eaque nulla id explicabo pariatur eos aut et. Sapiente iusto sed eum itaque ab. Non libero quos libero sunt.',2),(20,'00554 Hortense Union Suite 536\nNorth Herminio, HI 51250','3','1991-06-23','0.78975','24',6,'Sequi amet et iusto accusamus voluptates quo. Et ut voluptate illum nostrum iusto odio.',6);

INSERT INTO users (id, firstname,lastname, email, password_hash, phone)
VALUES (1,'Arjun','Wiegand','price.shanelle@example.net','c11afc4ecca11bbd5bf8ab2528388a9ab8d4a3cd',83458507),(2,'Matt','Steuber','kenya39@example.com','effd8a7a385e477b696bf63cabbca52edf3f1f8b',86368470),(3,'Rubye','Luettgen','bulah.lemke@example.org','a2e4c6ece771a470e80ea485d23390d0a5dcbe62',87452925),(4,'Tara','Huels','bartell.hailey@example.org','3815aceb999b14b481666b29618bd13cb420900e',89394544),(5,'Makenna','Schinner','gutkowski.quinn@example.net','e903be8a5c98758f24be0688f739690c58f8ba22',81984633),(6,'Rosalee','Gerlach','adalberto41@example.net','75b20bc951af6b2cc408f5de455e3a80452a20cc',88852607),(7,'Vince','Schmeler','bernadette25@example.net','1d6da8f4af31e9775a06aee7a31686efd8216694',88121928),(8,'Kristoffer','Reynolds','ymcglynn@example.com','3a92c8b4cd5879279890f64ee6da3fe6b124ddfa',80991863),(9,'Heather','Jenkins','ollie67@example.org','2596fdcaf2942a58fadda777e15b2359aa5f9eca',86222074),(10,'Ben','Powlowski','roslyn87@example.org','21052d83dc791d1dbd11e0dc442faaf86ba227ba',85348182),(11,'Antonette','Harber','lora08@example.org','b225f85c057fe3a6c8328cd0dabf4ed1b3756dbe',87201495),(12,'Destin','Miller','irippin@example.com','0824180bf2157ab1e8ab3a5c0f111f7c1057af78',87476164),(13,'Melyssa','Corwin','providenci.witting@example.net','ea00e8ff3453f09e0b25b4da030fcb8a9fe435f0',82320272),(14,'Kelvin','Nicolas','xjerde@example.org','b5346a8525684278d4bf999b76dfd7ca6e465607',84524773),(15,'Vincenzo','Cole','mckenzie.gino@example.net','4349befdf2eec4cdd9e7d5438f53ac13bfaab266',84736835),(16,'Dillon','Shields','parker.wehner@example.com','d8b68da43b731533ae9d87c63451543c32b00802',82596100),(17,'Carlee','Lockman','schumm.prudence@example.net','650b6bd8f18911ec6ecc292afbef9dfee2aefed8',84911182),(18,'Reyna','Kris','hkertzmann@example.org','41868d6f09d1b774d1cd25725d247ae13c138990',82474823),(19,'Eduardo','Gerlach','skiles.lauryn@example.com','4fc463b2412fff2e2971a946fd4c32c73e86e249',88124591),(20,'Angie','Mertz','west.domenic@example.org','8366420fdb4c3882e227c253e0ee3bbd3c904152',84640077);


CREATE or replace VIEW view
AS
SELECT 
	address, cost,price 
  FROM new_sale
    JOIN mortgage ON new_sale.rooms = mortgage.term
  WHERE price > 500
 
UNION
 
SELECT levels, filename, address 
FROM new_sale
JOIN photos ON new_sale.levels = photos .filename  
WHERE levels > 5

select *
from view
where price > 100
 	

 
DROP PROCEDURE IF EXISTS new_sale_offers
DELIMITER //
CREATE PROCEDURE new_sale_offers(for_user_id BIGINT UNSIGNED)
BEGIN
	SELECT firstname 
	FROM users
	WHERE id = 5
UNION
	SELECT address 
	FROM new_sale
	WHERE square > 55;
END//
 
DELIMITER ;

CALL new_sale_offers(1);


