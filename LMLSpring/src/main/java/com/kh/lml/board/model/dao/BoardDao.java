package com.kh.lml.board.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.board.model.vo.Comment;
import com.kh.lml.member.model.vo.Member;

@Repository("bDao")
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 포스트 업로드
	public int insertStylePost(Board b) {
		return sqlSession.insert("boardMapper.insertStylePost", b);
	}

	// 업로드 테스트용
	public int TestMultipart(Board b) {
		return sqlSession.insert("boardMapper.testMultipart", b);
	}

	// 전체 글 리스트
	public ArrayList<Board> selectList() {
		return (ArrayList)sqlSession.selectList("boardMapper.selectList");
	}

	public ArrayList<Board> selectOne(int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectOne",bnum);
	}

	public int getbnum() {
		return sqlSession.selectOne("boardMapper.getbnum");
	}

	public int insertStyleHash(Board bo) {
		return sqlSession.insert("boardMapper.insertStyleHash", bo);
	}

	public ArrayList<String> selectHash(int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectHash",bnum);
	}

	public ArrayList<String> getUserHash(int bnum) {
	
		return (ArrayList)sqlSession.selectList("boardMapper.getTagUser", bnum);
	}
	
	
	
	
	
	

	public ArrayList<Comment> selectComment(int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectComment",bnum);
	}

	// 댓글등록
	public int addComment(Comment cm) {
		return sqlSession.insert("boardMapper.addComment", cm);
	}

	public int addHeart(Board b) {
		return sqlSession.insert("boardMapper.addHeart", b);
	}

	public ArrayList<Comment> boardHeartList(int unum) {
		return (ArrayList)sqlSession.selectList("boardMapper.boardHeartList",unum);
	}

	public int deleteHeart(Board b) {
		return sqlSession.delete("boardMapper.deleteHeart", b);
	}

	public ArrayList<Board> getDetailHeart(int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.getDetailHeart",bnum);
	}

	public int deleteComment(int cno) {
		return sqlSession.delete("boardMapper.deleteComment",cno);
	}

	public int getFollowList(Member m) {
		return sqlSession.selectOne("memberMapper.getFollowList",m);
	}

	public int getTagUserNum(String tagUser) {
		
		if(sqlSession.selectOne("boardMapper.getTagUserNum",tagUser)==null) {
		return 0;
		}
		else {
			return sqlSession.selectOne("boardMapper.getTagUserNum",tagUser);
		}
	}

	public int insertTagUser(Board bo) {
		return sqlSession.insert("boardMapper.insertTagUser", bo);
	}

	public ArrayList<Board> likePostSelectList() {
		return (ArrayList)sqlSession.selectList("boardMapper.likePostSelectList");
	}

	public Board selectUpdateBoard(int bnum) {
	      return sqlSession.selectOne("boardMapper.selectUpdateBoard",bnum);
	   }

//	public ArrayList<Board> selectUpdateBoardTag(int bnum) {
//		return (ArrayList)sqlSession.selectList("boardMapper.selectUpdateBoardTag",bnum);
//	}

	public ArrayList<Board> getTagUser(int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectUpdateBoardUserTag",bnum);
	}

	public ArrayList<Board> getTag(int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectUpdateBoardTag",bnum);
	}

	public int updateSyltePost(Board b) {
		System.out.println(b.toString());
		return sqlSession.update("boardMapper.updateSyltePost",b);
	}

	public int deleteStyleHash(int getbnum) {
		return sqlSession.delete("boardMapper.deleteStyleHash",getbnum);
	}

	public int deleteStyleUserTag(int getbnum) {
		return sqlSession.delete("boardMapper.deleteStyleUserTag",getbnum);
	}

	public int deleteBoard(int b_num) {
		return sqlSession.delete("boardMapper.deleteBoard",b_num);
	}





}
