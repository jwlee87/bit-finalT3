package kr.co.coily.repository.dao;

import java.util.List;

import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.CommentVO;
import kr.co.coily.repository.vo.SearchVO;

public interface CardDAO {

	/* 카드 게시판	*/
	/* ==================================================================*/
	public List<CardVO> selectCard(SearchVO Search) throws Exception;
	
	public int selectCardCount(SearchVO Search) throws Exception;
	
	public CardVO selectDetailCard(int no) throws Exception;
	
	/* 카드 게시판	*/
	/* ==================================================================*/
	
	
	/* 카드 등록	*/
	/* ==================================================================*/
	public void insertCard(CardVO cardVO) throws Exception;

//	public Object selectCardFileByNo(int no);
	
	/*public void insertFile(CardVO cardVO) throws Exception;*/
	
	/* ==================================================================*/
	/* 카드 등록	*/
	
	
	
	/* 카드 수정	*/
	/* ==================================================================*/
	 public boolean updateCard(CardVO vo) throws Exception;
	/* 카드 수정	*/
	/* ==================================================================*/
	 
	
	
	
	/* 카드 삭제	*/
	/* ==================================================================*/
	
	 public boolean deleteCard(int no) throws Exception;
	 
	/* 카드 삭제	*/
	/* ==================================================================*/
	
	 
	 /* 카드 댓글 수정 join	*/
 	 /* ==================================================================*/
	
//	 public CardVO joinCommentContent(int cardNo) throws Exception;
	 
	 /* 카드 댓글 수정 join	*/
	 /* ==================================================================*/
 
	
	 
	/* 댓글 리스트	와 등록*/
	/* ==================================================================*/
	 public List<CommentVO> selectCardCommentByNo(int cardNo) throws Exception;
	 
	 public void insertCardComment(CommentVO comment) throws Exception;
	 

	 
	/* 댓글 리스트	와 등록*/
	/* ==================================================================*/
	 
	 
	/* 댓글 수정	*/
	/* ==================================================================*/
	 public void updateCardComment(CommentVO comment) throws Exception;
	 
	/* 댓글 수정	*/
	/* ==================================================================*/
	 
	/* 댓글 삭제	*/
	/* ==================================================================*/
	 public void deleteCardComment(int commentNo) throws Exception;
	 
	/* 댓글 삭제	*/
    /* ==================================================================*/
}
