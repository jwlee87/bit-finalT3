package kr.co.coily.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	private JavaMailSender mailSender;
	
	
	
	@RequestMapping("/user/test.do")
	public void test() throws Exception{}
	

	@RequestMapping("/user/joinForm.do")
	public void joinForm() throws Exception{}
	
	
	@RequestMapping("/user/loginForm.do")
	public void loginForm() throws Exception{}
	
	
	@RequestMapping("/user/confForm.do")
	public void confForm() throws Exception {}
	
	
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
		user.setUserJoinNo(num);
		
		
		Map<String, Object> param = new HashMap<>();
		
		service.userJoin(user);
		param.put("user", user);
		
		
		// 인증메일 보내기
		String setfrom = "hac891234@gmail.com";
		String tomail = user.getUserEmail(); // 받는 사람 이메일
		String title = "coily 회원가입 인증번호"; // 제목
		String content = ""
				+ "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">"
				+ "<html style='margin:0;"
				+ " box-sizing:border-box;"
				+ " border:0;'>"
				+ "<body style='margin:0;padding:0;box-sizing:border-box;border:0;font:13px/100% tahoma;><div class='wrapper' style='margin:10px auto;padding:0;box-sizing:border-box;border:0;width:400px;'>"
				+ "<div class='commentBoxfloat' style='margin:0;"
				+ "padding:0;"
				+ "box-sizing:border-box;"
				+ "border:0;'>"
				+ "<form id='cmnt' style='margin:0;"
				+ " padding:0;"
				+ " box-sizing:border-box;"
				+ "  border:0;'>"
				+ "<fieldset style='margin:0;padding:10px;box-sizing:border-box;border:0;background:#69bdf4;'>"
				+ "<div class='form_grp' style='margin:0;padding:0;box-sizing:border-box;border:0;margin-bottom:10px;'>"
				+ "<label style='margin:0;padding:0;box-sizing:border-box;border:0;width:100%;height:32px;line-height:32px;display:block;margin-bottom:10px;font-size:18px;color:#fff;padding-left:34px;background:url(https://cdn3.iconfinder.com/data/icons/glypho-free/64/pen-checkbox-32.png) no-repeat left center;'>coily에오신걸 환영합니다!!</label>"
				+ "<div id='userCmnt' style='margin:0;padding:10px;box-sizing:border-box;border:1px solid #eee;width:100%;height:100px;background-color:#fff;resize:none;'>"
				+ "<h5>인증번호는 </h5><h2>" + user.getUserJoinNo() + "</h2><h5> 입니다</h5>"
				+ "</div>"
				+ "</div>"
				+ "<div class='form_grp' style='margin:0;padding:0;box-sizing:border-box;border:0;margin-bottom:10px;'>"
				+ "</div>"
				+ " </fieldset>"
				+ "</form>"
				+ "</div>"
				+ " <div id='cmntContr' style='margin:0;"
				+ "  padding:0;"
				+ "  box-sizing:border-box;"
				+ " border:0;'></div>"
				+ "</div>"
				+ "</body>"
				+ "</html>";

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
	
	
	@ResponseBody
	@RequestMapping("/user/login.do")
	public Map<String, Object> login(HttpServletRequest request, UserVO user) throws Exception {
		
		Map<String, Object> param = new HashMap<>();
		
		System.out.println("jsp입력 email : " + user.getUserEmail());
		System.out.println("jsp입력 psw : " + user.getUserPsw());
		
		
		UserVO loginUser = service.userLogin(user);
		
		if (loginUser != null) {
			HttpSession session = request.getSession();
//			HttpCookie cookie = request.getCookies();
			
		    session.setAttribute("user", loginUser);
			param.put("userNo", loginUser.getUserNo());
			param.put("userEmail", loginUser.getUserEmail());
			param.put("userNickName", loginUser.getUserNickName());
			param.put("loginOk", true);
			
			System.out.println((UserVO)session.getAttribute("user"));
			service.updateUserStatus(user);
			
			return param;
		} else {
			param.put("loginFail", false);
			return param;
		}
		
	}

	

}
