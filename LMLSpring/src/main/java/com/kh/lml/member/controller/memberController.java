package com.kh.lml.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.lml.board.model.vo.Board;
import com.kh.lml.member.model.service.MemberService;
import com.kh.lml.member.model.vo.ChatLog;
import com.kh.lml.member.model.vo.ChatRoom;
import com.kh.lml.member.model.vo.Member;


@SessionAttributes("loginUser") // Model에 loginUser라는 키값으로 객체가 추가되면 자동으로 세션에추가하라는 의미의 어노테이션
@Controller
public class memberController {

	@Autowired
	private MemberService mService;



	// 로그아웃(임시로 만들어놓음)
	@RequestMapping("Logout.do")
	public String Logout() {
		return "logout/lml_logout";
	}
	// 로그인페이지
	@RequestMapping("login.do")
	public String login() {
		return "jiman/lml_login";
	}
	// 마이페이지
	@RequestMapping("MyPage.do")
	public ModelAndView myPage(ModelAndView mv, int uNum ,int page) {

		
	
		if(page ==1) {
			ArrayList<Board> list = mService.myPost(uNum);
			mv.addObject("Myboardlist", list);
			System.out.println("태그 포스트 안드러오나");
		}else if(page ==2) {
			System.out.println("태그 포스트 들어오나");
			ArrayList<Board> list = mService.mytagPost(uNum);
			mv.addObject("Myboardlist", list);
		}


		int Follow = mService.countFollowList(uNum);
		int Follower = mService.countFollowerList(uNum);

		int myboardCount = mService.boardCount(uNum);
		mv.addObject("Follow", Follow);
		mv.addObject("Follower", Follower);
		mv.addObject("boardCount", myboardCount);
		
		
		mv.setViewName("jiman/lml_MyPage");


		return mv;
	}
	// 세팅(정보수정)
	@RequestMapping("Settings.do")
	public String setting() {
		return "settings/lml_Settings";
	}
	// 세팅2(비번수정)	
	@RequestMapping("Settings2.do")
	public String setting2() {
		return "settings/lml_Settings_2";
	}
	// 세팅3(이메일문의)
	@RequestMapping("Settings3.do")
	public String setting3() {
		return "settings/lml_Settings_3";
	}
	// 세팅4(탈퇴)
	@RequestMapping("Settings4.do")
	public String setting4() {
		return "settings/lml_Settings_4";
	}

	// 채팅
	@RequestMapping("Message.do")
	public String Message(String id,Model model) {
		System.out.println("message id : " + id);

		ArrayList<ChatRoom> messageList = mService.messageList(id);

		for(int i = 0 ; i < messageList.size();i++) {
			messageList.get(i).setRecentChat(textLengthOverCut(mService.recentChat(messageList.get(i).getChatroomid()), 5, "..."));
		}


		System.out.println("messageListsize" + messageList.size());
		if(messageList.size()>0) {
			for(ChatRoom a : messageList) {
				System.out.println("gd : " + a);
			}
			model.addAttribute("messageList",messageList);
			return "message/lml_message";
		}else {

			System.out.println("친구 목록없음");

			return "message/lml_message";
		}



	}



	private String textLengthOverCut(String txt,int len,String lastTxt) {
		if(txt!=null) {
			if (txt.length()> len) {
				txt = txt.substring(0,len) + lastTxt;
			}
		}
		return txt;
	}



	@ResponseBody
	@RequestMapping("chatLogin.do")
	public ArrayList<ChatRoom> chatLogin(String id){

		ArrayList<ChatRoom> chatRoomList = mService.chatList(id);




		return chatRoomList;
	}





