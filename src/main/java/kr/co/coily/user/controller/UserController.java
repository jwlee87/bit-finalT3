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
@RequestMapping
public class UserController {
	
	@Autowired
	private UserService service;
	
	
	@RequestMapping("/user/joinForm.do")
	public void joinForm() throws Exception{
	}
	
	
	@RequestMapping("/user/confForm.do")
	public void confForm() throws Exception {
		System.out.println("confForm.do");
	}
	
	@ResponseBody
	@RequestMapping("/user/join.do")
	public Map<String, Object> userJoin(HttpServletRequest request) throws Exception {
		
		Random randomNum = new Random();
		int num = randomNum.nextInt(10000)+1000;
		if(num > 10000) {
			num = num - 1000;
		}
		
		UserVO user = new UserVO();
		Map<String, Object> param = new HashMap<>();
		System.out.println("컨트롤러 옴");
		
		System.out.println("jsp에서 가져온거 이메일 : " + request.getParameter("email"));
		System.out.println("jsp에서 가져온거 별명 : " + request.getParameter("nickName"));
		System.out.println("jsp에서 가져온거 비밀번호 : " + request.getParameter("password"));
		
		user.setUserEmail(request.getParameter("email"));
		user.setUserPsw(request.getParameter("password"));
		user.setUserNickName(request.getParameter("nickName"));
		user.setUserJoinNo(num);
		
		param.put("user", user);
		service.userJoin(user);
		
		System.out.println("회원번호 : " + user.getUserNo());
		System.out.println("이메일 : " + user.getUserEmail());
		System.out.println("별명 : " + user.getUserNickName());
		System.out.println("암호 : " + user.getUserPsw());
		System.out.println("승인번호 : " + user.getUserJoinNo() );
		System.out.println("회원가입 완료");
		return param;
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
