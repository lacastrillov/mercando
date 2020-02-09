/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  e11001a
 * Created: 23/09/2019
 */

CREATE TABLE `sys_massive_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `source_file` varchar(200) DEFAULT NULL,
  `registration_date` DATETIME DEFAULT NULL,
  `record_time` time DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `processed` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `total_successful` int(11) DEFAULT NULL,
  `total_failed` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_idx` (`user_id`),
  CONSTRAINT `FK_massiveoperation_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);



CREATE TABLE `sys_db_operation` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `type` VARCHAR(45) NULL,
  `registration_date` DATETIME NULL,
  `record_time` TIME NULL,
  `data_in` LONGTEXT NULL,
  `data_out` LONGTEXT NULL,
  `entity_ref` VARCHAR(255) NULL,
  `entity_id` VARCHAR(100) NULL,
  `duration` INT NULL,
  `status` VARCHAR(45) NULL,
  `message` VARCHAR(300) NULL,
  `user_id` INT NOT NULL,
  `massive_operation_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_dboperation_user_idx` (`user_id` ASC),
  INDEX `FK_dboperation_massiveoperation_idx` (`massive_operation_id` ASC),
  CONSTRAINT `FK_dboperation_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_dboperation_massiveoperation`
    FOREIGN KEY (`massive_operation_id`)
    REFERENCES `sys_massive_operation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
