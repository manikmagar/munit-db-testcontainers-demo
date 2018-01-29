drop schema if exists `hr`;

create schema `hr`;

CREATE TABLE `hr`.`employees` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_joining` DATE NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `date_of_termination` DATE NULL,
  PRIMARY KEY (`employee_id`));

CREATE TABLE `hr`.`addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  `address_line1` VARCHAR(255) NOT NULL,
  `address_line2` VARCHAR(255) NULL,
  `city` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NOT NULL,
  `zip` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `address_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_employee_id_idx` (`employee_id` ASC),
  CONSTRAINT `fk_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `hr`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `hr`.`employees`
(
`first_name`,
`last_name`,
`date_of_joining`,
`date_of_birth`,
`date_of_termination`)
VALUES
('Manik',
'Magar',
'2017-01-01',
'1980-01-01',
null);

drop procedure if exists `hr`.`terminate_employee`;
 
USE `hr`;
DROP procedure IF EXISTS `terminate_employee`;

DELIMITER $$
USE `hr`$$
CREATE PROCEDURE `hr`.`terminate_employee`(IN empId int, OUT success int)
BEGIN

update `hr`.employees set date_of_termination = now() where employee_id = empId;

set success = ROW_COUNT();

END;$$

DELIMITER ;


