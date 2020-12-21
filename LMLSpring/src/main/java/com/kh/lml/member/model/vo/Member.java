package com.kh.lml.member.model.vo;

public class Member {
	private String id;
	private String mail;
	private String upwd;
	private int m_phone;
	private int height;
	private int weight;
	private char gender;
	private String uname;
	private String intro;
	private String profile_img;
	private String rename_profile_img;
	
	private int user_num;
	private char del_flag;
	
	private int from_follow;
	private int to_follow;
	private int to_follower;
	private int from_follower;
	private char f_block;
	
	private String btn;
	
//	gdENs
	public Member() {
		super();
	}
	
	
	
	public Member(String id, String mail, String upwd, int m_phone, int height, int weight, char gender, String uname) {
		super();
		this.id = id;
		this.mail = mail;
		this.upwd = upwd;
		this.m_phone = m_phone;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.uname = uname;
	}





	public Member(String id, String mail, String upwd, int m_phone, int height, int weight, char gender, String uname,
			String intro, String profile_img, int user_num) {
		super();
		this.id = id;
		this.mail = mail;
		this.upwd = upwd;
		this.m_phone = m_phone;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.uname = uname;
		this.intro = intro;
		this.profile_img = profile_img;
		this.user_num = user_num;
	}


	//비밀번호 체크용
	public Member(String id, String upwd) {
		super();
		this.id = id;
		this.upwd = upwd;
	}
	
	
	//팔로잉 조회용
	public Member(String id, String uname, String profile_img, int from_follow, int to_follow, int to_follower,
			int from_follower, char f_block) {
		super();
		this.id = id;
		this.uname = uname;
		this.profile_img = profile_img;
		this.from_follow = from_follow;
		this.to_follow = to_follow;
		this.to_follower = to_follower;
		this.from_follower = from_follower;
		this.f_block = f_block;
	}
	
	// 팔로우용
	public Member(int from_follow, int to_follow) {
		super();
		this.from_follow = from_follow;
		this.to_follow = to_follow;
	}

	
	
	public Member(String id, String mail, String upwd, int m_phone, int height, int weight, char gender, String uname,
			String intro, String profile_img, int user_num, char del_flag, int from_follow, int to_follow,
			int to_follower, int from_follower, char f_block) {
		super();
		this.id = id;
		this.mail = mail;
		this.upwd = upwd;
		this.m_phone = m_phone;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.uname = uname;
		this.intro = intro;
		this.profile_img = profile_img;
		this.user_num = user_num;
		this.del_flag = del_flag;
		this.from_follow = from_follow;
		this.to_follow = to_follow;
		this.to_follower = to_follower;
		this.from_follower = from_follower;
		this.f_block = f_block;
	}

	

	public Member(String id, String mail, String upwd, int m_phone, int height, int weight, char gender, String uname,
			String intro, String profile_img, String rename_profile_img, int user_num, char del_flag, int from_follow,
			int to_follow, int to_follower, int from_follower, char f_block) {
		super();
		this.id = id;
		this.mail = mail;
		this.upwd = upwd;
		this.m_phone = m_phone;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.uname = uname;
		this.intro = intro;
		this.profile_img = profile_img;
		this.rename_profile_img = rename_profile_img;
		this.user_num = user_num;
		this.del_flag = del_flag;
		this.from_follow = from_follow;
		this.to_follow = to_follow;
		this.to_follower = to_follower;
		this.from_follower = from_follower;
		this.f_block = f_block;
	}



	public Member(String id, String mail, String upwd, int m_phone, int height, int weight, char gender, String uname,
			String intro, String profile_img, String rename_profile_img, int user_num, char del_flag, int from_follow,
			int to_follow, int to_follower, int from_follower, char f_block, String btn) {
		super();
		this.id = id;
		this.mail = mail;
		this.upwd = upwd;
		this.m_phone = m_phone;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
		this.uname = uname;
		this.intro = intro;
		this.profile_img = profile_img;
		this.rename_profile_img = rename_profile_img;
		this.user_num = user_num;
		this.del_flag = del_flag;
		this.from_follow = from_follow;
		this.to_follow = to_follow;
		this.to_follower = to_follower;
		this.from_follower = from_follower;
		this.f_block = f_block;
		this.btn = btn;
	}



	public String getProfile_img() {
		return profile_img;
	}



	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}




	public int getUser_num() {
		return user_num;
	}



	public String getRename_profile_img() {
		return rename_profile_img;
	}



	public void setRename_profile_img(String rename_profile_img) {
		this.rename_profile_img = rename_profile_img;
	}



	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getMail() {
		return mail;
	}



	public void setMail(String mail) {
		this.mail = mail;
	}



	public String getUpwd() {
		return upwd;
	}



	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}



	public int getM_phone() {
		return m_phone;
	}



	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}



	public int getHeight() {
		return height;
	}



	public void setHeight(int height) {
		this.height = height;
	}



	public int getWeight() {
		return weight;
	}



	public void setWeight(int weight) {
		this.weight = weight;
	}



	public char getGender() {
		return gender;
	}



	public void setGender(char gender) {
		this.gender = gender;
	}



	public String getUname() {
		return uname;
	}



	public void setUname(String uname) {
		this.uname = uname;
	}



	public String getIntro() {
		return intro;
	}



	public void setIntro(String intro) {
		this.intro = intro;
	}


	public int getFrom_follow() {
		return from_follow;
	}



	public void setFrom_follow(int from_follow) {
		this.from_follow = from_follow;
	}



	public int getTo_follow() {
		return to_follow;
	}



	public void setTo_follow(int to_follow) {
		this.to_follow = to_follow;
	}



	public int getTo_follower() {
		return to_follower;
	}



	public void setTo_follower(int to_follower) {
		this.to_follower = to_follower;
	}



	public int getFrom_follower() {
		return from_follower;
	}



	public void setFrom_follower(int from_follower) {
		this.from_follower = from_follower;
	}



	public char getF_block() {
		return f_block;
	}



	public void setF_block(char f_block) {
		this.f_block = f_block;
	}



	public char getDel_flag() {
		return del_flag;
	}



	public void setDel_flag(char del_flag) {
		this.del_flag = del_flag;
	}



	public String getBtn() {
		return btn;
	}



	public void setBtn(String btn) {
		this.btn = btn;
	}



	@Override
	public String toString() {
		return "Member [id=" + id + ", mail=" + mail + ", upwd=" + upwd + ", m_phone=" + m_phone + ", height=" + height
				+ ", weight=" + weight + ", gender=" + gender + ", uname=" + uname + ", intro=" + intro
				+ ", profile_img=" + profile_img + ", rename_profile_img=" + rename_profile_img + ", user_num="
				+ user_num + ", del_flag=" + del_flag + ", from_follow=" + from_follow + ", to_follow=" + to_follow
				+ ", to_follower=" + to_follower + ", from_follower=" + from_follower + ", f_block=" + f_block
				+ ", btn=" + btn + "]";
	}







	
}
