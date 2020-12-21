package com.kh.lml.qna.vo;

import java.sql.Date;
import java.util.Arrays;

public class qnaBoard {
	private int q_num;
	private int q_user_num;
	private String q_images;
	private String q_content;
	private String q_status;
	private Date q_date;
	private String q_profile_img;
	private int q_user_height;
	private int q_user_weight;
	private String q_user_id;
	private String q_name;
	private String q_hash;
	private String[] q_hashtag;
	

	private String originalFileName;
	private String renameFileName;
	
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	
	private int h_bnum;
	private int h_unum;
	
	public qnaBoard(int q_num, int q_user_num, String q_content, String q_status, Date q_date, String image1,
			String image2, String image3, String image4, String image5) {
		super();
		this.q_num = q_num;
		this.q_user_num = q_user_num;
		this.q_content = q_content;
		this.q_status = q_status;
		this.q_date = q_date;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
	}
	
	public qnaBoard() {
		super();
	}

	


	public qnaBoard(int q_num, int q_user_num, String q_images, String q_content, String q_status, Date q_date,
			String q_profile_img, int q_user_height, int q_user_weight, String q_user_id, String q_name, String q_hash,
			String[] q_hashtag, String originalFileName, String renameFileName, String image1, String image2,
			String image3, String image4, String image5, int h_bnum, int h_unum) {
		super();
		this.q_num = q_num;
		this.q_user_num = q_user_num;
		this.q_images = q_images;
		this.q_content = q_content;
		this.q_status = q_status;
		this.q_date = q_date;
		this.q_profile_img = q_profile_img;
		this.q_user_height = q_user_height;
		this.q_user_weight = q_user_weight;
		this.q_user_id = q_user_id;
		this.q_name = q_name;
		this.q_hash = q_hash;
		this.q_hashtag = q_hashtag;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.h_bnum = h_bnum;
		this.h_unum = h_unum;
	}




	




	public qnaBoard(int q_user_num, String q_content, String image1, String image2, String image3, String image4,
			String image5) {
		super();
		this.q_user_num = q_user_num;
		this.q_content = q_content;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
	}


	public qnaBoard(int q_num, String[] q_hashtag) {
		super();
		this.q_num = q_num;
		this.q_hashtag = q_hashtag;
	}
	
	// 좋아요
	public qnaBoard(int h_bnum, int h_unum) {
		super();
		this.h_bnum = h_bnum;
		this.h_unum = h_unum;
	}




	public int getq_num() {
		return q_num;
	}

	public void setq_num(int q_num) {
		this.q_num = q_num;
	}

	public int getq_user_num() {
		return q_user_num;
	}

	public void setq_user_num(int q_user_num) {
		this.q_user_num = q_user_num;
	}

	public String getq_images() {
		return q_images;
	}

	public void setq_images(String q_images) {
		this.q_images = q_images;
	}

	public String getq_content() {
		return q_content;
	}

	public void setq_content(String q_content) {
		this.q_content = q_content;
	}

	public String[] getq_hashtag() {
		return q_hashtag;
	}


	public void setq_hashtag(String[] q_hashtag) {
		this.q_hashtag = q_hashtag;
	}

	public String getq_status() {
		return q_status;
	}

	public void setq_status(String q_status) {
		this.q_status = q_status;
	}

	public Date getq_date() {
		return q_date;
	}

	public void setq_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getq_profile_img() {
		return q_profile_img;
	}

	public void setq_profile_img(String q_profile_img) {
		this.q_profile_img = q_profile_img;
	}

	public int getq_user_height() {
		return q_user_height;
	}

	public void setq_user_height(int q_user_height) {
		this.q_user_height = q_user_height;
	}

	public int getq_user_weight() {
		return q_user_weight;
	}

	public void setq_user_weight(int q_user_weight) {
		this.q_user_weight = q_user_weight;
	} 	

	public String getq_user_id() {
		return q_user_id;
	}

	public void setq_user_id(String q_user_id) {
		this.q_user_id = q_user_id;
	}

	public String getq_name() {
		return q_name;
	}

	public void setq_name(String q_name) {
		this.q_name = q_name;
	}

	public String getq_hash() {
		return q_hash;
	}

	public void setq_hash(String q_hash) {
		this.q_hash = q_hash;
	}

	public int getH_bnum() {
		return h_bnum;
	}


	public void setH_bnum(int h_bnum) {
		this.h_bnum = h_bnum;
	}


	public int getH_unum() {
		return h_unum;
	}


	public void setH_unum(int h_unum) {
		this.h_unum = h_unum;
	}

	@Override
	public String toString() {
		return "qnaBoard [q_num=" + q_num + ", q_user_num=" + q_user_num + ", q_images=" + q_images + ", q_content="
				+ q_content + ", q_status=" + q_status + ", q_date=" + q_date + ", q_profile_img=" + q_profile_img
				+ ", q_user_height=" + q_user_height + ", q_user_weight=" + q_user_weight + ", q_user_id=" + q_user_id
				+ ", q_name=" + q_name + ", q_hash=" + q_hash + ", q_hashtag=" + Arrays.toString(q_hashtag)
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + ", image1=" + image1
				+ ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4 + ", image5=" + image5
				+ ", h_bnum=" + h_bnum + ", h_unum=" + h_unum + "]";
	}
	
}