/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  lacastrillov
 * Created: 19/05/2018
 */

CREATE TABLE `web_entity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(100) NOT NULL,
  `entity_ref` varchar(100) NOT NULL,
  `entity_order` int(11) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `class_name` varchar(400) DEFAULT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `web_entity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity_id` varchar(100) DEFAULT NULL,
  `entity_order` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `web_entity_type_id` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_web_entity_1_idx` (`parent_id`),
  KEY `fk_web_entity_2_idx` (`web_entity_type_id`),
  CONSTRAINT `fk_web_entity_1` FOREIGN KEY (`parent_id`) REFERENCES `web_entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_web_entity_2` FOREIGN KEY (`web_entity_type_id`) REFERENCES `web_entity_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;