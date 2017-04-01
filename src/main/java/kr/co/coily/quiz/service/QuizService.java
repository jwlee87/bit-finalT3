package kr.co.coily.quiz.service;

import java.util.Map;

import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;

public interface QuizService {
	
	public Map<String, Object> list(SearchVO search) throws Exception;
	
	public void write(QuizVO quiz) throws Exception;
}
