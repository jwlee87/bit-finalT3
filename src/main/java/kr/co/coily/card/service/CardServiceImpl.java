package kr.co.coily.card.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.CardDAO;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.PageResultVO;
import kr.co.coily.repository.vo.SearchVO;

@Service
public class CardServiceImpl implements CardService{

	@Autowired
	private CardDAO dao;
	
	/*카드 리스트	====================================================================*/
	/*==============================================================================*/
	@Override
	public Map<String, Object> list(SearchVO search) throws Exception {
		System.out.println("서비스 어디까지 오냐");
		Map<String, Object> result = new HashMap<>();
		result.put("list", dao.selectCard(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectCard(search)));
		return result;
	}
	
	
	/*@Override
	public list<CardVO> listResult(PageResultVO prv) throws Exception{
		
		return dao.insertCard(prv);*/
	
	
	
	
	/*카드 리스트	====================================================================*/
	/*==============================================================================*/

	
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
	@Override
	public void write(CardVO cardVO) throws Exception {
		dao.insertCard(cardVO);
	}
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
}
