package kr.co.coily.quiz.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.quiz.service.QuizService;
import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;

@Controller
@RequestMapping("/quiz")
public class QuizController {
	
	@Autowired
	private QuizService service;
	
	@RequestMapping("/writeForm.do")
	public String writeForm() {
		return "quiz/writeForm";
	}
	
	@RequestMapping("/write.do")
	@ResponseBody
	public String write(HttpServletRequest request) throws Exception {
		
		QuizVO quiz = new QuizVO();
		quiz.setUserNo(1);
		quiz.setQuizTitle(request.getParameter("title"));
		quiz.setQuizWriteType(request.getParameter("writeType"));
		quiz.setQuizUrlType(request.getParameter("urlType"));
		
		String allLine = "";
		String urlType = request.getParameter("urlType");
		
		if(request.getParameter("writeType").equals("u")) {
			try {
				URL url = new URL(request.getParameter("url"));
				InputStream in = url.openStream();
				InputStreamReader isr = new InputStreamReader(in, "utf-8"); 	
				BufferedReader br = new BufferedReader(isr);
				
				while(true) {
					String line = br.readLine();		
					if(line == null) break;
					allLine += line;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			int start = 0;
			int end = 0;
			switch(urlType){
			case "j":
				start = allLine.indexOf("<img src=\"http://www.jungol.co.kr/theme/jungol/img/view_title01.gif\"");
				end = allLine.indexOf("<div class=\"bo_v_con2\"");
				break;
			case "a":
				start = allLine.indexOf("<section class=\"problem_statement\"");
				end = allLine.indexOf("<section class=\"problem_note\"");
				break;
			case "e":
				start = allLine.indexOf("<div class=\"problem_content\"");
				end = allLine.indexOf("<div style=\"float:right;\"");
				break;
			}
			String list = allLine.substring(start, end);
			System.out.println(list);
			quiz.setQuizContent(list);
		} else {
			quiz.setQuizContent(request.getParameter("content"));
		}
		service.write(quiz);
		
	return "";
	}

	@RequestMapping("/list.do")
	public void list(SearchVO search, Model model) throws Exception {
		Map<String, Object> result = service.list(search);
		model.addAttribute("qList", result.get("qList"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	
	
}
