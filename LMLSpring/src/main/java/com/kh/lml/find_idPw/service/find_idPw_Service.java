package com.kh.lml.find_idPw.service;

public interface find_idPw_Service {
	String find_namePhone(String findname, String findphone);

	String find_nameEmail(String findname, String findEmail);

	int find_PwIdEmail(String id, String e_mail);

	int chang_PwIdEmail(String pw, String id, String e_mail);
}
