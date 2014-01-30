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

public class RS_Space {
	private int id;											//아이
	private int id_contact;
	private String name;										//공간
	private String url;										//공간 URL
	private String address_plain;							//공간 주소 (전체)
	private String address_si;								//공간 주소 (시)
	private String address_do;								//공간 주소 (도)
	private String address_dong;							//공간 주소 (동)
	private String address_last;							//공간 주소 (나머지)
	private String code_mood;								//분위기 (코드)
	private String email;									//이메
	private String phone;									//연락처 1
	private String phone2;									//연락처 2
	private int franchise_ox;								//프렌차이즈 유무
	private String frenchise_headquater_phone;				//프렌차이즈 본사 연락
	private String frenchise_headquater_location;			//프렌차이즈 본사 위치
	private String business_registered_number;				//사업자 등록 번호
	private String cond_input_period_start;					//
	private String cond_input_period_end;
	private String cond_input_type;
	private String code_target;
	private String code_level;
	private String code_size;
	private String open_time;
	private String close_time;
	private String etc;
	private String open_date;
	private String registered_date;
	private String review;
	
	private String thumbnail_url;
	
	private int query_start = 0;
	private int query_number = 0;
	
	
	public int getQuery_start() {
		return query_start;
	}
	public void setQuery_start(int query_start) {
		this.query_start = query_start;
	}
	public int getQuery_number() {
		return query_number;
	}
	public void setQuery_number(int query_number) {
		this.query_number = query_number;
	}
	
	public String getThumbnail_url() {
		return thumbnail_url;
	}

	public void setThumbnail_url(String thumbnail_url) {
		this.thumbnail_url = thumbnail_url;
	}

	public RS_Space(){
	}
	
	public RS_Space(String name){
		this.name = name;
	}
	
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
	
	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	@Override
	public String toString() {
		return "RS_Space [id=" + id + ", id_contact=" + id_contact + ", name="
				+ name + ", url=" + url + ", address_plain=" + address_plain
				+ ", address_si=" + address_si + ", address_do=" + address_do
				+ ", address_dong=" + address_dong + ", address_last="
				+ address_last + ", code_mood=" + code_mood + ", email="
				+ email + ", phone=" + phone + ", phone2=" + phone2
				+ ", franchise_ox=" + franchise_ox
				+ ", frenchise_headquater_phone=" + frenchise_headquater_phone
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
				+ ", thumbnail_url=" + thumbnail_url + ", query_start="
				+ query_start + ", query_number=" + query_number + "]";
	}
	public int getFranchise_ox() {
		return franchise_ox;
	}
	public void setFranchise_ox(int franchise_ox) {
		this.franchise_ox = franchise_ox;
	}
}
