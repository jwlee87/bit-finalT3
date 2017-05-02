package kr.co.coily.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.MainDAO;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.QuizVO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDAO dao;
	

	@Override
	public List<CardVO> selectTop5Card() throws Exception {
		return dao.selectCard();
	}

	@Override
	public List<QuizVO> selectTop5Quiz() throws Exception {
		return dao.selectQuiz();
	}
	
	

}
