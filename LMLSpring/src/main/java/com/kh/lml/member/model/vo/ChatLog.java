package com.kh.lml.member.model.vo;

import java.sql.Date;

public class ChatLog {
	private String chatroomid;
	private String chatlog;
	private Date chatdate;
	private String user_name;
	
	
	
	public ChatLog() {
		super();
	}

	public ChatLog(String chatroomid, String chatlog, Date chatdate, String user_name) {
		this.chatroomid = chatroomid;
		this.chatlog = chatlog;
		this.chatdate = chatdate;
		this.user_name = user_name;
	}

	public String getChatroomid() {
		return chatroomid;
	}

	public void setChatroomid(String chatroomid) {
		this.chatroomid = chatroomid;
	}

	public String getChatlog() {
		return chatlog;
	}

	public void setChatlog(String chatlog) {
		this.chatlog = chatlog;
	}

	public Date getChatdate() {
		return chatdate;
	}

	public void setChatdate(Date chatdate) {
		this.chatdate = chatdate;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "ChatLog [chatroomid=" + chatroomid + ", chatlog=" + chatlog + ", chatdate=" + chatdate + ", user_name="
				+ user_name + "]";
	}
	
	
	
	
	
}
