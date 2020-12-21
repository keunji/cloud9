package com.kh.lml.find_idPw.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.lml.find_idPw.service.find_idPw_Service;
import com.kh.lml.find_idPw.vo.Email;
import com.kh.lml.find_idPw.vo.EmailSender;
import java.lang.Math;
@Controller
public class find_idPw_controller {

	@Autowired
	private find_idPw_Service fipService;
	@Autowired
	private Email email;
	@Autowired
	private EmailSender emailSender;
	
	
	
	/**
	 * @return 비밀번호/아이디 찾는 링크로 보내기
	 */
	@RequestMapping("find_idPw.do")
	public String index() {
		return "./minwoo/find_idPw";
	}
	@RequestMapping("redirect_true.do")
	public String redirect_true() {
		return "./jiman/lml_login";
	}


	@RequestMapping("findIdPhone.do")
	public String findIdPhone(String findname, String findphone, Model model){

		String str = fipService.find_namePhone(findname, findphone);
		
        

		if(str == null || str.equals("")) {
			model.addAttribute("msg","기록에 없는 정보입니다.");
			model.addAttribute("flag","false");
		}else {
			model.addAttribute("msg","아이디 : " + str);
			model.addAttribute("flag","true");
		}

		return "minwoo/redirect";
	}
	@RequestMapping("findIdEmail.do")
	public String findIdEmail(String findName, String findEmail, Model model){
		
		String str = fipService.find_nameEmail(findName, findEmail);
		
        

		if(str == null || str.equals("")) {
			model.addAttribute("msg","기록에 없는 정보입니다.");
			model.addAttribute("flag","false");
		}else {
			model.addAttribute("msg","아이디 : " + str);
			model.addAttribute("flag","true");
		}

		return "minwoo/redirect";
	}
	@RequestMapping("findPwEmail.do")
	public String findPwEmail(@RequestParam Map<String, Object> paramMap, Model model) throws Exception{
		
		
		String id=(String) paramMap.get("findID");
    	String e_mail=(String) paramMap.get("findEmail");
    	System.out.println(id);
    	System.out.println(e_mail);
    	
    	
    	int result = fipService.find_PwIdEmail(id, e_mail);
    	System.out.println("result : " + result);
		if(result == 0) {
			model.addAttribute("msg","기록에 없는 정보입니다.");
			model.addAttribute("flag","false");
		}else {
			int random_num = (int)(Math.random()*1000000);
			String pw = random_num + "a!";
			System.out.println("pw : " + pw);
			int result2 = fipService.chang_PwIdEmail(pw, id, e_mail);
			System.out.println("result2 : " + result2);
			if(result2 == 0) {
				model.addAttribute("msg","기록에 없는 정보입니다.");
				model.addAttribute("flag","false");
			}else {
				fipService.find_PwIdEmail(id, e_mail);
				email.setContent("회원님의 비밀번호는 "+pw+"  입니다.\n임시 비밀번호이니 보안강화를 위하여 비밀번호를 바꿔주세요.");
	    		email.setReciver(e_mail);
	    		email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	    		emailSender.SendEmail(email);
				model.addAttribute("msg","이메일로 임시 비밀번호가 전송되었습니다. 사용 후 비밀번호를 바꿔주세요.");
				model.addAttribute("flag","true");
			}
		}
		return "minwoo/redirect";
	}
}