package com.respace.domain;

//`id` INT NOT NULL AUTO_INCREMENT,
//`id_item` INT NOT NULL,
//`id_space` INT NOT NULL,
//`id_artist` INT NOT NULL,
//`status` VARCHAR(45) NULL COMMENT '현재 상태 (진행/완료)',
//`contact_period_start` VARCHAR(45) NULL COMMENT '계약 기간 시작',
//`contact_period_end` VARCHAR(45) NULL COMMENT '계약 종료 시점',
//`contact_status` VARCHAR(45) NULL COMMENT '계약의 상태',
//`etc` TEXT NULL COMMENT '비고',

public class Contact {
	int id;
	int id_item;
	int id_space;
	int id_artist;
	String status;
	String period_start;
	String period_end;
	String etc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_item() {
		return id_item;
	}
	public void setId_item(int id_item) {
		this.id_item = id_item;
	}
	public int getId_space() {
		return id_space;
	}
	public void setId_space(int id_space) {
		this.id_space = id_space;
	}
	public int getId_artist() {
		return id_artist;
	}
	public void setId_artist(int id_artist) {
		this.id_artist = id_artist;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPeriod_start() {
		return period_start;
	}
	public void setPeriod_start(String period_start) {
		this.period_start = period_start;
	}
	public String getPeriod_end() {
		return period_end;
	}
	public void setPeriod_end(String period_end) {
		this.period_end = period_end;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	@Override
	public String toString() {
		return "Contact [id=" + id + ", id_item=" + id_item + ", id_space="
				+ id_space + ", id_artist=" + id_artist + ", status=" + status
				+ ", period_start=" + period_start + ", period_end="
				+ period_end + ", etc=" + etc + "]";
	}
}
