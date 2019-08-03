/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  lacastrillov
 * Created: 3/08/2019
 */

ALTER TABLE `marketplatform`.`web_resource` 
ADD COLUMN `module` VARCHAR(100) NULL AFTER `category`;
