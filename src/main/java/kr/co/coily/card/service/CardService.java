package kr.co.coily.card.service;

import java.util.Map;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.SearchVO;

public interface CardService {
	
	/* 카드 게시판	*/
	/* ==================================================================*/
	
//	List<CardVO> listPage(int page) throws Exception;
//	
//	public List<CardVO> listResultVO(PageResultVO prv) throws Exception;
	

	public Map<String, Object> list(SearchVO search)throws Exception;
	/* 카드 게시판	*/
	/* ==================================================================*/
	
	
	/* 카드 등록	*/
	/* ==================================================================*/
	public void write(CardVO cardVO) throws Exception;
	/* 카드 등록	*/
	/* ==================================================================*/

	
}
