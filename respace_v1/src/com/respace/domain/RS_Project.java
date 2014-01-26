package com.respace.domain;

public class RS_Project {
	private int id = 0;
	private int id_contact = 0;
	private String 	title 	= "";
	private String 	description 	= "";
	private String 	host_name 	= "";
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	@Override
	public String toString() {
		return "RS_Project [id=" + id + ", id_contact=" + id_contact
				+ ", title=" + title + ", description=" + description
				+ ", host_name=" + host_name + "]";
	}
}