	/**
	 * 아이디 중복체크
	 *  @ResponseBody를사용
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id){
		System.out.println(id);
		int result = mService.idCheck(id);

		if(result > 0) { // 중복 존재
			return "fail";
		}else {
			return "ok";
		}
	}

	@ResponseBody
	@RequestMapping("nameCheck.do")
	public String nameCheck(String name) {
		System.out.println(name);
		int result = mService.nameCheck(name);

		if(result >0) {
			return "fail";
		}else {
			return "ok";
		}


	}

	// 글쓰기
	@RequestMapping("PostStyle.do")
	public String PostStyle() {
		return "post/lml_post_style";
	}

	@RequestMapping("PostQna.do")
	public String PostQna() {
		return "post/lml_post_qna";
	}

	@RequestMapping("mInsert.do")
	public String mInsert(Member m,Model model) {

		System.out.println(m);
		int result = mService.insertMember(m);
		if(result>0) {
			return "redirect:login.do";
		}
		else {
			model.addAttribute("msg","회원가입실패");
			return "common/errorpage";
		}

	}

	@RequestMapping(value="mLogin.do",method=RequestMethod.POST)
	public String mLogin(Member m,Model model,HttpSession session) {
		System.out.println(m);
		Member loginUser = mService.loginMember(m);
		System.out.println(loginUser);
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:Index.do";

		}else {
			model.addAttribute("msg","로그인 실패!");
			return "common/errorPage";
		}



	}

	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {

		// 세션의 상태를 확정지어주는 메소드 호출이 필요하다
		status.setComplete();
		return "redirect:Index.do";
	}

	@RequestMapping("mUpdate.do")
	public String mUpdate(Member m,Model model,HttpServletRequest request,
			@RequestParam(name="profileimg",required=false)MultipartFile file) {


		System.out.println("여기 업뎅이트 :" + m);
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드 해야한다.
			String renameFileName = saveFile(file,request);

			if(renameFileName != null) { // 파일이 잘 저장된 경우
				m.setProfile_img(file.getOriginalFilename()); // 파일명만 DB에저장
				m.setRename_profile_img(renameFileName);
			}
		}


		int result =mService.mUpdate(m);
		if(result >0) {
			model.addAttribute("loginUser", m);
			return "redirect:Settings.do";
		}
		else {
			model.addAttribute("msg","회원 수정 실패");
			return "common/errorPage";
		}
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {

		// 파일이 저장될 경로를 설정하기
		// 웹 서버의 contextPath불러와서 폴더의 경로를 가져온다
		// webapp하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);

		// 파일 경로
		// \를 문자로 인식시키기 위해서는 "\\"를 사용한다.
		String savePath = root + "\\images\\profileImg";

		File folder = new File(savePath);

		if(!folder.exists()) {
			folder.mkdirs();	// 폴더가 없다면 생성한다.
		}

		// 파일명을 rename 과정을 추가--> "년월일시분초.확장자"로 변경
		String originalFileName = file.getOriginalFilename();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
				+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);

		String renamePath = folder +"\\"+renameFileName;//실제 저장될 파일 경로 + 파일명

		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이때 파일이 저장된다.
		}catch(Exception e) {
			System.out.println("파일 정송 에러 " + e.getMessage());
		}

		return renameFileName;
	}


	@ResponseBody
	@RequestMapping("pwdCheck.do")
	public String pwdCheck(String pwd ,String id){
		Member m = new Member(id,pwd);
		System.out.println(m);
		int result = mService.pwdCheck(m);

		if(result >0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	@RequestMapping("changePwd.do")
	public String changePwd(HttpServletRequest request,
			@RequestParam("password1")String pwd,@RequestParam("id")String id, Model model) {
		System.out.println("pwd :" + pwd);
		System.out.println("id : " + id);
		Member changeM = new Member(id,pwd);
		int result = mService.changePwd(changeM);

		HttpSession session = request.getSession();


		if(result>0) {
			Member m = (Member)session.getAttribute("loginUser");
			m.setUpwd(pwd);
			model.addAttribute("loginUser");
			return "redirect:Settings2.do";


		}else {
			model.addAttribute("msg","회원 수정 실패");
			return "common/errorPage";
		}
	}

	// 세팅5(친구관리)
	@RequestMapping("Settings5.do")
	public ModelAndView setting5(ModelAndView mv, int uNum) {

		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Member> BlockList = mService.selectBlockList(uNum);

		System.out.println(FollowList);
		mv.addObject("FollowList", FollowList);
		mv.addObject("FollowerList", FollowerList);
		mv.addObject("BlockList", BlockList);
		mv.setViewName("settings/lml_Settings_5");

		return mv;
	}

	@RequestMapping("Settings5_woo.do")
	public ModelAndView Settings5_woo(ModelAndView mv, int uNum) {

		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Member> BlockList = mService.selectBlockList(uNum);

		mv.addObject("FollowList", FollowList);
		mv.addObject("FollowerList", FollowerList);
		mv.addObject("BlockList", BlockList);
		mv.setViewName("settings/lml_Settings_5_woo");

		return mv;
	}

	@RequestMapping("Settings5_block.do")
	public ModelAndView Settings5_block(ModelAndView mv, int uNum) {

		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		ArrayList<Member> FollowerList = mService.selectFollowerList(uNum);
		ArrayList<Member> BlockList = mService.selectBlockList(uNum);

		mv.addObject("FollowList", FollowList);
		mv.addObject("FollowerList", FollowerList);
		mv.addObject("BlockList", BlockList);
		mv.setViewName("settings/lml_Settings_5_block");

		return mv;
	}

	// 팔로우 등록
	@ResponseBody
	@RequestMapping(value="followBtn.do")
	public String followBtn(int toFollow, int fromFollow) {

		Member f = new Member(fromFollow, toFollow);

		int result = mService.followBtn(f);

		//int result = mService.followBtn(f);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	// 팔로우추가 뷰 -> 팔로우 리스트 업데이트
	@RequestMapping(value="updateFollowList.do", produces="application/json; charset=UTF-8")
	public void updateFollowList(HttpServletResponse response, int uNum) throws JsonIOException, IOException {

		ArrayList<Member> updateList = mService.selectFollowList(uNum);
		response.setContentType("application/json; charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(updateList, response.getWriter());
	}

	// 언팔로우 등록

	@ResponseBody
	@RequestMapping(value="unfollowBtn.do") 
	public String unfollowBtn(int toUnFollow, int fromFollow) {
		System.out.println("toUnFollow:"+toUnFollow);
		System.out.println("fromFollow" + fromFollow);
		Member f = new Member(fromFollow, toUnFollow);

		int result = mService.unfollowBtn(f);

		if(result > 0) {
			return "success"; 
		}else { 
			return "fail"; 
		} 


	}

	//1113은지
	// 검색페이지
	/*
	 * @RequestMapping("Search.do") public ModelAndView Search(ModelAndView mv,
	 * String keyword) {
	 * 
	 * // ArrayList<Member> SearchBoard = mService.searchBoardList(keyword);
	 * ArrayList<Member> SearchUser = mService.searchUserList1(keyword); int
	 * userCount = mService.searchUserCount(keyword); // 6명만 나옴. // 회원번호, 사진, 아이디,
	 * 이름, 팔로우 여부(팔로우 했으면 X, 팔로우 아니면 팔로우 버튼 나오게) -팔로우 버튼 눌렀을 시 팔로우.do // 팔로우 여부는
	 * ajax로 하자..
	 * 
	 * System.out.println("검색 : " + userCount);
	 * 
	 * mv.addObject("searchUser", SearchUser); mv.addObject("userCount",userCount);
	 * mv.addObject("keyword", keyword); mv.setViewName("search/lml_search");
	 * 
	 * return mv; }
	 */
	// 검색페이지 팔로우 리스트용   
	@RequestMapping(value="searchFollowList.do", produces="application/json; charset=UTF-8")
	public void searchFollowList(HttpServletResponse response, int uNum) throws JsonIOException, IOException {

		ArrayList<Member> FollowList = mService.selectFollowList(uNum);
		response.setContentType("application/json; charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(FollowList,response.getWriter());
	}





	@RequestMapping("SearchHash.do")
	public ModelAndView Search1(ModelAndView mv, String keyword) {

		// ArrayList<Member> SearchBoard = mService.searchBoardList(keyword);
		ArrayList<Member> tagPost = mService.tagList1(keyword);
		int tagCount = mService.searchtagCount(keyword);


		mv.addObject("keyword", keyword);
		mv.addObject("tagpost", tagPost);
		mv.addObject("tagCount", tagCount);
		mv.setViewName("search/lml_search_hashtag");

		return mv;
	}













	@RequestMapping("mDelete.do")
	public String mDelete(String id,Model model) {

		int result = mService.mDelete(id);
		int uNum = mService.finduNum(id);
		mService.boardDelete(uNum);
		mService.commentDelete(uNum);
		if(result>0) {

			return "redirect:logout.do";
		}else{
			model.addAttribute("msg","회원 탈퇴 실패");
			return "common/errorPage";
		}
	}

	@RequestMapping(value="nLogin.do", method=RequestMethod.GET)
	public String nLogin(HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		String clientId = "xdLgSJ5mS0zQ1kf7UqKd";
		String clientSecret = "Kq4vS0xwTO"; 
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:9090/lml/Index.do","UTF-8");

		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = ""; //나중에 이용합시다

		try { 
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode="+responseCode);
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			if(responseCode==200) {
				System.out.println(res.toString());
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;

				access_token = (String)jsonObj.get("access_token");
				refresh_token = (String)jsonObj.get("refresh_token");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		String name=null;
		String id=null;
		String gender=null;
		String nickname=null;
		String mail = null;
		if(access_token != "") { // access_token을 잘 받아왔다면

			String token = access_token;// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
			String header = "Bearer " + token; // Bearer 다음에 공백 추가
			try {
				String apiURLs = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiURLs);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();

				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(response.toString());
				JSONObject jsonObj = (JSONObject)obj;
				JSONObject resObj = (JSONObject)jsonObj.get("response");

				name = (String)resObj.get("name");
				id = (String)resObj.get("id");
				gender = (String)resObj.get("gender");
				nickname = (String)resObj.get("nickname");
				mail = (String)resObj.get("email");


				System.out.println("hi : " + response.toString());
				System.out.println("name : " +name);
				System.out.println("nickname : " +nickname);

				System.out.println("id : " +id);
				System.out.println("gender : " +gender);


			} catch (Exception e) {
				System.out.println(e);

			}
		}

		int logincheck = mService.idCheck(id);
		Member m = new Member();
		m.setId(id);
		m.setGender(gender.charAt(0));
		m.setUname(nickname);
		m.setMail(mail);
		if(logincheck > 0) {
			Member loginUser = mService.nloginMember(id);
			System.out.println(loginUser);
			if(loginUser != null) {
				model.addAttribute("loginUser", loginUser);
				return "redirect:Index.do";

			}else {
				model.addAttribute("msg","로그인 실패!");
				return "common/errorPage";
			}

		}else {
			int result = mService.nInsertMember(m);



			if(result>0) {

				Member loginUser = mService.nloginMember(id);


				System.out.println(loginUser);
				if(loginUser != null) {
					model.addAttribute("loginUser", loginUser);
					return "redirect:Index.do";

				}else {
					model.addAttribute("msg","로그인 실패!");
					return "common/errorPage";
				}
			}else{
				model.addAttribute("msg","네아로 회원가입 실패!");
				return "common/errorPage";
			}



		}


	}

	@ResponseBody
	@RequestMapping("chatLog.do")
	public ArrayList<ChatLog> chatLog(String chatid){
		System.out.println(chatid);

		ArrayList<ChatLog> chatlog = mService.chatLog(chatid);
		return chatlog;
	}

	@ResponseBody
	@RequestMapping("chatAlram.do")
	public String chatAlram(String roomid,String name) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("roomid", roomid);
		map.put("name",name);

		System.out.println("roomid : " + roomid);
		System.out.println("name : " + name);

		int result = mService.chatAlram(map);

		if(result>0) {
			return "ok";
		}else {
			return "fail";
		}


	}

	@ResponseBody
	@RequestMapping("checkChat.do")
	public String checkChat(String room,String name) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("roomid", room);
		map.put("name",name);

		int result = mService.checkChat(map);

		if(result>0) {
			return "ok";
		}else {
			return "fail";
		}

	}

