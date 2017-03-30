package kr.co.coily.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.repository.vo.UserVO;
import kr.co.coily.user.service.UserService;


@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	
	@RequestMapping("/user/joinForm.do")
	public String joinForm() throws Exception{
		System.out.println("111111111111111111111111");
		return "/user/joinForm";
	}
	
	
	@RequestMapping("/user/confForm.do")
	public void confForm() throws Exception {
		System.out.println("confForm.do");
	}
	
	@ResponseBody
	@RequestMapping("/user/join.do")
	public String userJoin(UserVO user) throws Exception {
		
		System.out.println("user : " + user.getUserEmail());
		
		Random randomNum = new Random();
		int num = randomNum.nextInt(10000)+1000;
		if(num > 10000) {
			num = num - 1000;
		}
		
		service.userJoin(user);
		
		return "회원가입성공";
	}
	
	@ResponseBody
	@RequestMapping("/user/emailCheck.do")
	public Map<String, Object> emailCheck(String email) throws Exception {
		Map<String, Object> param = new HashMap<>();
		
		String emailChk = service.emailCheck(email);
		
		if (emailChk != null) {
			param.put("emailChk", true);
			return param;
		} else {
			param.put("emailChk", false);
		}
		return param;
	}
	
	@ResponseBody
	@RequestMapping("/user/nickNameCheck.do")
	public Map<String, Object> nickNameCheck(String nickName) throws Exception {
		Map<String, Object> param = new HashMap<>();
		
		String nickNameChk = service.nickNameCheck(nickName);
		
		if (nickNameChk != null) {
			param.put("nickNameChk", true);
			return param;
		} else {
			param.put("nickNameChk", false);
		}
		return param;
	}
	
	@ResponseBody
	@RequestMapping("/user/pswCheck.do")
	public Map<String, Object> pswCheck(HttpServletRequest request) throws Exception {
		Map<String, Object> param = new HashMap<>();
		System.out.println("입력받은 비밀번호" + request.getParameter("password"));
		System.out.println("입력받은 비밀번호 체크" + request.getParameter("passwordCheck"));
		
		String psw = request.getParameter("password");
		String pswChk = request.getParameter("passwordCheck");
		
		if (psw.equals(pswChk)) {
			param.put("pswChk", false);
			return param;
		}else {
			param.put("pswChk", true);
		}
		return param;
	}
	
/*	@RequestMapping("users/login.do")
	public Map<String, Object> userLogin(HttpServletRequest request, UserVO user) throws Exception {
		
		Map<String, Object> param = new HashMap<>();
		
		UserVO login = service.userLogin(user);
		
		if (login != null) {
			HttpSession session = request.getSession();
			HttpCookie cookie = request.getCookies();
			
			session.setAttribute("user", login);
			
			param.put("userNo", )
			
		}
	}
	*/
	

}
