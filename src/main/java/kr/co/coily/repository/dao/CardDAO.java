package kr.co.coily.repository.dao;

import java.util.List;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.SearchVO;

public interface CardDAO {
	/* ==================================================================*/
	/* 카드 게시판						*/
	/* ==================================================================*/
	public List<CardVO> selectCard(SearchVO Search) throws Exception;
	
	public int selectCardCount(SearchVO Search) throws Exception;
	
	public CardVO selectOneCard(int no) throws Exception;
	
//	public int insertCard(CardVO card) throws Exception;
	
	/* ==================================================================*/
}
