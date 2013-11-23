package com.respace.domain;

//CREATE TABLE IF NOT EXISTS `respace_v1`.`rs_asset` (
//		  `id` INT NOT NULL AUTO_INCREMENT,
//		  `name` VARCHAR(45) NULL,
//		  `url` VARCHAR(255) NOT NULL,
//		  `type` VARCHAR(45) NOT NULL,
//		  `id_reference` INT NULL,
//		  `etc` VARCHAR(300) NULL,
//		  PRIMARY KEY (`id`))
//		ENGINE = InnoDB;

public class Asset {
	int id;					//아이디
	String name;			//어셋 이름
	String url;				//어셋 URL
	String type;			//어셋 타입 (작가, 공간, 상품)
	int id_reference;		//참조 아이디 (작가, 공간, 상품) 다 가능..
	String etc;				//비고
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getId_reference() {
		return id_reference;
	}
	public void setId_reference(int id_reference) {
		this.id_reference = id_reference;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	@Override
	public String toString() {
		return "Asset [id=" + id + ", name=" + name + ", url=" + url
				+ ", type=" + type + ", id_reference=" + id_reference
				+ ", etc=" + etc + "]";
	}
	
	
}
