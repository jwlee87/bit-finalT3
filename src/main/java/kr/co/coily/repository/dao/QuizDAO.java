package kr.co.coily.repository.dao;

import java.util.List;

import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;

public interface QuizDAO {

	public List<QuizVO> selectQuiz(SearchVO search) throws Exception;
	
	public int selectQuizCount(SearchVO search) throws Exception;
	
	public int insertQuiz(QuizVO quiz) throws Exception;

}













