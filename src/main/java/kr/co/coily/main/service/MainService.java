package kr.co.coily.main.service;

import java.util.List;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.QuizVO;

public interface MainService {
	
	public List<CardVO> selectTop5Card(int headerNo) throws Exception;
	public List<QuizVO> selectTop5Quiz(int groupHeaderNo) throws Exception;

}