	@RequestMapping("deleteChat.do")
	public String deleteChat(String roomid,Model model) {
		System.out.println("여기온다고? : " + roomid);

		int result = mService.deleteChat(roomid);
		int result2 = mService.deleteChatLog(roomid);
		if(result >0 || result2>0) {
			String id = ((Member)model.getAttribute("loginUser")).getId();
			return "redirect:Message.do?id=" + id;
		}else {
			model.addAttribute("msg","메세지 삭제 실패");
			return "common/errorPage";
		}
	}

	@ResponseBody
	@RequestMapping("alalarm.do")
	public int alalarm(String id) {

		int count = mService.alalarm(id);

		return count;
	}

	// 유저페이지 팔로여부
	@ResponseBody
	@RequestMapping(value="upGetFollow.do", produces="application/json; charset=UTF-8")
	public String upGetFollow(HttpServletResponse response, int toFollow, int fromFollow) throws JsonIOException, JsonProcessingException{
		System.out.println("upGetFollow 들어옴");
		Member m = new Member(fromFollow,toFollow);

		Member ff = mService.upGetFollow(m);

		ObjectMapper mapper = new ObjectMapper();

		String jsonStr = mapper.writeValueAsString(ff);

		return jsonStr;
	} 

	// 차단 등록
	@ResponseBody
	@RequestMapping(value="blockBtn.do")
	public String blockBtn(int toFollow, int fromFollow) {

		Member m = new Member(fromFollow, toFollow);

		Member ff = mService.upGetFollow(m);
		int result = -1;

		if(ff != null) {	//원래 팔로우 되어있는 경우
			result = mService.blockBtn(m);
		}else {		// 원래 팔로우 안 되어있는 경우
			result = mService.newBlockBtn(m);
		}

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	// 차단 풀기
	@ResponseBody
	@RequestMapping(value="unblockBtn.do")
	public String unblockBtn(int toFollow, int fromFollow) {

		Member m = new Member(fromFollow, toFollow);

		int result = mService.unBlockBtn(m);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

}
