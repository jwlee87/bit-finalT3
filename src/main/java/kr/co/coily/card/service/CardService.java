package kr.co.coily.card.service;

import java.util.List;
import java.util.Map;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.CommentVO;
import kr.co.coily.repository.vo.SearchVO;

public interface CardService {
	
	/* 카드 게시판	*/
	public Map<String, Object> list(SearchVO search)throws Exception;
	public Map<String, Object> detail(int cardNo) throws Exception;
	public void detail(CardVO cardVO) throws Exception;
	public void deleteFile(int cardNo) throws Exception;
	public void deleteFileItem(int fileNo) throws Exception;

	/* 카드 등록	*/
	public void write(CardVO cardVO) throws Exception;
	public int isRegCard(int cardNo) throws Exception;
	public void updateInitCard(CardVO cardVO) throws Exception;
	public int selectCardNo() throws Exception;

	/* 카드 수정	*/
	public void update(CardVO card) throws Exception;

	/* 카드 삭제	*/
	public void delete(int no) throws Exception;

	/* 댓글 리스트	*/
	public List<CommentVO> commentList(int cardNO) throws Exception ;
	public List<CommentVO> commentRegist(CommentVO comment) throws Exception;
	//스크롤 다운
	public List<CardVO> cardScrollDown(CardVO card) throws Exception;
	
	/* 댓글 수정	*/
	public List<CommentVO> commentUpdate(CommentVO comment) throws Exception;

	/* 댓글 삭제	*/
	public List<CommentVO> commentDelete(CommentVO comment) throws Exception ;
	
	
}
