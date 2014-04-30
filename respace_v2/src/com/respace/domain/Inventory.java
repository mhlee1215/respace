package com.respace.domain;

//CREATE TABLE IF NOT EXISTS `respacee`.`rs_inventory` (
//		  `id` INT NOT NULL AUTO_INCREMENT,
//		  `id_product` INT NOT NULL COMMENT '상품 아이디',
//		  `id_booth` INT NOT NULL COMMENT '판매 부스 아이디',
//		  `input_number` INT NULL COMMENT '최초 납품 수량',
//		  `current_number` INT NULL COMMENT '현재 재고',
//		  `sold_number` INT NULL COMMENT '팔린 갯수',
//		  `code_type` VARCHAR(45) NULL COMMENT '타입',
//		  PRIMARY KEY (`id`),
//		  INDEX `fk_rs_item_inventory_rs_item1_idx` (`id_product` ASC),
//		  INDEX `fk_rs_item_inventory_rs_space_booth1_idx` (`id_booth` ASC),
//		  CONSTRAINT `fk_rs_item_inventory_rs_item1`
//		    FOREIGN KEY (`id_product`)
//		    REFERENCES `respacee`.`rs_product` (`id`)
//		    ON DELETE NO ACTION
//		    ON UPDATE NO ACTION,
//		  CONSTRAINT `fk_rs_item_inventory_rs_space_booth1`
//		    FOREIGN KEY (`id_booth`)
//		    REFERENCES `respacee`.`rs_booth` (`id`)
//		    ON DELETE NO ACTION
//		    ON UPDATE NO ACTION)

public class Inventory {
	int id;					//아이디
	int id_product;			//상품 아이디
	int id_booth;			//매대 아이디
	int input_number;		//납품 수량
	int current_number;		//현재 수량
	int sold_number;		//판매 수량
	String code_type;		//재고 상태
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public int getId_booth() {
		return id_booth;
	}
	public void setId_booth(int id_booth) {
		this.id_booth = id_booth;
	}
	public int getInput_number() {
		return input_number;
	}
	public void setInput_number(int input_number) {
		this.input_number = input_number;
	}
	public int getCurrent_number() {
		return current_number;
	}
	public void setCurrent_number(int current_number) {
		this.current_number = current_number;
	}
	public int getSold_number() {
		return sold_number;
	}
	public void setSold_number(int sold_number) {
		this.sold_number = sold_number;
	}
	public String getCode_type() {
		return code_type;
	}
	public void setCode_type(String code_type) {
		this.code_type = code_type;
	}
	
	@Override
	public String toString() {
		return "Inventory [id=" + id + ", id_product=" + id_product
				+ ", id_booth=" + id_booth + ", input_number=" + input_number
				+ ", current_number=" + current_number + ", sold_number="
				+ sold_number + ", code_type=" + code_type + "]";
	}
	
	
}
