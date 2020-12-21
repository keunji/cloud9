package com.kh.lml.board.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lml.board.model.vo.Board;


@Repository("jDao")
public class JM_BoardDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Board> followingpost(int usernum) {
		return (ArrayList)sqlSession.selectList("jm-board-mapper.followingpost",usernum);
	}



	public ArrayList<Board> bodyselectpost(Map<String, String> map) {
		System.out.println("??");
		return (ArrayList)sqlSession.selectList("jm-board-mapper.bodyselectpost",map);
	}
	

	}


