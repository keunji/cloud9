package com.kh.lml.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.member.model.vo.ChatLog;
import com.kh.lml.member.model.vo.ChatRoom;
import com.kh.lml.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck",id);
	}
	public Member loginMember(Member m) {
		System.out.println("dao : " + m);
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}
	public int nameCheck(String name) {
		return sqlSession.selectOne("memberMapper.nameCheck",name);
	}
	public int mUpdate(Member m) {
		return sqlSession.update("memberMapper.memberUpdate",m);
	}
	public int pwdCheck(Member m) {
		return sqlSession.selectOne("memberMapper.pwdCheck",m);
	}
	public int changePwd(Member changeM) {
		System.out.println("DDAO : " + changeM);
		return sqlSession.update("memberMapper.pwdChange",changeM);
	}
	public ArrayList<Member> selectFollowList(int uNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowList",uNum);
	}
	public ArrayList<Member> selectFollowerList(int uNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowerList",uNum);
	}
	public ArrayList<Member> selectBlockList(int uNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectBlockList",uNum);
	}
	public int countFollowList(int uNum) {
		return sqlSession.selectOne("memberMapper.countFollowList",uNum);
	}
	public int countFollowerList(int uNum) {
		return sqlSession.selectOne("memberMapper.countFollowerList",uNum);
	}
	public int followBtn(Member f) {
		return sqlSession.insert("memberMapper.followBtn",f);
	}
	public Member fselectUser(int uNum) {
		return sqlSession.selectOne("memberMapper.fselectUser",uNum);
	}
	public int unfollowBtn(Member f) {
		return sqlSession.delete("memberMapper.unfollowBtn",f);
	}
	
	//1113은지
	public ArrayList<Member> searchUserList1(String keyword) {
		return (ArrayList)sqlSession.selectList("memberMapper.searchUserList1", keyword);
	}
	public int searchUserCount(String keyword) {
		return sqlSession.selectOne("memberMapper.searchUserCount",keyword);
	}
	public int mDelete(String id) {
		return sqlSession.update("memberMapper.deleteMember",id);
	}
	public Member nloginMember(String id) {
		return sqlSession.selectOne("memberMapper.nloginMember",id);
	}
	public int nInsertMember(Member m) {

		return sqlSession.insert("memberMapper.nInsertMember",m);
	}
	public int finduNum(String id) {
	
		return sqlSession.selectOne("memberMapper.finduNum",id);
	}
	//1113은지
	public Member userPage(String id) {
	
		return sqlSession.selectOne("memberMapper.finduserPage",id);
		
	}
	public ArrayList<ChatRoom> messageList(String id) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.messageList",id);
	}
	public ArrayList<ChatLog> chatLog(String chatid) {
		return (ArrayList)sqlSession.selectList("memberMapper.chatLog",chatid);
	}
	public int boardCount(int uNum) {
		
		return sqlSession.selectOne("memberMapper.boardCount", uNum);
	}
	public String findRoom(Map<String, String> map) {
	 return sqlSession.selectOne("memberMapper.findRoom", map);
	}
	public int newRoom(Map<String, String> map) {
		
		return sqlSession.insert("memberMapper.newRoom",map);
	}
	
	public String recentChat(String chatroomid) {
	
		return sqlSession.selectOne("memberMapper.recentChat",chatroomid);
	}
	public int chatAlram(Map<String, String> map) {
		return sqlSession.update("memberMapper.chatAlram",map);
	}
	public ArrayList<Board> myPost(int uNum) {
		
		return (ArrayList)sqlSession.selectList("jm-board-mapper.myPost",uNum);
	}
	public int checkChat(Map<String, String> map) {
		return sqlSession.update("memberMapper.checkChat",map);
	}
	public ArrayList<Member> tagList(String keyword) {
		
		return (ArrayList)sqlSession.selectList("jm-board-mapper.tagPost",keyword);
	}
	public int tagcount(String keyword) {
		return sqlSession.selectOne("jm-board-mapper.postCount",keyword);
		
	}
	public ArrayList<Integer> coupleFine(int uNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.coupleFind", uNum);
	}
	public int deleteChat(String roomid) {
		return sqlSession.delete("memberMapper.deleteChat", roomid);
	}
	public int deleteChatLog(String roomid) {
		return sqlSession.delete("memberMapper.deleteChatLog",roomid);
	}
	public int deleteBoard(int uNum) {
		return sqlSession.delete("memberMapper.deleteBoard",uNum);
	}
	public int deleteComment(int uNum) {
		return sqlSession.delete("memberMapper.deleteComment",uNum);
	}

public int alalarm(String id) {
		
		if(sqlSession.selectOne("memberMapper.alalarm",id)==null) {
			return 0;
		}else {
			return sqlSession.selectOne("memberMapper.alalarm",id);
		}
	}
	public ArrayList<ChatRoom> chatList(String id) {
		return (ArrayList)sqlSession.selectList("memberMapper.chatList",id);
	}
	public ArrayList<Board> mytagPost(int uNum) {
		return (ArrayList)sqlSession.selectList("jm-board-mapper.mytagPost",uNum);
	}
	public Member upGetFollow(Member m) {
		return sqlSession.selectOne("memberMapper.upGetFollow",m);
	}
	public int blockBtn(Member m) {
		return sqlSession.update("memberMapper.blockBtn",m);
	}
	public int newBlockBtn(Member m) {
		return sqlSession.update("memberMapper.newBlockBtn",m);
	}
	public int unBlockBtn(Member m) {
		return sqlSession.update("memberMapper.unBlockBtn",m);
	}
	public ArrayList<Integer> loginUserFollowList(int loginUserNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.loginUserFollowList",loginUserNum);
	}

}
