package kr.co.coily.quiz.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.quiz.service.QuizService;
import kr.co.coily.repository.vo.CommentSearchVO;
import kr.co.coily.repository.vo.QuizCommentVO;
import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;
import kr.co.coily.repository.vo.UserVO;

@Controller
@RequestMapping("/quiz")
public class QuizController {
	
	@Autowired
	private QuizService service;
	
	//퀴즈 등록 폼
	@RequestMapping("/writeForm.do")
	public void writeForm() throws Exception {
		
	}
	
	
	//퀴즈 등록
	@RequestMapping("/write.do")
	@ResponseBody
	public String write(HttpServletRequest request, HttpSession session) throws Exception {
		
		QuizVO quiz = new QuizVO();
		//로그인한 유저(세션이나 쿠키로 나중에 받을거임)
		UserVO user = (UserVO)session.getAttribute("user");
		quiz.setUserNo(user.getUserNo());
		quiz.setQuizTitle(request.getParameter("title"));
		quiz.setQuizWriteType(request.getParameter("writeType"));
		quiz.setQuizUrlType(request.getParameter("urlType"));
		quiz.setQuizAnswer(request.getParameter("answer"));
		
		
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
//			System.out.println(list);
			quiz.setQuizContent(list);
		} else {
			quiz.setQuizContent(request.getParameter("content"));
		}
		service.write(quiz);
		
	return "";
	}

	//퀴즈 조회
	@RequestMapping("/list.do")
	public void list(SearchVO search, Model model) throws Exception {
		Map<String, Object> result = service.list(search);
		model.addAttribute("qList", result.get("qList"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	//스크롤
	@RequestMapping("/scrollDown.do")
	@ResponseBody
	public List<QuizVO> scrollDown(QuizVO quiz) throws Exception{
		int noStart = quiz.getQuizNo()-1;
		return service.scrollDown(noStart);
	}
	
	
	
	//퀴즈 삭제
	@RequestMapping("/delete.do")
	@ResponseBody
	public void delete(int deleteNo) throws Exception {
		service.delete(deleteNo);
	}
	
	
	//퀴즈 수정폼
	@RequestMapping("/updateForm.do")
	@ResponseBody
	public Map<String, Object> updateForm(int no) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("quiz", service.updateForm(no));
		return result;
	}
	
	//퀴즈 수정
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(int quizNo, String quizTitle, String quizContent) throws Exception {
		System.out.println(quizContent);
		QuizVO quiz = new QuizVO();
		quiz.setQuizNo(quizNo);
		quiz.setQuizTitle(quizTitle);
		quiz.setQuizContent(quizContent);
		service.update(quiz);
	}
	
	//퀴즈 풀기 폼
	@RequestMapping("/quizSolveForm")
	public void quizSolveForm(int quizNo, Model model){
		model.addAttribute("quizNo", quizNo);
	}
	
	
	//퀴즈 풀기
	@RequestMapping("/quizSolve.do")
	@ResponseBody
	public String quizSolve(HttpServletRequest request, String code, int quizNo) throws Exception {

		String result="";
		ServletContext context = request.getServletContext();
		
		String path = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		File dest = new File(f, "Main.java");
		File classFile = new File(f, "Main.class");
		if(classFile.exists()) classFile.delete();

		try (FileWriter fw = new FileWriter(dest);) {
			System.out.println("code: " + code);
			fw.write(code.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
            Runtime rt = Runtime.getRuntime();
            String[] arr = {"C:/java90/bin/jdk8/bin/javac", savePath+"/Main.java"};
            Process proc = rt.exec(arr); //시스템 명령어
            proc.waitFor();
            
            String[] arr2 = {"C:/java90/bin/jdk8/bin/java", "-cp", savePath, "Main"};
            Process proc2 = rt.exec(arr2); //시스템 명령어
            
            InputStream is2 = proc2.getInputStream();
            InputStreamReader isr2 = new InputStreamReader(is2);
            BufferedReader br2 = new BufferedReader(isr2);
            String line2 = "";
	            while((line2 = br2.readLine())!= null) {
	            	result += line2;
	            	System.out.println(line2);
	                System.out.flush();
	            }
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

		
		//DB 답 vs complie 답
		String msg = "";
		QuizVO quiz = service.updateForm(quizNo);
		if(result != "") {
			if(quiz.getQuizAnswer().equals(result)) {
				msg = "s";
			} else {
				msg = "e";
			}
		} else {
			msg = "n";
		}
		return msg;
		
		
		
		
		
		
	}
	
	//댓글 등록
	@RequestMapping("/quizCommentRegist.do")
	@ResponseBody
	public List<QuizCommentVO> commentRegist(int quizNo, String quizSolveChk, HttpSession session) throws Exception {
		QuizCommentVO quizComment = new QuizCommentVO();
		quizComment.setQuizNo(quizNo);
		quizComment.setQuizSolveChk(quizSolveChk);
		//로그인한 유저 
		UserVO user = (UserVO)session.getAttribute("user");
		quizComment.setUserNo(user.getUserNo());
		return service.commentRegist(quizComment);
	}

	//댓글 목록
	@RequestMapping("/quizCommentList.do")
	@ResponseBody
	public Map<String, Object> commentList(CommentSearchVO search, int quizNo) throws Exception {
		search.setQuizNo(quizNo);
		Map<String, Object> map = service.commentList(search);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("quizCommentList", map.get("quizCommentList"));
		result.put("commentPageResult", map.get("commentPageResult"));
		return result;
	}
	
	
	
}
