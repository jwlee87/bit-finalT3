package kr.co.coily.repository.dao;

import java.util.List;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.SearchVO;

public interface CardDAO {

	/* 카드 게시판	*/
	/* ==================================================================*/

//	public List<CardVO> selectCard()throws Exception;
	
//	public List<CardVO> cardPage(int page)throws Exception;
	
//	public List<CardVO> cardPageResultVO(PageResultVO prv)throws Exception;
	
	public List<CardVO> selectCard(SearchVO Search) throws Exception;
	
	public int selectCardCount(SearchVO Search) throws Exception;
	
	public CardVO selectOneCard(int no) throws Exception;
	
	
	/* 카드 게시판	*/
	/* ==================================================================*/
	
	
	/* 카드 등록	*/
	/* ==================================================================*/
	public void insertCard(CardVO cardVO) throws Exception;
	
	/* ==================================================================*/
	/* 카드 등록	*/
}
