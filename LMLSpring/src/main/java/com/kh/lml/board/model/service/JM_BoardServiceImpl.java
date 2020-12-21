package com.kh.lml.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.board.model.dao.JM_BoardDao;
import com.kh.lml.board.model.vo.Board;


@Service("jService")
public class JM_BoardServiceImpl implements JM_BoardService {

	@Autowired
	private JM_BoardDao jDao;

	
	@Override
	public ArrayList<Board> followingpost(int usernum) {
		return jDao.followingpost(usernum);
	}


	@Override
	public ArrayList<Board> bodyselectpost(Map<String, String> map) {
		
		return  jDao.bodyselectpost(map);
	}








	
	
}
