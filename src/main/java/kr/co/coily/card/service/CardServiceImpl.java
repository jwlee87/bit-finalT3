package kr.co.coily.card.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.CardDAO;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.CommentVO;
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
		System.out.println("카드 서비스 어디까지 오냐");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", dao.selectCard(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectCardCount(search)));
		return result;
	}
	
	/*카드 리스트	====================================================================*/
	/*==============================================================================*/

	
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
	@Override
	public void write(CardVO cardVO) throws Exception {
		dao.insertCard(cardVO);
	}

	/*@Override
	public void file(CardVO cardVO) throws Exception {
		dao.insertFile(cardVO);
	}*/
	
	
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
	
	
	
	/*카드 상세  ======================================================================*/
	/*==============================================================================*/
	@Override
	public void detail(CardVO cardVO) throws Exception {
		dao.insertCard(cardVO);
	}
	@Override
	public Map<String, Object> detail(int no) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("cardVO", dao.selectDetailCard(no));
//		result.put("file", dao.selectFileByNo(no));
		return result;
	}
	
	/*카드 상세  ======================================================================*/
	/*==============================================================================*/
	
	
	/*카드 수정  ======================================================================*/
	/*==============================================================================*/
	
	@Override
	public void update(CardVO card) throws Exception{
		dao.updateCard(card);
	}
	
	/*@Override
	public CardVO updateForm(int no) throws Exception{
		return dao.selectDetailCard(no);
	}*/
	
	
	/*카드 수정  ======================================================================*/
	/*==============================================================================*/

	
	/*카드 삭제  ======================================================================*/
	/*==============================================================================*/
	
	@Override
	public void delete(int no) throws Exception {
		dao.deleteCard(no);
	}
	
	
	/*카드 삭제  ======================================================================*/
	/*==============================================================================*/


	
	/*댓글 리스트  ======================================================================*/
	/*==============================================================================*/
		
	
	
	
	
	/*댓글 리스트  ======================================================================*/
	/*==============================================================================*/
	@Override
	public List<CommentVO> commentList(int no) throws Exception {
		System.out.println("댓글 목록 넘어오나");
		
		System.out.println( "서비스임플 : " + no);
		return dao.selectCardCommentByNo(no);
	}
	
	@Override
	public List<CommentVO> commentRegist(CommentVO comment) throws Exception {
		System.out.println("댓글 리스트 등록 넘어오나");
		dao.insertCardComment(comment);
		return dao.selectCardCommentByNo(comment.getCardCommentNo());
	}
	
		
		
	/*댓글 수정  ======================================================================*/
	/*==============================================================================*/
	@Override
	public List<CommentVO> commentUpdate(CommentVO comment) throws Exception {
		dao.updateCardComment(comment);
		return dao.selectCardCommentByNo(comment.getCardNo());
	}
	
	/*댓글 수정  ======================================================================*/
	/*==============================================================================*/
	
	
	/*댓글 삭제  ======================================================================*/
	/*==============================================================================*/
	/*@Override
	public List<CommentVO> commentDelete(CommentVO comment) throws Exception {
		dao.deleteCardComment(comment.getCardCommentNo());
		return dao.selectCardCommentByNo(comment.getCardNo());
	}*/
	
	/*댓글 삭제  ======================================================================*/
	/*==============================================================================*/
}
