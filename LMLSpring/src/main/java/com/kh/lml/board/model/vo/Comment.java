package com.kh.lml.board.model.vo;

import java.sql.Date;

public class Comment {
	private int c_no;
	private int c_bno;
	private String c_content;
	private int c_unum;
	private int c_recno;
	private int c_level;
	private String c_utag;
	private Date c_date;
	private String uname;
	private String profile;
	private String c_id;
	
	public Comment() {
		super();
	}

	public Comment(int c_no, int c_bno, String c_content, int c_unum, int c_recno, int c_level, String c_utag,
			Date c_date, String uname, String profile, String c_id) {
		super();
		this.c_no = c_no;
		this.c_bno = c_bno;
		this.c_content = c_content;
		this.c_unum = c_unum;
		this.c_recno = c_recno;
		this.c_level = c_level;
		this.c_utag = c_utag;
		this.c_date = c_date;
		this.uname = uname;
		this.profile = profile;
		this.c_id = c_id;
	}





	// 댓글 등록용
	public Comment(int c_bno, String c_content, int c_unum) {
		super();
		this.c_bno = c_bno;
		this.c_content = c_content;
		this.c_unum = c_unum;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_bno() {
		return c_bno;
	}

	public void setC_bno(int c_bno) {
		this.c_bno = c_bno;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public int getC_unum() {
		return c_unum;
	}

	public void setC_unum(int c_unum) {
		this.c_unum = c_unum;
	}

	public int getC_recno() {
		return c_recno;
	}

	public void setC_recno(int c_recno) {
		this.c_recno = c_recno;
	}

	public int getC_level() {
		return c_level;
	}

	public void setC_level(int c_level) {
		this.c_level = c_level;
	}

	public String getC_utag() {
		return c_utag;
	}

	public void setC_utag(String c_utag) {
		this.c_utag = c_utag;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	
	
	
	
}
