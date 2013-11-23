package com.respace.domain;

//CREATE TABLE IF NOT EXISTS `respace_v1`.`rs_space` (
//		  `id` INT NOT NULL AUTO_INCREMENT,
//		  `name` VARCHAR(100) NOT NULL,
//		  `url` VARCHAR(300) NULL,
//		  `address_plain` VARCHAR(200) NULL,
//		  `address_si` VARCHAR(45) NULL,
//		  `address_do` VARCHAR(45) NULL,
//		  `address_dong` VARCHAR(45) NULL,
//		  `address_last` VARCHAR(45) NULL,
//		  `code_mood` INT NOT NULL COMMENT '공간 분위기 (code item)',
//		  `email` VARCHAR(200) NULL,
//		  `phone` VARCHAR(45) NULL,
//		  `phone2` VARCHAR(45) NULL,
//		  `franchise_ox` VARCHAR(2) NULL,
//		  `frenchise_headquater_phone` VARCHAR(45) NULL,
//		  `frenchise_headquater_location` VARCHAR(45) NULL,
//		  `business_registered_number` VARCHAR(45) NULL,
//		  `cond_input_period_start` VARCHAR(45) NULL,
//		  `cond_input_period_end` VARCHAR(45) NULL,
//		  `cond_input_type` VARCHAR(45) NULL,
//		  `code_target` VARCHAR(45) NULL,
//		  `code_level` VARCHAR(45) NULL,
//		  `code_size` VARCHAR(45) NULL,
//		  `open_time` VARCHAR(45) NULL,
//		  `close_time` VARCHAR(45) NULL,
//		  `etc` TEXT NULL,
//		  `open_date` VARCHAR(45) NULL,
//		  `registered_date` VARCHAR(45) NULL,
//		  `review` VARCHAR(45) NULL,
//		  PRIMARY KEY (`id`))
//		ENGINE = InnoDB
//		COMMENT = '공간 정보';

public class Space {
	int id;											//아이
	int name;										//공간
	String url;										//공간 URL
	String address_plain;							//공간 주소 (전체)
	String address_si;								//공간 주소 (시)
	String address_do;								//공간 주소 (도)
	String address_dong;							//공간 주소 (동)
	String address_last;							//공간 주소 (나머지)
	String code_mood;								//분위기 (코드)
	String email;									//이메
	String phone;									//연락처 1
	String phone2;									//연락처 2
	int frenchise_ox;								//프렌차이즈 유무
	String frenchise_headquater_phone;				//프렌차이즈 본사 연락
	String frenchise_headquater_location;			//프렌차이즈 본사 위치
	String business_registered_number;				//사업자 등록 번호
	String cond_input_period_start;					//
	String cond_input_period_end;
	String cond_input_type;
	String code_target;
	String code_level;
	String code_size;
	String open_time;
	String close_time;
	String etc;
	String open_date;
	String registered_date;
	String review;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAddress_plain() {
		return address_plain;
	}
	public void setAddress_plain(String address_plain) {
		this.address_plain = address_plain;
	}
	public String getAddress_si() {
		return address_si;
	}
	public void setAddress_si(String address_si) {
		this.address_si = address_si;
	}
	public String getAddress_do() {
		return address_do;
	}
	public void setAddress_do(String address_do) {
		this.address_do = address_do;
	}
	public String getAddress_dong() {
		return address_dong;
	}
	public void setAddress_dong(String address_dong) {
		this.address_dong = address_dong;
	}
	public String getAddress_last() {
		return address_last;
	}
	public void setAddress_last(String address_last) {
		this.address_last = address_last;
	}
	public String getCode_mood() {
		return code_mood;
	}
	public void setCode_mood(String code_mood) {
		this.code_mood = code_mood;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getFrenchise_ox() {
		return frenchise_ox;
	}
	public void setFrenchise_ox(int frenchise_ox) {
		this.frenchise_ox = frenchise_ox;
	}
	public String getFrenchise_headquater_phone() {
		return frenchise_headquater_phone;
	}
	public void setFrenchise_headquater_phone(String frenchise_headquater_phone) {
		this.frenchise_headquater_phone = frenchise_headquater_phone;
	}
	public String getFrenchise_headquater_location() {
		return frenchise_headquater_location;
	}
	public void setFrenchise_headquater_location(
			String frenchise_headquater_location) {
		this.frenchise_headquater_location = frenchise_headquater_location;
	}
	public String getBusiness_registered_number() {
		return business_registered_number;
	}
	public void setBusiness_registered_number(String business_registered_number) {
		this.business_registered_number = business_registered_number;
	}
	public String getCond_input_period_start() {
		return cond_input_period_start;
	}
	public void setCond_input_period_start(String cond_input_period_start) {
		this.cond_input_period_start = cond_input_period_start;
	}
	public String getCond_input_period_end() {
		return cond_input_period_end;
	}
	public void setCond_input_period_end(String cond_input_period_end) {
		this.cond_input_period_end = cond_input_period_end;
	}
	public String getCond_input_type() {
		return cond_input_type;
	}
	public void setCond_input_type(String cond_input_type) {
		this.cond_input_type = cond_input_type;
	}
	public String getCode_target() {
		return code_target;
	}
	public void setCode_target(String code_target) {
		this.code_target = code_target;
	}
	public String getCode_level() {
		return code_level;
	}
	public void setCode_level(String code_level) {
		this.code_level = code_level;
	}
	public String getCode_size() {
		return code_size;
	}
	public void setCode_size(String code_size) {
		this.code_size = code_size;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getClose_time() {
		return close_time;
	}
	public void setClose_time(String close_time) {
		this.close_time = close_time;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getOpen_date() {
		return open_date;
	}
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}
	public String getRegistered_date() {
		return registered_date;
	}
	public void setRegistered_date(String registered_date) {
		this.registered_date = registered_date;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
	@Override
	public String toString() {
		return "Space [id=" + id + ", name=" + name + ", url=" + url
				+ ", address_plain=" + address_plain + ", address_si="
				+ address_si + ", address_do=" + address_do + ", address_dong="
				+ address_dong + ", address_last=" + address_last
				+ ", code_mood=" + code_mood + ", email=" + email + ", phone="
				+ phone + ", phone2=" + phone2 + ", frenchise_ox="
				+ frenchise_ox + ", frenchise_headquater_phone="
				+ frenchise_headquater_phone
				+ ", frenchise_headquater_location="
				+ frenchise_headquater_location
				+ ", business_registered_number=" + business_registered_number
				+ ", cond_input_period_start=" + cond_input_period_start
				+ ", cond_input_period_end=" + cond_input_period_end
				+ ", cond_input_type=" + cond_input_type + ", code_target="
				+ code_target + ", code_level=" + code_level + ", code_size="
				+ code_size + ", open_time=" + open_time + ", close_time="
				+ close_time + ", etc=" + etc + ", open_date=" + open_date
				+ ", registered_date=" + registered_date + ", review=" + review
				+ "]";
	}
	
	
	
}
