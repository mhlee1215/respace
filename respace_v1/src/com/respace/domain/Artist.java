package com.respace.domain;

//CREATE TABLE IF NOT EXISTS `mydb`.`rs_artist` (
//		  `id_artist` INT NOT NULL AUTO_INCREMENT,
//		  `name` VARCHAR(45) NOT NULL COMMENT '작가 이름',
//		  `url` VARCHAR(255) NULL COMMENT '작가 URL',
//		  `brand_name` VARCHAR(45) NOT NULL COMMENT '상호명 (브랜드 명)',
//		  `email` VARCHAR(90) NOT NULL COMMENT '이메일',
//		  `email_verified_ox` INT NULL DEFAULT 0 COMMENT '이메일 인증 유무 (0 : 안됨, 1: 됨)',
//		  `phone` VARCHAR(20) NOT NULL COMMENT '연락처',
//		  `phone2` VARCHAR(20) NULL COMMENT '연락처 2',
//		  `business_ox` INT NULL DEFAULT 0 COMMENT '사업자 등록 여부 (0 : 안됨, 1: 됨)',
//		  `business_reg_number` VARCHAR(20) NULL COMMENT '사업자 등록 번호',
//		  `code_target_customer` VARCHAR(45) NULL COMMENT '주 고객층 (code item)',
//		  `code_level` VARCHAR(45) NULL DEFAULT 0 COMMENT '회원 등급 (-1 : 블랙, 0: 기본.. )',
//		  `code_mood_preference` VARCHAR(45) NULL COMMENT '선호하는 카페 분위기 (code items)',
//		  `registered_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록 날짜',
//		  `recent_modified_date` TIMESTAMP NULL COMMENT '최근 수정 날짜',
//		  `profile` TEXT NULL COMMENT '작가 설명 ',
//		  `artist_picture` VARCHAR(255) NULL COMMENT '작가 사진',
//		  `etc` TEXT NULL COMMENT '비고',
//		  `code_status` VARCHAR(45) NULL,
//		  PRIMARY KEY (`id_artist`))
//		ENGINE = InnoDB
//		COMMENT = '작가';

public class Artist {
	int id;							//로우 아이
	String name;					//작가 이름 
	String utl;						//작가 URL
	String brandName;				//브랜드 
	String email;					//작가 이메
	int email_verified_ox;			//작가 이메일 인증 유
	String phone;					//연락
	String phone2;					//연락처2
	int business_ox;				//사업자 등록 여
	String business_reg_number;		//사업자 등록 번호
	String code_target_customer;	//주 고객
	String code_level;				//회원 등급
	String code_mood_preference;	//선호하는 카페 분위
	String registered_date;			//등록 날
	String recent_modified_date;	//최근 수정 날짜 
	String profile;					//작가 프로필
	String picture;					//작가 사진 
	String etc;						//비고 
	String code_status;				//상태 
	
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
	public String getUtl() {
		return utl;
	}
	public void setUtl(String utl) {
		this.utl = utl;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEmail_verified_ox() {
		return email_verified_ox;
	}
	public void setEmail_verified_ox(int email_verified_ox) {
		this.email_verified_ox = email_verified_ox;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public int getBusiness_ox() {
		return business_ox;
	}
	public void setBusiness_ox(int business_ox) {
		this.business_ox = business_ox;
	}
	public String getBusiness_reg_number() {
		return business_reg_number;
	}
	public void setBusiness_reg_number(String business_reg_number) {
		this.business_reg_number = business_reg_number;
	}
	public String getCode_target_customer() {
		return code_target_customer;
	}
	public void setCode_target_customer(String code_target_customer) {
		this.code_target_customer = code_target_customer;
	}
	public String getCode_level() {
		return code_level;
	}
	public void setCode_level(String code_level) {
		this.code_level = code_level;
	}
	public String getCode_mood_preference() {
		return code_mood_preference;
	}
	public void setCode_mood_preference(String code_mood_preference) {
		this.code_mood_preference = code_mood_preference;
	}
	public String getRegistered_date() {
		return registered_date;
	}
	public void setRegistered_date(String registered_date) {
		this.registered_date = registered_date;
	}
	public String getRecent_modified_date() {
		return recent_modified_date;
	}
	public void setRecent_modified_date(String recent_modified_date) {
		this.recent_modified_date = recent_modified_date;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getCode_status() {
		return code_status;
	}
	public void setCode_status(String code_status) {
		this.code_status = code_status;
	}
	
	@Override
	public String toString() {
		return "Artist [id=" + id + ", name=" + name + ", utl=" + utl
				+ ", brandName=" + brandName + ", email=" + email
				+ ", email_verified_ox=" + email_verified_ox + ", phone="
				+ phone + ", phone2=" + phone2 + ", business_ox=" + business_ox
				+ ", business_reg_number=" + business_reg_number
				+ ", code_target_customer=" + code_target_customer
				+ ", code_level=" + code_level + ", code_mood_preference="
				+ code_mood_preference + ", registered_date=" + registered_date
				+ ", recent_modified_date=" + recent_modified_date
				+ ", profile=" + profile + ", picture=" + picture + ", etc="
				+ etc + ", code_status=" + code_status + "]";
	}
	
	
}
