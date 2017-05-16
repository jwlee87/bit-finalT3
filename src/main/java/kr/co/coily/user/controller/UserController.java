package kr.co.coily.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.repository.vo.UserVO;
import kr.co.coily.user.service.UserService;


@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private ShaPasswordEncoder passwordEncoder;
	
	
	
	@RequestMapping("/user/loginListForm.do")
	public void loginListForm() throws Exception{}
	
	
	@RequestMapping("/user/goLogin.do")
	public void goLogin() throws Exception{}

	@RequestMapping("/user/test.do")
	public void test() throws Exception{}
	

	@RequestMapping("/user/joinForm.do")
	public void joinForm() throws Exception{}
	
	
	@RequestMapping("/user/loginForm.do")
	public void loginForm() throws Exception{}
	
	
	@RequestMapping("/user/confForm.do")
	public void confForm() throws Exception {}
	
	
	@RequestMapping("/user/confPopupForm.do")
	public void confPopupForm() throws Exception {}
	
	
	@RequestMapping("/user/updatePasswordPage.do")
	public void updatePassword() throws Exception{}
	
	
	
	@RequestMapping("/user/characterImg.do")
	public void characterImg() throws Exception {}
	
	
	@RequestMapping("/user/profileForm.do")
	public void profileForm(HttpSession session, Model model) throws Exception {
//		Map<String, Object> param = new HashMap<>();
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("프로필 회원넘버 : " + user.getUserNo());
//		
		model.addAttribute("userInfo", service.userImg(user.getUserNo()));
//		param.put("userInfo", service.userImg(user.getUserNo()));
//		UserVO user2 = (UserVO)param.get("userInfo");
//		System.out.println("사진경로 : " + user2.getUserImgPath());
		
//		return "user/profileForm";
	}
	
	
	@ResponseBody
	@RequestMapping("/user/conf.do")
	public String conf(HttpServletRequest request , String userEmail) throws Exception{
		
		System.out.println("jsp 에서 넘어온 email" + userEmail);
		System.out.println("jsp에서 넘어온 passNo : " + request.getParameter("passNo"));
		
		int joinNo = service.getJoinNo(userEmail);
		int passNo = Integer.parseInt(request.getParameter("passNo"));
		System.out.println("승인번호 : " + joinNo);
		
		if (joinNo == passNo) {
			service.updateConfStatus(userEmail);
			return "yes";
		} else {
			return "no";
		}
	}	
	
	@ResponseBody
	@RequestMapping("/user/join.do")
	public Map<String, Object> userJoin(UserVO user) throws Exception {
		Random randomNum = new Random();
		int num = randomNum.nextInt(10000)+1000;
		if(num > 10000) {
			num = num - 1000;
		}
		
/*		UserVO user = new UserVO();
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
		return param;*/
		
		//승인번호 랜덤 4자리생성하여 user에 넣음 
		user.setUserJoinNo(num);
		String normalPsw = user.getUserPsw();
		System.out.println("평서문 : " + user.getUserPsw());
		String encPsw = passwordEncoder.encodePassword(normalPsw, null);
		user.setUserPsw(encPsw);
		System.out.println("암호화한거 : " + encPsw);
		
		
//		String encPsw = PasswordEncoder
		
		Map<String, Object> param = new HashMap<>();
		
		service.userJoin(user);
		UserVO uInfo = service.userInfo(user);
		param.put("user", user);
		
		
		
		String nickName = user.getUserNickName();
		String email = user.getUserEmail();
		String regDate = uInfo.getUserRegDate();
		System.out.println("가입날짜 : " + regDate);
		int rNum = user.getUserJoinNo();
		
		
		// 인증메일 보내기ㅒ
		String setfrom = "coilyteam@gmail.com";
		String tomail = user.getUserEmail(); // 받는 사람 이메일
		String title = "coily 회원가입 인증번호"; // 제목
		String content = ""
				+ "<div style='font-size:10pt; font-family:Gulim;'>"
				+ "  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
				+ "<table class='wrapper' width='100%' height='100%' style='border-spacing: 0; background-size: 64px 64px !important; background: #333333 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAQAAABpN6lAAAAD40lEQVR42u2aQU9UVxTHH2CIG0zA4EphWvUDVLqo/aUVayJrF5aUJk1MpB+gpd2KX6CpkkZM3RhJMbZVSO2minVBk2KqUXdG3YERqhQoLkR0upm5c970zjgjtMl5/n9vd+49J/ecmXffPeeeJBFCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQ6wWNdDHAGa4xwwJ5Fpjmd07zGW/RmHXn32aIP8lXfB7yNbuy6vw+rlZx3T6X6M6a8x1cqNH54nOejuy4/zGLERefcJsrXOIKt3kSGV/kYBacb+J4mWMrjNPPThrMrAZ20s84K2Vzv3K+LdLM9ymH5jnKlirzt3CU+ZTGWZo9//rnjSsvOElbDVptDPPc6H1Hk9cADBk35thfh+Z+5ozucZ/uf2RcuEOuTu0cd4z+h/7cz7EUln+32ntfZT+4GywssNVbAC6Gxc/yxivaeNO8CD/4cv8Ds/X1rMFODy+CJU+nQybCsk+u0dJwsHTZU8pTXPRfbDbyPqa4x0il95mtjHCPKfqMbLM5F3hJk8znb9BIjwTpIzojWp0mTzxi5IPOPoc0hq1rhfYgbeWp+aydqPpnz/O0dGSiPRyQ51wcjNkV3Bg30t2pA+5kRO+31IzdZmTc1UvAQFhuv5FuS7l3LqJ3LjVjmxnpD9LPPQRgNCx3e0peqgis8n5E7z1Ww4wLqZHtpbzAQwCuFxa7bBPeJKGFM6ySZ6ZSns9BZsizygibUvIGlgs2r3sIwMPCYm9GxjbRWW0jo5HOtPMF+c2CzRkPASju2VfX0WaxmrjkIQDF9/Xif5FZ6B/gew94ZZuu9oAb8a/AGiyWvgI3PATgbPwcsAaLpXPAqIcAfBk9CXbzR11Pd/Qk+IWHALwTzQU2cL+Oe6H7bIjmAu96CEBTSGtNNpgkHKgjAAeMXnvII+ecFMjj9YAk4dsa3T+V0hp0Vx43FaF5exVCsymVVn5+tndBtJmKUJefotivYdHDKXkzp17266evwjgRRiYSP7CvclWYXqYrOD9Nb9ncHnNJtjfxROpeoKwCyEYOMckz4/ozJjnExrJ5OWbDjB8TX5Dj7+o3Q7Swhz4+pY89tETG7c3Qoq0QeQnBJ+t4N9ibeIRvXuvb4SShKdUZ9JxhWmvQai3rDxh12x8Q6RB5/NIOkUEeZ6ZDpPAv+HeP0BiH2VE2bweHGctcj1DBuXiX2DK3mOAXJrgV8v3sdYkVQtDBWJ19gj/F7g99B6H2TtHLzk59daVJQzyq4vosxzLbK2y2xS4GGOEaD1gizyIPmHpNusWFEEIIIYQQQgghhBBCCCGEEEIIIYQQQgjxP/IPFfE4uP4K424AAAAASUVORK5CYII=); padding: 100px 0 0; border: 0;'>"
				+ "<tbody><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+ "  <table class='main welcome' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: white; padding: 0; border: 0;'>"
				+ "<thead><tr><td align='center' style='vertical-align: top; height: 26px; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #4A90BE; padding: 20px;'>"
				+ "<img width='80' height='80' alt='Smile' src='http://tryhelloworld.co.kr/assets/icons/ic_smile-45a284c191283d76d502592026377b66f71c85e0c5b3b4e768c82682e834b07f.png'>"
				+ "<h2 style='font-weight: 300; font-size: 36px; line-height: 58px; letter-spacing: -1px; word-spacing: -1px; margin: 0;'>환영합니다</h2>"
				+ "   </td></tr></thead>"
				+ "<tbody><tr><td style='vertical-align: top; padding: 40px;'>"
				+ "<h5 style='font-weight: 400; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0 0 10px;'>" + nickName+"님, 함께하게 되어 반갑습니다.</h5> "
				+ "<br><span style='font-size: 18px;'>인증번호는 </span><span style='font-size: 26px; font-weight: bold;'>" + rNum  +"</span><span style='font-size: 18px;'>입니다</span>"
				+ "<ul style='margin-bottom: 100px;'><li>계정 생성일 : "+ regDate + "</li><li>이메일 : " + email  +"</li></ul>"
				+ "<div style='text-align: center; margin-bottom: 80px;'>"
				+ "<a href='https://coily.com/bit-finalT3/index.html'><button style='height:45px; width:172px; font-weight: 500; font-size: 25px; line-: 27px; word-spacing: -0.5px; display: inline-block; color: white; text-decoration: none; border-radius:5px; background:#4A90BE; border:solid 1px #4A90BE;'>coily 시작하기</button></a>"
				+ " </div>"
				+ "<h6 style='font-weight: 300; font-size: 0.75rem; line-height: 20px; word-spacing: -0.5px; color: #808080; text-align: center; margin: 0 0 20px;'>"
				+ "아이쿠! 깜빡하고 인증페이지를 닫았나요?? <a href='https://coily.com/bit-finalT3/user/confForm.do?userEmail="+ email +"' style='color: inherit;' target='_blank'>인증하러가기</a>"
				+ " </h6>"
				+ " </td></tr></tbody>"
				+ "</table>"
				+ "</td></tr><tr><td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500; padding: 20px 0 40px;'>"
				+ "<h4 style='font-weight: 400; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>coily</h4>"
				+ " </td></tr></tbody></table>"
				+ "<img src='https://u2556246.ct.sendgrid.net/wf/open?upn=PudMd-2BtIr3P-2FVBE9OmzCkfswsIJK2FuaFsi8jZjVHVVtKnR8gDq5kc0aJLWj-2F3XtdV-2FnrTNvW0LUUwTuLHN-2Fk1OFkFezRHQekkMY3IQ5iJ4-2FOgd7Y-2Fg4fbMblMHcJ9jXk2PuaAu5HtATN6Nxa3KfjEj3cOtUD0kcTHxEeOdSPmv7zQNmOv9mpPF0I6ZGk083pc1oYMul9YW1TIhgnEC38nh7N1JGNFE4M4MTWMcKZAz5XtNaIYBUpXzJNu-2FT6kJW8XkS854LDlEXzsML2Xv8lw-3D-3D' alt='' width='1' height='1' border='0' style='height:1px !important;width:1px !important;border-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !important;'>"
				+ "</meta>"
				+ "</div>";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
	/*	System.out.println("회원번호 : " + user.getUserNo());
		System.out.println("user : " + user.getUserEmail());
		System.out.println("별명 : " + user.getUserNickName());
		System.out.println(param.get("user"));
		UserVO userVal = (UserVO)param.get("user");
		System.out.println(userVal.getUserEmail());
		return userVal;
		*/
		
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
	
	
	@ResponseBody
	@RequestMapping("/user/login.do")
	public Map<String, Object> login(HttpServletRequest request, UserVO user) throws Exception {
		
		Map<String, Object> param = new HashMap<>();
		
		System.out.println("jsp입력 emai5555 : " + user.getUserEmail());
		System.out.println("jsp입력 psw555 : " + user.getUserPsw());
		String normalPsw = user.getUserPsw();	//jsp에서 암호 입력 받은거(평서문)
		
		if (normalPsw.length() <= 18) {
			String encPsw = passwordEncoder.encodePassword(normalPsw, null);	//입력받은암호 암호화
			user.setUserPsw(encPsw);
			System.out.println("로그인할때암호1(jsp) : " + user.getUserPsw());
			
			UserVO loginUser = service.userLogin(user);
			if (service.userLogin(user) != null) {
				System.out.println("로그인 성공 :  " + loginUser);
				HttpSession session = request.getSession();
			    session.setAttribute("user", loginUser);
			    session.setMaxInactiveInterval(600); 

				param.put("userNo", loginUser.getUserNo());
				param.put("userEmail", loginUser.getUserEmail());
				param.put("userNickName", loginUser.getUserNickName());
				param.put("userPsw", loginUser.getUserPsw());
				param.put("normalPsw", normalPsw);
				param.put("userConf", loginUser.getUserConf());
				System.out.println("뭐가문제지??");
				param.put("loginOk", true);
				System.out.println((UserVO)session.getAttribute("user"));
				service.updateUserStatus(user);
				System.out.println("444444");
				return param;
				
			} else {
				System.out.println("로그인실패1");
				param.put("loginFail", false);
//				param.put("userConf", loginUser.getUserConf());
				
				return param;
			}
			
		} else {
			UserVO loginUser = service.userLogin(user);
			if (service.userLogin(user) != null) {
				System.out.println("로그인 성공 " + loginUser);
				HttpSession session = request.getSession();
			    session.setAttribute("user", loginUser);
			    session.setMaxInactiveInterval(600); 
				param.put("userNo", loginUser.getUserNo());
				param.put("userEmail", loginUser.getUserEmail());
				param.put("userNickName", loginUser.getUserNickName());
				param.put("userPsw", loginUser.getUserPsw());
				param.put("normalPsw", normalPsw);
				param.put("loginOk", true);
				System.out.println((UserVO)session.getAttribute("user"));
				service.updateUserStatus(user);
				return param;
				
			} else {
				System.out.println("로그인실패2");
				param.put("loginFail", false);
				return param;
			
		}
		}
		/*
		UserVO loginUser = service.userLogin(user);

		if (service.userLogin(user) != null) {
			System.out.println("로그인 성공 " + loginUser);
			HttpSession session = request.getSession();
		    session.setAttribute("user", loginUser);
			param.put("userNo", loginUser.getUserNo());
			param.put("userEmail", loginUser.getUserEmail());
			param.put("userNickName", loginUser.getUserNickName());
			param.put("userPsw", loginUser.getUserPsw());
			param.put("normalPsw", normalPsw);
			
			param.put("loginOk", true);
			System.out.println((UserVO)session.getAttribute("user"));
			service.updateUserStatus(user);
			return param;
			
		} else {
			param.put("loginFail", false);
			return param;
		}
		*/
	}
	
	@ResponseBody
	@RequestMapping("/user/logout.do")
	public String logout(int userNo, HttpSession session) throws Exception {
		System.out.println("오십니다ㄴ : " + userNo);
		session.invalidate();//세션삭제
		service.userStatusLogout(userNo);
		System.out.println("세션아웃??");
		return "sessionDel";
	}
	
	
	@ResponseBody
	@RequestMapping("/user/encPassword.do")
	public Map<String, Object> encPassword(String userEmail, String userPsw) throws Exception {
		Map<String, Object> param = new HashMap<>();
		
		System.out.println("평서문 : " + userPsw);
		String encPsw = passwordEncoder.encodePassword(userPsw, null);
		System.out.println("암호문 : " + encPsw);
		
		param.put("userEmail", userEmail);
		param.put("userPsw", userPsw);
		
		return param;
		
		
	}
	
	
	@ResponseBody
	@RequestMapping("/user/findPsw.do")
	public String findPsw(String userEmail) throws Exception {
		System.out.println("이메일 넘어오나? : " + userEmail);
		
		UserVO user = service.userInfoConfed(userEmail);
		
//		String nickName = user.getUserNickName();
		
		if (user != null) {
		String setfrom = "coilyteam@gmail.com";
		String tomail = userEmail; // 받는 사람 이메일
		String title = "coily입니다. 비밀번호를 잊어버렸나요??"; // 제목
		String content = ""
				+ "<div style='font-size:10pt; font-family:Gulim;'>"
				+ "  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
				+ "<table class='wrapper' width='100%' height='100%' style='border-spacing: 0; background-size: 64px 64px !important; background: #333333 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAQAAABpN6lAAAAD40lEQVR42u2aQU9UVxTHH2CIG0zA4EphWvUDVLqo/aUVayJrF5aUJk1MpB+gpd2KX6CpkkZM3RhJMbZVSO2minVBk2KqUXdG3YERqhQoLkR0upm5c970zjgjtMl5/n9vd+49J/ecmXffPeeeJBFCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQ6wWNdDHAGa4xwwJ5Fpjmd07zGW/RmHXn32aIP8lXfB7yNbuy6vw+rlZx3T6X6M6a8x1cqNH54nOejuy4/zGLERefcJsrXOIKt3kSGV/kYBacb+J4mWMrjNPPThrMrAZ20s84K2Vzv3K+LdLM9ymH5jnKlirzt3CU+ZTGWZo9//rnjSsvOElbDVptDPPc6H1Hk9cADBk35thfh+Z+5ozucZ/uf2RcuEOuTu0cd4z+h/7cz7EUln+32ntfZT+4GywssNVbAC6Gxc/yxivaeNO8CD/4cv8Ds/X1rMFODy+CJU+nQybCsk+u0dJwsHTZU8pTXPRfbDbyPqa4x0il95mtjHCPKfqMbLM5F3hJk8znb9BIjwTpIzojWp0mTzxi5IPOPoc0hq1rhfYgbeWp+aydqPpnz/O0dGSiPRyQ51wcjNkV3Bg30t2pA+5kRO+31IzdZmTc1UvAQFhuv5FuS7l3LqJ3LjVjmxnpD9LPPQRgNCx3e0peqgis8n5E7z1Ww4wLqZHtpbzAQwCuFxa7bBPeJKGFM6ySZ6ZSns9BZsizygibUvIGlgs2r3sIwMPCYm9GxjbRWW0jo5HOtPMF+c2CzRkPASju2VfX0WaxmrjkIQDF9/Xif5FZ6B/gew94ZZuu9oAb8a/AGiyWvgI3PATgbPwcsAaLpXPAqIcAfBk9CXbzR11Pd/Qk+IWHALwTzQU2cL+Oe6H7bIjmAu96CEBTSGtNNpgkHKgjAAeMXnvII+ecFMjj9YAk4dsa3T+V0hp0Vx43FaF5exVCsymVVn5+tndBtJmKUJefotivYdHDKXkzp17266evwjgRRiYSP7CvclWYXqYrOD9Nb9ncHnNJtjfxROpeoKwCyEYOMckz4/ozJjnExrJ5OWbDjB8TX5Dj7+o3Q7Swhz4+pY89tETG7c3Qoq0QeQnBJ+t4N9ibeIRvXuvb4SShKdUZ9JxhWmvQai3rDxh12x8Q6RB5/NIOkUEeZ6ZDpPAv+HeP0BiH2VE2bweHGctcj1DBuXiX2DK3mOAXJrgV8v3sdYkVQtDBWJ19gj/F7g99B6H2TtHLzk59daVJQzyq4vosxzLbK2y2xS4GGOEaD1gizyIPmHpNusWFEEIIIYQQQgghhBBCCCGEEEIIIYQQQgjxP/IPFfE4uP4K424AAAAASUVORK5CYII=); padding: 100px 0 0; border: 0;'>"
				+ "<tbody><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+ "  <table class='main welcome' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: white; padding: 0; border: 0;'>"
				+ "<thead><tr><td align='center' style='vertical-align: top; height: 26px; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #4A90BE; padding: 20px;'>"
				+ "<img width='80' height='80' alt='Smile' src='http://tryhelloworld.co.kr/assets/icons/ic_smile-45a284c191283d76d502592026377b66f71c85e0c5b3b4e768c82682e834b07f.png'>"
				+ "<h2 style='font-weight: 300; font-size: 38px; line-height: 58px; letter-spacing: -1px; word-spacing: -1px; margin: 0;'>비밀번호를 잊어버렸나요?</h2>"
				+ "   </td></tr></thead>"
				+ "<tbody><tr><td style='vertical-align: top; padding: 40px;'>"
				+ "<br><span style='font-size: 20px; font-weight: bold;'>"+ user.getUserNickName() +" 님,</span><br><span style='font-size: 16px; font-weight: bold; margin-bottom:30px;'> 아래 버튼을 누르시면 비밀번호를 변경할 수 있습니다.</span><br><br><br><br>"
				+ "<div style='text-align: center;'>"
				+ "<a href='https://coily.com/bit-finalT3/user/updatePasswordPage.do?userEmail="+userEmail+"'><button style='height:45px; width:172px; font-weight: 500; font-size: 25px; line-: 27px; word-spacing: -0.5px; display: inline-block; color: white; text-decoration: none; border-radius:5px; background:#4A90BE; border:solid 1px #4A90BE;'>비밀번호 변경</button></a>"
				+ " </div>"
				+ "<h6 style='font-weight: 300; font-size: 0.75rem; line-height: 20px; word-spacing: -0.5px; color: #808080; text-align: center; margin: 0 0 20px;'>"
				+ " </h6>"
				+ " </td></tr></tbody>"
				+ "</table>"
				+ "</td></tr><tr><td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500; padding: 20px 0 40px;'>"
				+ "<h4 style='font-weight: 400; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>coily</h4>"
				+ " </td></tr></tbody></table>"
				+ "<img src='https://u2556246.ct.sendgrid.net/wf/open?upn=PudMd-2BtIr3P-2FVBE9OmzCkfswsIJK2FuaFsi8jZjVHVVtKnR8gDq5kc0aJLWj-2F3XtdV-2FnrTNvW0LUUwTuLHN-2Fk1OFkFezRHQekkMY3IQ5iJ4-2FOgd7Y-2Fg4fbMblMHcJ9jXk2PuaAu5HtATN6Nxa3KfjEj3cOtUD0kcTHxEeOdSPmv7zQNmOv9mpPF0I6ZGk083pc1oYMul9YW1TIhgnEC38nh7N1JGNFE4M4MTWMcKZAz5XtNaIYBUpXzJNu-2FT6kJW8XkS854LDlEXzsML2Xv8lw-3D-3D' alt='' width='1' height='1' border='0' style='height:1px !important;width:1px !important;border-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !important;'>"
				+ "</meta>"
				+ "</div>";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "userOk";
		
		} else {
			return "userNo";
			
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("/user/updatePassword.do")
	public String updatePassword(String userEmail, String userPsw) throws Exception {
		
		System.out.println("이메일 : " + userEmail);
		System.out.println("암호(평서문) : " + userPsw);
		String encPsw = passwordEncoder.encodePassword(userPsw, null); 
		
		UserVO user = new UserVO();
		user.setUserPsw(encPsw);
		user.setUserEmail(userEmail);
		service.updatePassword(user);
		
		return "yes";
	}
	
	
	
	@ResponseBody
	@RequestMapping("/user/updateUser.do")
	public String updateUser(UserVO user) throws Exception{
		System.out.println("수정 이메일 : " + user.getUserEmail());
		System.out.println("수정 별명 : " + user.getUserNickName());
		System.out.println("수정 암호 : " + user.getUserPsw());
		System.out.println("수정 회원번호 : " + user.getUserNo());
		
		String normalPsw = user.getUserPsw();
		System.out.println("프로필수정 평서문 : " + normalPsw);
		String encPsw = passwordEncoder.encodePassword(normalPsw, null);
		System.out.println("프로필수정 비밀번호 암호화 : " + encPsw);
		
		
		user.setUserPsw(encPsw);
		user.setUserNickName(user.getUserNickName());
		
		service.updateUser(user);
		
		return "";
	} 
	
	
	@ResponseBody
	@RequestMapping("/user/userStatusLogout.do")
	public void userStatusLogout(HttpSession session) throws Exception {
		System.out.println("종료버튼 눌렀따");
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("유저넘버 : " + user.getUserNo());
		
		
		
	}
	
	
	@ResponseBody
	@RequestMapping("/user/choiceImg.do")
	public Map<String, Object> choiceImg(UserVO user, HttpSession session) throws Exception {
		Map<String, Object> param = new HashMap<>();
		System.out.println("회원번호 : " + user.getUserNo());
		System.out.println("이미지번호 : " + user.getUserImgNo());
		
		UserVO sessVO = (UserVO)session.getAttribute("user");
		sessVO.setUserImgPath("/bit-finalT3/img/userImg/" + user.getUserImgNo() + ".PNG");
		session.setAttribute("user", sessVO);
		
		service.choiceImg(user);
		param.put("userNo", user.getUserNo());
		return param;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/user/loginList.do")
	public List<UserVO> loginList() throws Exception {
		System.out.println("접속자리스트");
		List<UserVO> userList = service.selectLoginUserList();
		System.out.println(userList);
		return userList;
		
	}
	

}
