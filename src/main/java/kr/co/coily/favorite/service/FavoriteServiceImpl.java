package kr.co.coily.favorite.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.FavoriteDAO;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.FavoriteVO;
import kr.co.coily.repository.vo.PageResultVO;
import kr.co.coily.repository.vo.SearchVO;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	private FavoriteDAO dao;
	
	// 보관함 등록
	public void insertFavorite(FavoriteVO favorite) {
		dao.insertFavorite(favorite);
	}
	
	// 보관함 삭제
	public void deleteFavorite(int cardNo) {
		dao.deleteFavorite(cardNo);
	}

	// 보관함 리스트 조회
	public Map<String, Object> retreiveFavorite(SearchVO search) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", dao.retrieveFavorite(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectFCnt(search)));
		return result;
	}
	
	// 보관함 카드 메일 공유
	public CardVO sendFCard(SearchVO search) {
		CardVO card = dao.sendFCard(search);
		return card;
	}

}
