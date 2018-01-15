/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 spring-note 的数据库结构
DROP DATABASE IF EXISTS `spring-note`;
CREATE DATABASE IF NOT EXISTS `spring-note` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spring-note`;

-- 导出  表 spring-note.categories 结构
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id`          INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(255)
                COLLATE utf8_unicode_ci NOT NULL,
  `slug`        VARCHAR(255)
                COLLATE utf8_unicode_ci NOT NULL,
  `description` VARCHAR(255)
                COLLATE utf8_unicode_ci          DEFAULT NULL,
  `order`       INT(10) UNSIGNED        NOT NULL,
  `created_at`  TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`  TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.category_note 结构
DROP TABLE IF EXISTS `category_note`;
CREATE TABLE IF NOT EXISTS `category_note` (
  `id`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` INT(10) UNSIGNED NOT NULL,
  `note_id`     INT(10) UNSIGNED NOT NULL,
  `created_at`  TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`  TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `category_note_category_id_foreign` (`category_id`),
  KEY `category_note_note_id_foreign` (`note_id`),
  CONSTRAINT `category_note_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `category_note_note_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.password_reminders 结构
DROP TABLE IF EXISTS `password_reminders`;
CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email`      VARCHAR(255)
               COLLATE utf8_unicode_ci NOT NULL,
  `token`      VARCHAR(255)
               COLLATE utf8_unicode_ci NOT NULL,
  `created_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_reminders_email_index` (`email`),
  KEY `password_reminders_token_index` (`token`)
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.profiles 结构
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id`                  INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `uid`                 VARCHAR(255)
                        COLLATE utf8_unicode_ci NOT NULL,
  `user_id`             INT(10) UNSIGNED        NOT NULL,
  `username`            VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `name`                VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `email`               VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `first_name`          VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `last_name`           VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `location`            VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `description`         VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `image_url`           VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `access_token`        VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `access_token_secret` VARCHAR(255)
                        COLLATE utf8_unicode_ci          DEFAULT NULL,
  `created_at`          TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`          TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.tags 结构
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id`         INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `name`       VARCHAR(255)
               COLLATE utf8_unicode_ci NOT NULL,
  `slug`       VARCHAR(255)
               COLLATE utf8_unicode_ci NOT NULL,
  `user_id`    INT(10) UNSIGNED                 DEFAULT NULL,
  `created_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`),
  KEY `tags_user_id_foreign` (`user_id`),
  CONSTRAINT `tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.tag_note 结构
DROP TABLE IF EXISTS `tag_note`;
CREATE TABLE IF NOT EXISTS `tag_note` (
  `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id`     INT(10) UNSIGNED NOT NULL,
  `note_id`    INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_note_tag_id_foreign` (`tag_id`),
  KEY `tag_note_note_id_foreign` (`note_id`),
  CONSTRAINT `tag_note_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `tag_note_note_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.notes 结构
DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id`          INT(10) UNSIGNED             NOT NULL AUTO_INCREMENT,
  `spam`        TINYINT(1)                   NOT NULL DEFAULT '0',
  `title`       VARCHAR(140)
                COLLATE utf8_unicode_ci      NOT NULL,
  `slug`        VARCHAR(255)
                COLLATE utf8_unicode_ci      NOT NULL,
  `description` TEXT COLLATE utf8_unicode_ci,
  `code`        TEXT COLLATE utf8_unicode_ci NOT NULL,
  `vote_cache`  INT(10) UNSIGNED             NOT NULL DEFAULT '0',
  `view_cache`  INT(10) UNSIGNED             NOT NULL DEFAULT '0',
  `user_id`     INT(10) UNSIGNED             NOT NULL,
  `created_at`  TIMESTAMP                    NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`  TIMESTAMP                    NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notes_slug_unique` (`slug`),
  KEY `notes_user_id_foreign` (`user_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.users 结构
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id`             INT(10) UNSIGNED        NOT NULL AUTO_INCREMENT,
  `remember_token` VARCHAR(100)
                   COLLATE utf8_unicode_ci          DEFAULT NULL,
  `email`          VARCHAR(255)
                   COLLATE utf8_unicode_ci NOT NULL,
  `avatar`         VARCHAR(255)
                   COLLATE utf8_unicode_ci          DEFAULT NULL,
  `username`       VARCHAR(255)
                   COLLATE utf8_unicode_ci NOT NULL,
  `password`       VARCHAR(255)
                   COLLATE utf8_unicode_ci NOT NULL,
  `is_admin`       TINYINT(1)              NOT NULL DEFAULT '0',
  `created_at`     TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`     TIMESTAMP               NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
-- 导出  表 spring-note.votes 结构
DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`    INT(10) UNSIGNED NOT NULL,
  `note_id`    INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP        NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `votes_user_id_foreign` (`user_id`),
  KEY `votes_note_id_foreign` (`note_id`),
  CONSTRAINT `votes_note_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_unicode_ci;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE = IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS = IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
