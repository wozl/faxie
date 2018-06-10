/*
SQLyog Professional v12.3.1 (32 bit)
MySQL - 5.6.37 : Database - faxie
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`faxie` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `faxie`;

/*Table structure for table `Article` */

DROP TABLE IF EXISTS `Article`;

CREATE TABLE `Article` (
  `Aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章表ID',
  `Article_title` varchar(100) NOT NULL COMMENT '文章标题',
  `Article_content` longtext NOT NULL COMMENT '文章内容',
  `Issuing_time` varchar(100) NOT NULL COMMENT '发布时间',
  `Love` int(11) DEFAULT '0' COMMENT '喜欢人数',
  `Posted_by` varchar(45) DEFAULT 'admin' COMMENT '发布者',
  PRIMARY KEY (`Aid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `Article` */

LOCK TABLES `Article` WRITE;

insert  into `Article`(`Aid`,`Article_title`,`Article_content`,`Issuing_time`,`Love`,`Posted_by`) values 
(2,'sdfgs','fas','2017-11-03 22:00:00',1,'admin');

UNLOCK TABLES;

/*Table structure for table `Diary` */

DROP TABLE IF EXISTS `Diary`;

CREATE TABLE `Diary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户日记表id',
  `Title` varchar(100) NOT NULL COMMENT '日记标题',
  `Content` mediumtext NOT NULL COMMENT '日记内容',
  `WriteTime` varchar(100) NOT NULL COMMENT '日记提交时间',
  `UserDiary` int(11) NOT NULL COMMENT '是哪个用户的日记',
  PRIMARY KEY (`id`),
  KEY `PK_UserDiary` (`UserDiary`),
  CONSTRAINT `PK_UserDiary` FOREIGN KEY (`UserDiary`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `Diary` */

LOCK TABLES `Diary` WRITE;

insert  into `Diary`(`id`,`Title`,`Content`,`WriteTime`,`UserDiary`) values 
(1,'今天心情不错','Hello, world!','2017-08-01  10：26：36',6),
(2,'再来','','2017-08-01  10：34：12',6),
(3,'最后一次','最后一次，我不信！！！！！！！！！！','2017-09-01  10：56：57',6),
(4,'测试员','测试内容!!!!','2017-09-06  16：29：27',22),
(5,'123','123123','2017-09-11  16：57：43',23),
(6,'王老五的日记','哈哈哈哈哈哈，我啥也不想说！','2017-10-26 11:39:52',3),
(7,'不懂帮顶','支持','2017-12-05  10：46：06',65),
(8,'','<em>qqqq</em>','2018-01-09  14：28：13',70),
(9,'','阿实质性的','2018-05-21  12：16：15',72);

UNLOCK TABLES;

/*Table structure for table `Dynamic` */

DROP TABLE IF EXISTS `Dynamic`;

CREATE TABLE `Dynamic` (
  `Did` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态表id',
  `Content` longtext NOT NULL COMMENT '用户发表的动态内容',
  `SubmitTime` varchar(100) NOT NULL COMMENT '动态发表时间',
  `UsersId` int(10) NOT NULL COMMENT '哪个用户发表的动态',
  `UserdyId` int(11) DEFAULT NULL COMMENT '所有动态里谁评论了谁',
  PRIMARY KEY (`Did`),
  CONSTRAINT `PK_UserDyID` FOREIGN KEY (`Did`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `Dynamic` */

LOCK TABLES `Dynamic` WRITE;

insert  into `Dynamic`(`Did`,`Content`,`SubmitTime`,`UsersId`,`UserdyId`) values 
(1,'测试员来了','2017-09-11 16:47:26',22,NULL),
(2,'再来一次','2017-09-12 16:47:26',22,NULL),
(3,'我是测试员1号，我又来测试一次了啊，哈哈哈哈哈哈哈。','2017-09-15 15:17:23',22,NULL),
(4,'再次测试哈','2017-09-19 15:42:30',22,NULL),
(5,'55555','2017-09-19 15:44:53',22,NULL),
(6,'来来来','2017-09-19 15:47:24',22,NULL),
(7,'嘿嘿嘿，俺王老五来了','2017-10-26 11:39:05',3,NULL),
(8,'老王啊，你要淡定啊，别激动','2017-10-26 14:15:27',6,NULL),
(9,'','2017-11-02 20:24:57',6,NULL);

UNLOCK TABLES;

/*Table structure for table `UserData` */

DROP TABLE IF EXISTS `UserData`;

CREATE TABLE `UserData` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户资料信息表id',
  `Name` varchar(30) DEFAULT NULL COMMENT '用户资料姓名',
  `RegisteredTime` varchar(100) DEFAULT NULL COMMENT '用户注册时间',
  `Sex` varchar(6) DEFAULT NULL COMMENT '用户资料性别',
  `Age` int(100) DEFAULT NULL COMMENT '用户资料年龄',
  `Hobbies` varchar(60) DEFAULT NULL COMMENT '用户资料爱好',
  `Address` varchar(60) DEFAULT NULL COMMENT '用户资料地址',
  `UserID` int(11) NOT NULL COMMENT '对应用户表的哪一个用户',
  PRIMARY KEY (`id`),
  CONSTRAINT `PK_Users` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `UserData` */

LOCK TABLES `UserData` WRITE;

insert  into `UserData`(`id`,`Name`,`RegisteredTime`,`Sex`,`Age`,`Hobbies`,`Address`,`UserID`) values 
(1,'李四','2017-07-28  15：17：57','男',15,'','湖北省武汉市',2),
(2,'王五','2017-07-28  15：36：11','女',17,'--3','湖南省岳阳市',3),
(3,'as','2017-07-28  15：41：46','男',15,'3-3-3-3-3','湖北省天门市',4),
(4,'wa','2017-07-28  16：12：17','男',12,'5--3','河北',5),
(5,'扯上','2017-07-28  16：19：18','男',15,'1-2-3','湖北武汉',6),
(6,'测试员','2017-09-06  16：25：14','男',15,'1-2-3','湖北省武汉市',22),
(7,'赵日天','2017-09-11  15：52：27','男',1,'1-2-3-4-5','帝都',23),
(8,'彭于晏','2017-09-11  15：54：17','男',18,'1--3','江西',25),
(9,'毛钱通','2017-09-11  15：54：36','男',36,'1--3-4','江西省赣州是赣县区',24),
(11,'神','2017-08-11  17：02：03','男',0,'1-2-3-4-5','伊拉克',27),
(13,'江少','2017-08-11  17：02：27','男',17,'','',29),
(14,'孤独','2017-08-11  17：03：11','男',20,'1','广东。',28),
(15,'物极必反','2017-08-11  17：03：24','男',20,'1-2','广西',30),
(16,'张小花','2017-08-11  17：08：09','男',20,'1-2-3','',31),
(17,'amn','2017-08-11  17：12：42','男',25,'1-2-3-4-5','548484',32),
(18,'芭比','2017-08-11  17：20：40','男',20,'1','北极',33),
(19,'中国移动','2017-08-11  17：23：46','男',99,'1','北京',34),
(20,'qwer','2017-08-11  17：23：27','男',18,'1--3--5','',35),
(21,'啦啦啦','2017-08-11  17：52：54','男',18,'1','',37),
(22,'刘康','2017-08-11  17：59：49','男',18,'1-2--4-5','广州',36),
(24,'111111','2017-08-11  18：09：25','男',11,'1','111',38),
(25,'文牧之','2017-08-11  19：04：54','男',19,'1-2--4','四川省',40),
(26,'xbvurt21408','2017-08-11  20：32：22','男',11,'1','xbvurt21408',42),
(27,'<script>alert(\'XSS\')</script>','2017-08-11  20：32：43','男',11,'1','xbvurt21408',42),
(28,'1ipt','2017-08-11  20：35：29','男',11,'1','11',43),
(29,'邓善达','2017-08-11  21：48：20','男',18,'1--3-4-5','广西南宁',44),
(30,'罗晋','2017-08-11  22：49：13','男',18,'1-2-3-4-5','北京东城区',45),
(31,'阿萨啊啊','2017-08-12  6：32：22','男',18,'1','从学校发发发',46),
(32,'阿萨啊啊','2017-08-12  6：32：28','男',18,'1','从学校发发发',46),
(34,'66哥','2017-08-25  16：01：35','男',20,'1-2-3-4-5','大天朝！就是这么狂拽酷炫屌炸天～',47),
(35,'66哥','2017-08-25  16：01：39','男',20,'1-2-3-4-5','大天朝！就是这么狂拽酷炫屌炸天～',47),
(36,'66哥','2017-08-25  16：01：42','男',20,'1-2-3-4-5','大天朝！就是这么狂拽酷炫屌炸天～',47),
(37,'15151','2017-08-25  23：23：26','男',151,'1-2','SADSA',48),
(38,'SSD ','2017-09-02  17：06：33','男',20,'','',49),
(39,'','2017-11-03  22：32：01','男',NULL,'','',52),
(40,'唐山','2017-11-04  19：29：54','男',18,'1','',54),
(41,'陈晓','2017-11-04  19：35：24','男',20,'1--3-4','广东省东莞市',53),
(42,'159753','2017-11-04  20：05：38','男',15,'1','四川',55),
(43,'159753','2017-11-04  20：05：41','男',15,'1','四川',55),
(44,'里宸','2017-11-04  20：10：06','男',666,'1','重庆市',56),
(45,'1','2017-11-04  20：11：45','男',6,'----5','',57),
(46,'fucksir','2017-11-04  20：38：56','男',21,'1-2','广东',58),
(47,'李森','2017-11-04  20：43：01','男',21,'---4','湖南省长沙市',59),
(48,'king','2017-11-04  21：50：08','男',18,'1-2-3-4-5','四川南充',60),
(49,'king','2017-11-04  21：50：55','男',18,'1-2-3-4-5','四川南充',60),
(50,'锁眉','2017-11-04  23：18：25','男',23,'1---4','陕西省西安市',61),
(51,'vghh','2017-11-05  0：05：35','男',12,'1-2','gghhh',62),
(52,'lkk','2017-11-03  23：49：00','男',196,'1','',63),
(53,'飞蓬','2017-11-05  8：43：29','男',18,'1----5','四川省新津县',64),
(54,'飞蓬','2017-11-05  8：43：34','男',18,'1----5','四川省新津县',64),
(55,'puz_zle','2017-11-05  10：41：59','男',18,'1-2-3-4-5','地球村',65),
(56,'杨','2017-11-06  20：10：13','男',21,'1-2-3-4-5','广东',66),
(57,'欧杨杨','2017-11-09  21：29：36','男',16,'1-2-3-4','广东省东莞市厚街镇原力机械科技有限公司',67),
(58,'金華','2017-11-10  0：51：50','男',18,'1---4','广西南宁北流',68),
(59,'李必安','2017-11-16  20：56：03','男',21,'1','浙江温州瓯海',69),
(60,'111','2018-00-09  14：27：16','男',111,'1','111',70),
(61,'陈凤山','2018-03-28  10：44：57','男',16,'1','中国',71),
(62,'sl','2018-04-21  12：15：39','男',99,'1-2-3-4-5','天堂',72);

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `UserName` varchar(45) DEFAULT NULL COMMENT '用户名',
  `PassWord` varchar(10000) DEFAULT NULL COMMENT '密码',
  `isadmin` int(2) NOT NULL COMMENT '是否是管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`id`,`UserName`,`PassWord`,`isadmin`) values 
(1,'zhangsan','14e1b600b1fd579f47433b88e8d85291',0),
(2,'lisi','224cf2b695a5e8ecaecfb9015161fa4b',0),
(3,'wangwu','14e1b600b1fd579f47433b88e8d85291',0),
(4,'as','14e1b600b1fd579f47433b88e8d85291',0),
(5,'wa','14e1b600b1fd579f47433b88e8d85291',0),
(6,'asss','14e1b600b1fd579f47433b88e8d85291',0),
(7,'呵呵','14e1b600b1fd579f47433b88e8d85291',0),
(8,'得到','14e1b600b1fd579f47433b88e8d85291',0),
(9,'ll','14e1b600b1fd579f47433b88e8d85291',0),
(11,'hj','14e1b600b1fd579f47433b88e8d85291',0),
(12,'jk','14e1b600b1fd579f47433b88e8d85291',0),
(13,'hjh','14e1b600b1fd579f47433b88e8d85291',0),
(14,'fg','14e1b600b1fd579f47433b88e8d85291',0),
(15,'gff','14e1b600b1fd579f47433b88e8d85291',0),
(16,'hgh','14e1b600b1fd579f47433b88e8d85291',0),
(17,'hjhgj','14e1b600b1fd579f47433b88e8d85291',0),
(18,'kllk','14e1b600b1fd579f47433b88e8d85291',0),
(19,'jkjk','14e1b600b1fd579f47433b88e8d85291',0),
(20,'fhgg','14e1b600b1fd579f47433b88e8d85291',0),
(21,'hjs','14e1b600b1fd579f47433b88e8d85291',0),
(22,'aaa','14e1b600b1fd579f47433b88e8d85291',0),
(23,'123','63ee451939ed580ef3c4b6f0109d1fd0',0),
(24,'后知后觉','26f69f6e88765212b08b40dda564ee71',0),
(25,'plh666','5c5393b61e7ad45f2f6ceffb26f6286d',0),
(26,'a287356808','3ff96cc8aaa72c0847f70f18b755939b',0),
(27,'ubnt','32f585be59f004b40bdded7c7d67e7ef',0),
(28,'984968','834277f4fb99f7bb4f6303d393946229',0),
(29,'jiangshao','b592749696965c9fcd33e73101e241f5',0),
(30,'6132','2c7a5a6bfa4b5baee3b981b7803c3747',0),
(31,'飞炫的火花','783357f97264ec9667d1e94f76143c66',0),
(32,'aassdd','bf3bcfc4a1aee0792738af907167d317',0),
(33,'admin','b7b251166d36c32d34676c80dbc64a0a',0),
(34,'中国移动','9da2d0763050103abd61e1dd24824423',0),
(35,'kss','8a4bab2c096c25248616f00235ed6b1f',0),
(36,'CCTV1','904697a11f80c25cb094bbde964732f4',0),
(37,'cxz','ab2951bd93923d52abb5646eee9ca6a9',0),
(38,'11111','3cdf5666859f6906c283a1058cd5b9a7',0),
(39,'mmm','1379fdf5ecb57ee8d4549f479d66f2f7',0),
(40,'野心家','a6a2cc82e925aba9b81908e519724482',0),
(41,'946249562','0feef32e75df039f0e143321480564c9',0),
(42,'xbvurt21408','c62dcbbc2b3fa7376de2a3cd41573d34',0),
(43,'xbvurt21408\'','0dfcaccda6a3f809b0224f36e83f4879',0),
(44,'960195252','4731bbe3c5dcf028accada25ad9a793b',0),
(45,'lyh871950702','b04c39153b7816fb6c5ccc0b7791b123',0),
(46,'512068661@qq.com','70873e8580c9900986939611618d7b1e',0),
(47,'666','de8d6c50fef22cab3abae03d0826b6a1',0),
(48,'fsy6809','013e63eeb0d84ed759af185541d58290',0),
(49,'duan109384','ddc720b94d6e6f0a4cc4c567ab874404',0),
(50,'sdf','14e1b600b1fd579f47433b88e8d85291',0),
(51,'AutoAdmin','14e1b600b1fd579f47433b88e8d85291',1),
(52,'1234567890','14e1b600b1fd579f47433b88e8d85291',0),
(53,'Emporer','7335976ca6f09e532316659d61d703fa',0),
(54,'tyg106930','762414e92409cc8ea913ada17910d135',0),
(55,'159753','40d1ec82ba7a5b16481f1b06e5046d01',0),
(56,'i','98ce15853f74c2317dd614e9aca35c61',0),
(57,'1','9f23229b6f113f0155eface2ef0d3b5a',0),
(58,'fucksir','e80d5ffa670eff1e2524456e7767e406',0),
(59,'思绪','d477887b0636e5d87f79cc25c99d7dc9',0),
(60,'king','4eac8761180366e3807672cd9b084aef',0),
(61,'丿Sugar丨灬帆','6ab02c7b8ba3815e4b722cfb8381c860',0),
(62,'123456','14e1b600b1fd579f47433b88e8d85291',0),
(63,'1111','b586e7855acf04cd2451c0ad69adf7b3',0),
(64,'zxcv','1744d89e848bbc5affa2ad39ad80c40d',0),
(65,'puz_zle','76dccdbc8855c4efa678474ce5c896d8',0),
(66,'JJ','9ea8947e27649677087497ebf6843bb5',0),
(67,'1278436263','fe08efaa4c11fea9fe57bc6d1b185696',0),
(68,'2333','70873e8580c9900986939611618d7b1e',0),
(69,'qq1278783120','619ac9ca050621bd761704ff097915e1',0),
(70,'12121','1d5e6506cbfa653788981def34c11cd5',0),
(71,'332211','6763b805d732f9cf18cfe7d5c5f0f431',0),
(72,'bichaa','0f7ba32b508ca8f8d73f312abd58c8ee',0);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
