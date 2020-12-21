package com.kh.lml.qna.Service;

import java.util.ArrayList;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;
import com.kh.lml.qna.vo.qnaBoard;
import com.kh.lml.qna.vo.qnaComment;

public interface qnaService {

	int insertStylePost(qnaBoard q);

	int getqnum();

	int insertStyleHash(qnaBoard qo);

	ArrayList<qnaBoard> selectList();

	ArrayList<qnaBoard> selectOne(int qnum);

	ArrayList<qnaComment> qnaHeartList(int unum);

	int addHeart(qnaBoard q);

	int deleteHeart(qnaBoard q);

	ArrayList<String> selectHash(int qnum);

	ArrayList<qnaBoard> getDetailHeart(int qnum);

	ArrayList<qnaComment> selectComment(int qnum);

	int addComment(qnaComment cm);

	int deleteComment(int cno);
}
