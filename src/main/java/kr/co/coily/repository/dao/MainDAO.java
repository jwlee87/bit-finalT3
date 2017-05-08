package kr.co.coily.repository.dao;

import java.util.List;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.QuizVO;

public interface MainDAO {
	public List<CardVO> selectCard(int headerNo) throws Exception;
	public List<QuizVO> selectQuiz(int groupHeaderNo) throws Exception;
}
