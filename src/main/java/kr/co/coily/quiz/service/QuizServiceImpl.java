package kr.co.coily.quiz.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.QuizDAO;
import kr.co.coily.repository.vo.PageResultVO;
import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;

@Service
public class QuizServiceImpl implements QuizService{
	@Autowired
	private QuizDAO dao;
	
	@Override
	public void write(QuizVO quiz) throws Exception {
		dao.insertQuiz(quiz);
	}
	
	@Override
	public Map<String, Object> list(SearchVO search) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("qList", dao.selectQuiz(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectQuizCount(search)));
		return result;
	}
	
	
}
