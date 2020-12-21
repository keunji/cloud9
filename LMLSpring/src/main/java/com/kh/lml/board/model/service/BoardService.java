package com.kh.lml.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;
import com.kh.lml.member.model.vo.Member;

public interface BoardService {

	int insertStylePost(Board b);

	int TestMultipart(Board b);

	ArrayList<Board> selectList();

	ArrayList<Board> selectOne(int bnum);

	int getbnum();

	int insertStyleHash(Board bo);

	ArrayList<String> selectHash(int bnum);

	ArrayList<Comment> selectComment(int bnum);

	int addComment(Comment cm);

	int addHeart(Board b);

	ArrayList<Comment> boardHeartList(int unum);

	int deleteHeart(Board b);

	ArrayList<Board> getDetailHeart(int bnum);

	int deleteComment(int cno);

	int getFollowList(Member m);

	int getTagUserNum(String tagUser);

	int insertTagUser(Board bo);
	
	ArrayList<String> UserHash(int bnum);
	
	ArrayList<Board> likePostSelectList();

	Board selectUpdateBoard(int bnum);

	//ArrayList<Board> selectUpdateBoardTag(int bnum);

	ArrayList<Board> getTagUser(int bnum);

	ArrayList<Board> getTag(int bnum);

	int updateStylePost(Board b);

	int deleteStyleHash(int getbnum);

	int deleteStyleUserTag(int getbnum);

	int deleteBoard(int b_num);

}
