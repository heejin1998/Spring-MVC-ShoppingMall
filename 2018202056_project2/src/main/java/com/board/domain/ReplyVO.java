package com.board.domain;

import java.util.Date;

public class ReplyVO {
	
	private int rid;
	private int id;
	private String content;
	private String writer;
	private String userpass;
	private Date create_date;
	private int count;
	
	public int getRid() {
		return rid;
	}
	public int getId() {
		return id;
	}
	public String getContent() {
		return content;
	}
	public String getWriter() {
		return writer;
	}
	public String getUserpass() {
		return userpass;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public int getCount() {
		return count;
	}
	
	public void setRid(int rid) {
		this.rid = rid;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", id=" + id + ", content=" + content + ", writer=" + writer + ", userpass=" + userpass +", create_date="
				+ create_date + "]";
	}
	
	
}
