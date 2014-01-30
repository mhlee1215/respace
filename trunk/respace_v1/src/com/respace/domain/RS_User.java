package com.respace.domain;

/**
 * 
 * @author sutting
 * 
 */

//`id` INT NOT NULL AUTO_INCREMENT,
//`name` VARCHAR(16) NULL,
//`email` VARCHAR(255) NOT NULL,
//`password` VARCHAR(32) NOT NULL,
//`registeredtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
//`deletedtime` VARCHAR(45) NULL,
//`verifiedtime` VARCHAR(45) NULL,
//`status` VARCHAR(45) NULL,
//`isverified` INT NOT NULL DEFAULT 0,

public class RS_User {
	
	public final static int		STATUS_NOT_FOUNDED			= 1;
	public final static int		STATUS_FOUNDED				= 2;
	public final static int		STATUS_SUCCESS_REGISTER		= 3;
	public final static int		STATUS_SUCCESS_VERIFIED		= 4;
	public final static int		STATUS_SUCCESS_DELETED		= 5;
	public final static int		STATUS_ALREADY_REGISTEREDED	= 6;
	public final static int		STATUS_ALREADY_VERIFIED		= 7;
	public final static int		STATUS_ALREADY_DELETED		= 8;
	public final static int		STATUS_NOT_VERIFIED			= 9;
	public final static int		STATUS_DELTE_FAIL			= 10;
	
	public final static String		STATUS_VERIFIED				= "STATUS_VERIFIED";
	
	
	private int		id				= 0;	// ID
	private String 	name			= "";
	private String 	email 			= "";
	private String	password		= "";	// PASSWORD
	private String  registeredtime 	= "";
	private String  deletedtime 	= "";
	private String  verifiedtime 	= "";
	private String	status 			= ""; 
	private String	isverified		= "N";
	private String	isdeleted		= "N";
	private String  type			= "";
	
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

	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegisteredtime() {
		return registeredtime;
	}
	public void setRegisteredtime(String registeredtime) {
		this.registeredtime = registeredtime;
	}
	public String getDeletedtime() {
		return deletedtime;
	}
	public void setDeletedtime(String deletedtime) {
		this.deletedtime = deletedtime;
	}
	public String getVerifiedtime() {
		return verifiedtime;
	}
	public void setVerifiedtime(String verifiedtime) {
		this.verifiedtime = verifiedtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIsverified() {
		return isverified;
	}
	public void setIsverified(String isverified) {
		this.isverified = isverified;
	}
	public String getIsdeleted() {
		return isdeleted;
	}
	public void setIsdeleted(String isdeleted) {
		this.isdeleted = isdeleted;
	}
	
	@Override
	public String toString() {
		return "RS_User [id=" + id + ", name=" + name + ", email=" + email
				+ ", password=" + password + ", registeredtime="
				+ registeredtime + ", deletedtime=" + deletedtime
				+ ", verifiedtime=" + verifiedtime + ", status=" + status
				+ ", isverified=" + isverified + ", isdeleted=" + isdeleted
				+ ", type=" + type + ", query_start=" + query_start
				+ ", query_number=" + query_number + "]";
	}
	
}
