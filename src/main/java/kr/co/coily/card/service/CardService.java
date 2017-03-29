package kr.co.coily.card.service;

import java.util.Map;

import kr.co.coily.repository.vo.SearchVO;

public interface CardService {
	
	public Map<String, Object> list(SearchVO search)throws Exception;
	
//	public void write(Map<String, Object> param) throws Exception;
}
