package com.board.domain;

import java.util.Date;

public class BoardVO {
	
	private int id;
	private String writer;
	private String userpass;
	private String category;
	private String content;
	private int cost;
	private String image;
	private int click_cnt;
	private Date create_date;
	private String state;
	
	
	public int getId() {
		return id;
	}
	public String getWriter() {
		return writer;
	}
	public String getUserpass() {
		return userpass;
	}
	public String getCategory() {
		return category;
	}
	public String getContent() {
		return content;
	}
	public int getCost() {
		return cost;
	}
	public String getImage() {
		return image;
	}
	public int getClick_cnt() {
		return click_cnt;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public String getState() {
		return state;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setClick_cnt(int click_cnt) {
		this.click_cnt = click_cnt;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	

	
	

}