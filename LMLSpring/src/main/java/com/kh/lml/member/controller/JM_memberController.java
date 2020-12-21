package com.kh.lml.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonIOException;
import com.kh.lml.board.model.vo.Board;
import com.kh.lml.member.model.service.MemberService;
import com.kh.lml.member.model.vo.Member;

@Controller
public class JM_memberController {
	@Autowired
	private MemberService mService;

	@ResponseBody
	@RequestMapping("werlist.do")
	private ArrayList<Member> werlist(String id) {
		int uNum = mService.finduNum(id);

		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Integer> couple = mService.coupleFind(uNum);

		for(Member a : FollowerList) {
			a.setBtn("button2");
			for(int b : couple) {
				if(a.getFrom_follower()== b) {
					a.setBtn("button1");
				}


			}

		}
		return FollowerList;

	}


	@ResponseBody
	@RequestMapping("userwerlist.do")
	private ArrayList<Member> userwerlist(String id,int loginUserNum) {
		int uNum = mService.finduNum(id);

		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);




		ArrayList<Integer> loginUserFollowList = mService.loginUserFollowList(loginUserNum);
		System.out.println("loguserFollowLsit : "  + loginUserFollowList);
		for(Member a : FollowerList) {
			a.setBtn("button2");
			for(int b : loginUserFollowList) {
				if(a.getFrom_follower()== b) {
					a.setBtn("button1");
				}


			}

		}
		return FollowerList;

	}


	@ResponseBody
	@RequestMapping("woolist.do")
	private ArrayList<Member> woolist(String id) {
		int uNum = mService.finduNum(id);

		ArrayList<Member> FollowooList = mService.selectFollowList(uNum);

		ArrayList<Integer> couple = mService.coupleFind(uNum);
		System.out.println(couple);

		for(Member a : FollowooList) {
			a.setBtn("button1");
		}

		return FollowooList;
	}

	@ResponseBody
	@RequestMapping("userwoolist.do")
	private ArrayList<Member> userwoolist(String id,int loginUserNum) {
		int uNum = mService.finduNum(id);

		ArrayList<Member> FollowooList = mService.selectFollowList(uNum);

		ArrayList<Integer> loginUserFollowList = mService.loginUserFollowList(loginUserNum);
		
		
		System.out.println("loguserFollowLsit : "  + loginUserFollowList);
		System.out.println("FollowooList : " + FollowooList);
		for(Member a : FollowooList) {
			a.setBtn("button2");
			for(int b : loginUserFollowList) {
				if(a.getTo_follow()== b) {
					a.setBtn("button1");
				}


			}

		}

		return FollowooList;
	}



	@RequestMapping("userPage.do")
	private String userPage(String id, Model model ,int p) {
		Member m = mService.userPage(id);

		int uNum = mService.finduNum(id);
		int Follow = mService.countFollowList(uNum);
		int Follower = mService.countFollowerList(uNum);
		/*ArrayList<Board> list = mService.myPost(uNum);*/
		int boardCount =mService.boardCount(uNum);

		if(p ==1) {
			ArrayList<Board> list = mService.myPost(uNum);
			model.addAttribute("Userboardlist", list);
			System.out.println("유저태그 포스트 안드러오나");
		}else if(p ==2) {
			System.out.println("유저태그 포스트 들어오나");
			ArrayList<Board> list = mService.usertagPost(uNum);
			model.addAttribute("Userboardlist", list);
				
		}
		
		if (m != null) {
			 
			
			
			/* model.addAttribute("Userboardlist", list); */
			model.addAttribute("User", m);
			model.addAttribute("Follow", Follow);
			model.addAttribute("Follower", Follower);
			model.addAttribute("boardCount", boardCount);

			/* System.out.println("Userboardlist : " + list); */
			System.out.println("User : " + m);
			System.out.println("Follow : " + Follow);
			System.out.println("Follower : " + Follower);
			System.out.println("boardCount : " + boardCount);

			return "jiman/lml_UserPage";
		} else {
			model.addAttribute("msg", "바보야 유저 없다");
			return "common/errorPage";
		}

	}


	@RequestMapping("SearchUser.do") 
	public ModelAndView Search(ModelAndView mv,String keyword) {
		ArrayList<Member> SearchUser = mService.searchUserList1(keyword); 
		int userCount = mService.searchUserCount(keyword);

		mv.addObject("searchUser", SearchUser); 
		mv.addObject("userCount",userCount);

		mv.setViewName("search/lml_search_user");

		return mv; 

	}


	@RequestMapping("toMessage.do")
	public String toMessage(String toid, String fromid,Model model) {
		System.out.println("toid?: "+toid +", from?: "+fromid);
		Map<String, String> map = new HashMap<String, String>();
		map.put("toid",toid);
		map.put("fromid",fromid);
		map.put("newroomid",toid+fromid);
		String chatRoom =mService.findRoom(map);

		if(chatRoom != null) {
			return "redirect:Message.do?id=" + fromid;
		}else {
			int result = mService.newRoom(map);
			if(result > 1) {

				return "redirect:Message.do?id=" + fromid;
			}
			else {
				model.addAttribute("msg","잘못");

				return "common/errorPage";
			}
		}


	}



	@RequestMapping("Search.do")
	public ModelAndView Search1(ModelAndView mv, String keyword,HttpServletRequest request) {

		// ArrayList<Member> SearchBoard = mService.searchBoardList(keyword);
		ArrayList<Member> SearchUser = mService.searchUserList1(keyword);
		ArrayList<Member> tagPost = mService.tagList1(keyword);
		int userCount = mService.searchUserCount(keyword);
		int tagCount = mService.searchtagCount(keyword);

		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int uNum = 0;
		if(loginUser != null) {
			uNum = loginUser.getUser_num();
		}
		//int uNum = loginUser.getUser_num();
		System.out.println("로그인 유저 넘버 : " + uNum);
		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		System.out.println(FollowList);
		// 6명만 나옴. 
		// 회원번호, 사진, 아이디, 이름, 팔로우 여부(팔로우 했으면 X, 팔로우 아니면 팔로우 버튼 나오게) -팔로우 버튼 눌렀을 시 팔로우.do
		// 팔로우 여부는 ajax로 하자..


		mv.addObject("followlist",FollowList);
		mv.addObject("searchUser", SearchUser);
		mv.addObject("userCount",userCount);
		mv.addObject("keyword", keyword);
		mv.addObject("tagpost", tagPost);
		mv.addObject("tagCount", tagCount);
		mv.setViewName("search/lml_search");

		return mv;
	}
	


}
