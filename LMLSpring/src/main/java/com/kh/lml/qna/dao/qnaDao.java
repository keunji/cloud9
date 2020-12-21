package com.kh.lml.qna.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;
import com.kh.lml.qna.vo.qnaBoard;
import com.kh.lml.qna.vo.qnaComment;

@Repository("qDao")
public class qnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertStylePost(qnaBoard q) {
		return sqlSession.insert("qnaMapper.insertQnaPost", q);
	}

	public int getqnum() {
		return sqlSession.selectOne("qnaMapper.getqnum");
	}

	public int insertStyleHash(qnaBoard qo) {
		return sqlSession.insert("qnaMapper.insertStyleHash", qo);
	}

	public ArrayList<qnaBoard> selectList() {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList");
	}

	public ArrayList<qnaBoard> selectOne(int qnum) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectOne",qnum);
	}

	public ArrayList<qnaComment> qnaHeartList(int unum) {
		return (ArrayList)sqlSession.selectList("qnaMapper.qnaHeartList",unum);
	}

	public int addHeart(qnaBoard q) {
		return sqlSession.insert("qnaMapper.addHeart", q);
	}

	public int deleteHeart(qnaBoard q) {
		return sqlSession.insert("qnaMapper.deleteHeart", q);
	}

	public ArrayList<String> selectHash(int qnum) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectHash",qnum);
	}

	public ArrayList<qnaBoard> getDetailHeart(int qnum) {
		return (ArrayList)sqlSession.selectList("qnaMapper.getDetailHeart",qnum);
	}

	public ArrayList<qnaComment> selectComment(int qnum) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectComment",qnum);
	}

	public int addComment(qnaComment cm) {
		return sqlSession.insert("qnaMapper.addComment", cm);
	}

	public int deleteComment(int cno) {
		return sqlSession.update("qnaMapper.deleteComment",cno);
	}
}
