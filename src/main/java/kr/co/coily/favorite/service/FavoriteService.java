package kr.co.coily.favorite.service;

import java.util.Map;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.FavoriteVO;
import kr.co.coily.repository.vo.SearchVO;

public interface FavoriteService {
	
	// 보관함 등록 
	public void insertFavorite(FavoriteVO favorite);
	
	// 보관함 삭제
	public void deleteFavorite(int cardNo);
	
	// 보관함 리스트 조회
	public Map<String, Object> retreiveFavorite(SearchVO search);
	
	// 보관함 카드 메일 공유
	public CardVO sendFCard(SearchVO search);
}
