DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(255)     NOT NULL,
  `slug`        VARCHAR(255)     NOT NULL,
  `description` VARCHAR(255)              DEFAULT NULL,
  `order`       INT(10) UNSIGNED NOT NULL,
  `created_at`  TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `category_note`;
CREATE TABLE IF NOT EXISTS `category_note` (
  `id`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` INT(10) UNSIGNED NOT NULL,
  `note_id`     INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`       VARCHAR(255)     NOT NULL,
  `slug`       VARCHAR(255)     NOT NULL,
  `user_id`    INT(10) UNSIGNED          DEFAULT NULL,
  `created_at` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `tag_note`;
CREATE TABLE IF NOT EXISTS `tag_note` (
  `id`      INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id`  INT(10) UNSIGNED NOT NULL,
  `note_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title`       VARCHAR(140)     NOT NULL,
  `slug`        VARCHAR(255)     NOT NULL,
  `description` TEXT,
  `content`     TEXT             NOT NULL,
  `vote_count`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count`  INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id`     INT(10) UNSIGNED NOT NULL,
  `created_at`  TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id`    INT(10) UNSIGNED NOT NULL,
  `note_id`    INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email`      VARCHAR(255)     NOT NULL,
  `avatar`     VARCHAR(255)              DEFAULT NULL,
  `username`   VARCHAR(255)     NOT NULL,
  `salt`       VARCHAR(255)     NOT NULL,
  `password`   VARCHAR(255)     NOT NULL,
  `created_at` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id`           INT(10) UNSIGNED    NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(255) UNIQUE NOT NULL,
  `display_name` VARCHAR(255)                 DEFAULT NULL,
  `description`  VARCHAR(255)                 DEFAULT NULL,
  `created_at`   TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`   TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id`      INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED,
  `role_id` INT(10) UNSIGNED,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id`           INT(10) UNSIGNED    NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(255) UNIQUE NOT NULL,
  `display_name` VARCHAR(255)                 DEFAULT NULL,
  `description`  VARCHAR(255)                 DEFAULT NULL,
  `created_at`   TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`   TIMESTAMP           NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id`            INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` INT(10) UNSIGNED,
  `role_id`       INT(10) UNSIGNED,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `password_reminders`;
CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email`      VARCHAR(255) NOT NULL,
  `token`      VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id`                  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid`                 VARCHAR(255)     NOT NULL,
  `user_id`             INT(10) UNSIGNED NOT NULL,
  `username`            VARCHAR(255)              DEFAULT NULL,
  `name`                VARCHAR(255)              DEFAULT NULL,
  `email`               VARCHAR(255)              DEFAULT NULL,
  `first_name`          VARCHAR(255)              DEFAULT NULL,
  `last_name`           VARCHAR(255)              DEFAULT NULL,
  `location`            VARCHAR(255)              DEFAULT NULL,
  `description`         VARCHAR(255)              DEFAULT NULL,
  `image_url`           VARCHAR(255)              DEFAULT NULL,
  `access_token`        VARCHAR(255)              DEFAULT NULL,
  `access_token_secret` VARCHAR(255)              DEFAULT NULL,
  `created_at`          TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`          TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);