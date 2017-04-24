package kr.co.coily.repository.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coily.repository.vo.FavoriteVO;
import kr.co.coily.repository.vo.SearchVO;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 보관함 등록
	public void insertFavorite(FavoriteVO favorite) {
		sqlSessionTemplate.insert("kr.co.coily.repository.dao.FavoriteDAO.insertFavorite", favorite);
	}
	
	// 보관함 삭제
	public void deleteFavorite(int cardNo) {
		sqlSessionTemplate.delete("kr.co.coily.repository.dao.FavoriteDAO.deleteFavorite", cardNo);
	}
	
	// 보관함 리스트 조회
	public List<FavoriteVO> retrieveFavorite(SearchVO search){
		return sqlSessionTemplate.selectList("kr.co.coily.repository.dao.FavoriteDAO.selectFCard", search);
	}
	
	// 보관함 리스트 전체 수 조회
	public int selectFCnt(SearchVO search){
		return sqlSessionTemplate.selectOne("kr.co.coily.repository.dao.FavoriteDAO.selectFCnt", search);
	}
	
	
}
