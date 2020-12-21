package com.kh.lml.find_idPw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.find_idPw.dao.find_idPw_Dao;

@Service("fipService")
public class find_idPw_ServiceImpl implements find_idPw_Service{
	@Autowired
	private find_idPw_Dao fipDao;

	@Override
	public String find_namePhone(String findname, String findphone) {
		return fipDao.findNamePhone(findname, findphone);
	}

	@Override
	public String find_nameEmail(String findname, String findEmail) {
		return fipDao.findNameEmail(findname, findEmail);
	}

	@Override
	public int find_PwIdEmail(String id, String e_mail) {
		return fipDao.findPwIdEmail(id,e_mail);
	}

	@Override
	public int chang_PwIdEmail(String pw, String id, String e_mail) {
		return fipDao.chang_PwIdEmail(pw,id,e_mail);
	}
}