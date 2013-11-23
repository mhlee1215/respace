package com.respace.domain;

//CREATE TABLE IF NOT EXISTS `respace_v1`.`rs_booth` (
//		  `id` INT NOT NULL,
//		  `id_space` INT NOT NULL,
//		  `light_ox` INT NULL COMMENT '조명 여부',
//		  `location` VARCHAR(45) NULL COMMENT '매대 위치',
//		  `size` VARCHAR(45) NULL COMMENT '매대 크기 (000 x 000)',
//		  `size_people` INT NULL COMMENT '수용 가능 인원',
//		  `selling_booth_req_ox` INT NULL COMMENT '매대 필요 여부',
//		  `code_wall_type` VARCHAR(45) NULL COMMENT '벽 형태',
//		  `date_period_start` VARCHAR(45) NULL COMMENT '임대 날짜 시작',
//		  `date_period_end` VARCHAR(45) NULL COMMENT '임대 날짜 종료',
//		  `price` INT NULL COMMENT '가격',
//		  `open_time` VARCHAR(45) NULL COMMENT '영업 시간 (시작)',
//		  `close_time` VARCHAR(45) NULL COMMENT '영업 시간 (시작)',
//		  `code_type` VARCHAR(45) NULL COMMENT '매대 타입',
//		  `code_instrument` VARCHAR(45) NULL COMMENT '장비 M, F, ....',
//		  PRIMARY KEY (`id`),
//		  INDEX `fk_rs_space_booth_rs_space1_idx` (`id_space` ASC),
//		  CONSTRAINT `fk_rs_space_booth_rs_space1`
//		    FOREIGN KEY (`id_space`)
//		    REFERENCES `respace_v1`.`rs_space` (`id`)
//		    ON DELETE NO ACTION
//		    ON UPDATE NO ACTION)

public class Booth {
	int id;							//부스 아이
	int id_space;					//공간 아이
	int light_ox;					//조명 여부
	String location;				//매장내 매대 위치
	String size;					//부스 크기
	int size_people;				//수용 가능 인
	int selling_booth_req_ox;		//매대 필요 여부
	String code_wall_type;			//벽 형태
	String date_period_start;		//임대 날짜 시작
	String date_period_end;			//임대 날짜 종료
	int price;						//가
	String open_time;				//영업 시간 (시작)
	String close_time;				//영업 시간 (종료)
	String code_type;				//매대 타입
	String code_instrument;			//장비 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_space() {
		return id_space;
	}
	public void setId_space(int id_space) {
		this.id_space = id_space;
	}
	public int getLight_ox() {
		return light_ox;
	}
	public void setLight_ox(int light_ox) {
		this.light_ox = light_ox;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getSize_people() {
		return size_people;
	}
	public void setSize_people(int size_people) {
		this.size_people = size_people;
	}
	public int getSelling_booth_req_ox() {
		return selling_booth_req_ox;
	}
	public void setSelling_booth_req_ox(int selling_booth_req_ox) {
		this.selling_booth_req_ox = selling_booth_req_ox;
	}
	public String getCode_wall_type() {
		return code_wall_type;
	}
	public void setCode_wall_type(String code_wall_type) {
		this.code_wall_type = code_wall_type;
	}
	public String getDate_period_start() {
		return date_period_start;
	}
	public void setDate_period_start(String date_period_start) {
		this.date_period_start = date_period_start;
	}
	public String getDate_period_end() {
		return date_period_end;
	}
	public void setDate_period_end(String date_period_end) {
		this.date_period_end = date_period_end;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public String getCode_type() {
		return code_type;
	}
	public void setCode_type(String code_type) {
		this.code_type = code_type;
	}
	public String getCode_instrument() {
		return code_instrument;
	}
	public void setCode_instrument(String code_instrument) {
		this.code_instrument = code_instrument;
	}
	
	@Override
	public String toString() {
		return "Booth [id=" + id + ", id_space=" + id_space + ", light_ox="
				+ light_ox + ", location=" + location + ", size=" + size
				+ ", size_people=" + size_people + ", selling_booth_req_ox="
				+ selling_booth_req_ox + ", code_wall_type=" + code_wall_type
				+ ", date_period_start=" + date_period_start
				+ ", date_period_end=" + date_period_end + ", price=" + price
				+ ", open_time=" + open_time + ", close_time=" + close_time
				+ ", code_type=" + code_type + ", code_instrument="
				+ code_instrument + "]";
	}
	
	
}
