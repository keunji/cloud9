package com.kh.lml.qna.Service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;
import com.kh.lml.qna.dao.qnaDao;
import com.kh.lml.qna.vo.qnaBoard;
import com.kh.lml.qna.vo.qnaComment;

@Service("qService")
public class qnaServiceImpl implements qnaService{
	
	@Autowired
	private qnaDao qDao;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertStylePost(qnaBoard q) {
		return qDao.insertStylePost(q);
	}
	@Override
	public int getqnum() {
		return qDao.getqnum();
	}
	@Override
	public int insertStyleHash(qnaBoard qo) {
		return qDao.insertStyleHash(qo);
	}
	@Override
	public ArrayList<qnaBoard> selectList() {
		return qDao.selectList();
	}
	@Override
	public ArrayList<qnaBoard> selectOne(int qnum) {
		return qDao.selectOne(qnum);
	}
	@Override
	public ArrayList<qnaComment> qnaHeartList(int unum) {
		return qDao.qnaHeartList(unum);
	}
	@Override
	public int addHeart(qnaBoard q) {
		return qDao.addHeart(q);
	}
	@Override
	public int deleteHeart(qnaBoard q) {
		return qDao.deleteHeart(q);
	}
	@Override
	public ArrayList<String> selectHash(int qnum) {
		return qDao.selectHash(qnum);
	}
	@Override
	public ArrayList<qnaBoard> getDetailHeart(int qnum) {
		return qDao.getDetailHeart(qnum);
	}
	@Override
	public ArrayList<qnaComment> selectComment(int qnum) {
		return qDao.selectComment(qnum);
	}
	@Override
	public int addComment(qnaComment cm) {
		return qDao.addComment(cm);
	}
	@Override
	public int deleteComment(int cno) {
		return qDao.deleteComment(cno);
	}
}
