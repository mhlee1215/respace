package com.respace.domain;

//CREATE TABLE IF NOT EXISTS `respace_v1`.`rs_item` (
//		  `id` INT NOT NULL AUTO_INCREMENT,
//		  `id_artist` INT NOT NULL,
//		  `url` VARCHAR(255) NULL,
//		  `produce_number` INT NULL,
//		  `cond_period_start` VARCHAR(45) NULL COMMENT '임차 조건 시작',
//		  `cond_period_end` VARCHAR(45) NULL COMMENT '임차 조건 종료',
//		  `cond_location` VARCHAR(45) NULL,
//		  `price` INT NULL COMMENT '아이템 가격',
//		  `history` VARCHAR(255) NULL COMMENT '상품 이력',
//		  `review` TEXT NULL,
//		  `code_mood` VARCHAR(45) NULL COMMENT '제품/ 작품의 분위기 (code item)',
//		  `code_category` VARCHAR(45) NULL COMMENT '상품 분류 (code item)',
//		  `code_status` VARCHAR(45) NULL COMMENT '상품의 상태 (code item)',
//		  `size` VARCHAR(45) NULL COMMENT '000 x 000 (mm)',
//		  `for_sale_ox` VARCHAR(45) NULL,
//		  PRIMARY KEY (`id`, `id_artist`),
//		  INDEX `fk_rs_item_rs_object1_idx` (`id_artist` ASC),
//		  CONSTRAINT `fk_rs_item_rs_object1`
//		    FOREIGN KEY (`id_artist`)
//		    REFERENCES `respace_v1`.`rs_artist` (`id`)
//		    ON DELETE NO ACTION
//		    ON UPDATE NO ACTION)
//		ENGINE = InnoDB
//		COMMENT = '상품 정보';

public class Item {
	int id;
	int id_artist;
	String url;
	int produce_number;
	
}
