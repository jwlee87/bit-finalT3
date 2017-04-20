package kr.co.coily.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.coily.repository.vo.GroupHeaderVO;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@RequestMapping("/reLoadMain.do")
	public String view() throws Exception {
		return "main/main";
	}

	@RequestMapping("/main.do")
	public void viewFromGroup(HttpServletRequest request, GroupHeaderVO group) throws Exception {
		
		HttpSession session = request.getSession();
		
		System.out.println("groupName: " + group.getGroupHeaderName());
		System.out.println("groupNo: " + group.getGroupHeaderNo());
		
		session.setAttribute("groupInfo", group);
		System.out.println("메인 컨트롤러 끝");
		
	}
	
}
