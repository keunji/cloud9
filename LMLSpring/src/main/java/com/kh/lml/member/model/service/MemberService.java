package com.kh.lml.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.lml.board.model.vo.Board;
import com.kh.lml.member.model.vo.ChatLog;
import com.kh.lml.member.model.vo.ChatRoom;
import com.kh.lml.member.model.vo.Member;

public interface MemberService {
	//회원가입
	int insertMember(Member m);

	//아이디중복체크
	int idCheck(String id);

	Member loginMember(Member m);

	int nameCheck(String name);

	int mUpdate(Member m);

	int pwdCheck(Member m);

	int changePwd(Member changeM);

	ArrayList<Member> selectFollowList(int uNum);

	ArrayList<Member> selectFollowerList(int uNum);

	ArrayList<Member> selectBlockList(int uNum);

	int countFollowList(int uNum);

	int countFollowerList(int uNum);

	int followBtn(Member f);

	Member fselectUser(int uNum);

	int unfollowBtn(Member f);

	//1113은지
	ArrayList<Member> searchUserList1(String keyword);

	int searchUserCount(String keyword);

	int mDelete(String id);

	Member nloginMember(String id);

	int nInsertMember(Member m);

	int finduNum(String id);

	Member userPage(String id);

	ArrayList<ChatRoom> messageList(String id);

	ArrayList<ChatLog> chatLog(String chatid);

	int boardCount(int uNum);

	String findRoom(Map<String, String> map);

	int newRoom(Map<String, String> map);


	String recentChat(String chatroomid);

	int chatAlram(Map<String, String> map);

	ArrayList<Board> myPost(int uNum);

	int checkChat(Map<String, String> map);

	ArrayList<Member> tagList1(String keyword);

	int searchtagCount(String keyword);

	ArrayList<Integer> coupleFind(int uNum);

	int deleteChat(String roomid);

	int deleteChatLog(String roomid);

	int boardDelete(int uNum);

	int commentDelete(int uNum);

	int alalarm(String id);

	ArrayList<ChatRoom> chatList(String id);

	ArrayList<Board> mytagPost(int uNum);

	Member upGetFollow(Member m);

	int blockBtn(Member m);

	int newBlockBtn(Member m);

	int unBlockBtn(Member m);

	ArrayList<Integer> loginUserFollowList(int loginUserNum);

	ArrayList<Board> usertagPost(int uNum);

	



	//1113은지




}
