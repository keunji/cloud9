package com.kh.lml.qna.vo;

import java.sql.Date;

public class qnaComment {
	private int cq_no;
	private int cq_bno;
	private String cq_content;
	private int cq_unum;
	private int cq_recno;
	private int cq_level;
	private String cq_utag;
	private Date cq_date;
	private String uname;
	private String profile;
	
	public qnaComment() {
		super();
	}

	public qnaComment(int cq_no, int cq_bno, String cq_content, int cq_unum, int cq_recno, int cq_level, String cq_utag,
			Date cq_date, String uname, String profile) {
		super();
		this.cq_no = cq_no;
		this.cq_bno = cq_bno;
		this.cq_content = cq_content;
		this.cq_unum = cq_unum;
		this.cq_recno = cq_recno;
		this.cq_level = cq_level;
		this.cq_utag = cq_utag;
		this.cq_date = cq_date;
		this.uname = uname;
		this.profile = profile;
	}



	// 댓글 등록용
	public qnaComment(int cq_bno, String cq_content, int cq_unum) {
		super();
		this.cq_bno = cq_bno;
		this.cq_content = cq_content;
		this.cq_unum = cq_unum;
	}

	public int getcq_no() {
		return cq_no;
	}

	public void setcq_no(int cq_no) {
		this.cq_no = cq_no;
	}

	public int getcq_bno() {
		return cq_bno;
	}

	public void setcq_bno(int cq_bno) {
		this.cq_bno = cq_bno;
	}

	public String getcq_content() {
		return cq_content;
	}

	public void setcq_content(String cq_content) {
		this.cq_content = cq_content;
	}

	public int getcq_unum() {
		return cq_unum;
	}

	public void setcq_unum(int cq_unum) {
		this.cq_unum = cq_unum;
	}

	public int getcq_recno() {
		return cq_recno;
	}

	public void setcq_recno(int cq_recno) {
		this.cq_recno = cq_recno;
	}

	public int getcq_level() {
		return cq_level;
	}

	public void setcq_level(int cq_level) {
		this.cq_level = cq_level;
	}

	public String getcq_utag() {
		return cq_utag;
	}

	public void setcq_utag(String cq_utag) {
		this.cq_utag = cq_utag;
	}

	public Date getcq_date() {
		return cq_date;
	}

	public void setcq_date(Date cq_date) {
		this.cq_date = cq_date;
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

	
	
	
	
}
