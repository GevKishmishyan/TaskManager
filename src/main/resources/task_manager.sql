/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.18-log : Database - task_manager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`task_manager` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `task_manager`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_author_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `parrent_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parrent_comment_id` (`parrent_comment_id`),
  KEY `task_id` (`task_id`),
  KEY `comment_author_id` (`comment_author_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`parrent_comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`comment_author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comments` */

insert  into `comments`(`id`,`text`,`created_date`,`comment_author_id`,`task_id`,`is_active`,`parrent_comment_id`) values (29,'who will do front side?','2020-06-25 14:12:30',11,30,1,NULL),(30,'hi Poxos','2020-06-25 14:55:28',1,30,1,29);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `not_type` enum('COMMENT','NEW_TASK','REPLY') COLLATE utf8_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`not_type`,`task_id`,`author_id`,`is_shown`,`created_date`) values (43,'NEW_TASK',30,1,0,'2020-06-25 14:12:09'),(44,'COMMENT',30,1,0,'2020-06-25 14:12:08'),(45,'REPLY',30,1,0,'2020-06-25 14:12:08'),(46,'REPLY',30,1,0,'2020-06-25 14:12:06'),(47,'REPLY',30,11,0,'2020-06-25 14:12:47'),(48,'COMMENT',30,11,0,'2020-06-25 14:12:45'),(49,'REPLY',30,1,1,'2020-06-25 14:55:28');

/*Table structure for table `tasks` */

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `assigned_user_id` int(11) DEFAULT NULL,
  `task_status` enum('TODO','IN_PROGRESS','FINISHED') COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deadline` datetime DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_task` (`name`),
  KEY `assigned_user_id` (`assigned_user_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tasks` */

insert  into `tasks`(`id`,`name`,`description`,`assigned_user_id`,`task_status`,`created_date`,`deadline`,`manager_id`) values (30,'Create Website','Please create Website ',11,'TODO','2020-06-25 14:11:04','2020-06-28 14:11:00',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `user_status` enum('MANAGER','USER') COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `prof_pic_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`surname`,`email`,`password`,`gender`,`age`,`user_status`,`created_date`,`prof_pic_url`) values (1,'Gevorg','Kishmishyan','admin@gmail.com','admin','MALE',22,'MANAGER','2020-06-22 17:28:44','1592832325893avatar.png'),(11,'Poxos','Poxosyan','poxos@mail.ru','poxos','MALE',34,'USER','2020-06-25 14:05:24','1593079524181userAv.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
