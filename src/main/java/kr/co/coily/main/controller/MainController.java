package kr.co.coily.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.main.service.MainService;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.QuizVO;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
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
	
	
	@RequestMapping("/retrieveCard.do")
	@ResponseBody
	public List<CardVO> selectTop5Card(HttpSession session) throws Exception {
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		return service.selectTop5Card(group.getGroupHeaderNo());
	}
	
	@RequestMapping("/retrieveQuiz.do")
	@ResponseBody
	public List<QuizVO> selectTop5Quiz(HttpSession session) throws Exception {
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		return service.selectTop5Quiz(group.getGroupHeaderNo());
	}
	
}
