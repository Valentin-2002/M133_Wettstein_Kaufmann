-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `User_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `login_username` VARCHAR(255) NOT NULL,
  `login_password` VARCHAR(255) NOT NULL,
  `admin` TINYINT(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`User_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`chatroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chatroom` (
  `Chatroom_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `chatroom_name` VARCHAR(255) NOT NULL,
  `private` TINYINT(4) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `FK_Owner` INT(11) NOT NULL,
  PRIMARY KEY (`Chatroom_ID`),
  INDEX `fk_chatroom_user1_idx` (`FK_Owner` ASC),
  CONSTRAINT `fk_chatroom_user1`
    FOREIGN KEY (`FK_Owner`)
    REFERENCES `mydb`.`user` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`chatroomuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chatroomuser` (
  `ChatroomUser_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `FK_User_ID` INT(11) NOT NULL,
  `FK_Chatroom_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ChatroomUser_ID`),
  INDEX `fk_ChatroomUser_User1_idx` (`FK_User_ID` ASC),
  INDEX `fk_ChatroomUser_Chatroom1_idx` (`FK_Chatroom_ID` ASC),
  CONSTRAINT `fk_ChatroomUser_Chatroom1`
    FOREIGN KEY (`FK_Chatroom_ID`)
    REFERENCES `mydb`.`chatroom` (`Chatroom_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ChatroomUser_User1`
    FOREIGN KEY (`FK_User_ID`)
    REFERENCES `mydb`.`user` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`message` (
  `Message_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `chatroom` INT(11) NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FK_User_ID` INT(11) NOT NULL,
  PRIMARY KEY (`Message_ID`),
  INDEX `fk_Message_User_idx` (`FK_User_ID` ASC),
  CONSTRAINT `fk_Message_User`
    FOREIGN KEY (`FK_User_ID`)
    REFERENCES `mydb`.`user` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
          CONSTRAINT `fk_Message_Chatroom`
    FOREIGN KEY (`chatroom`)
    REFERENCES `mydb`.`chatroom` (`Chatroom_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

