package kr.co.coily.card.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.CardDAO;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.CommentVO;
import kr.co.coily.repository.vo.FileItemVO;
import kr.co.coily.repository.vo.SearchVO;

@Service
public class CardServiceImpl implements CardService{

	@Autowired
	private CardDAO dao;
	
	/*카드 리스트	====================================================================*/
	@Override
	public Map<String, Object> list(SearchVO search) throws Exception {
		System.out.println("카드 서비스 어디까지 오냐");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", dao.selectCard(search));
		return result;
	}
	//스크롤 다운
	@Override
	public List<CardVO> cardScrollDown(CardVO card) throws Exception {
		return dao.cardScrollDown(card);
	}
	
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
	public int selectCardNo() throws Exception {
		return dao.selectCardNo();
	}
		
	@Override
	public void write(CardVO cardVO) throws Exception {
		dao.insertCard(cardVO);
	}

	public void updateInitCard(CardVO cardVO) throws Exception {
		dao.updateInitCard(cardVO);
	}
	
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
		result.put("fileList", dao.selectFileItem(no));
		return result;
	}
	
	public void deleteFile(int cardNo) throws Exception {
		dao.deleteFile(cardNo);
	}
	
	public void deleteFileItem(int fileNo) throws Exception {
		dao.deleteFileItem(fileNo);
	}
	
	/*카드 수정  ======================================================================*/
	/*==============================================================================*/
	@Override
	public void update(CardVO card) throws Exception{
		dao.updateCard(card);
	}
	
	/*카드 삭제  ======================================================================*/
	/*==============================================================================*/
	
	@Override
	public void delete(int no) throws Exception {
		dao.deleteCard(no);
	}
	
	/*댓글 리스트  ======================================================================*/
	/*==============================================================================*/
	@Override
	public List<CommentVO> commentList(int cardNo) throws Exception {
		System.out.println("댓글 목록 넘어오나");
		
		System.out.println( "서비스임플 : " + cardNo);
		return dao.selectCardCommentByNo(cardNo);
	}
	
	@Override
	public List<CommentVO> commentRegist(CommentVO comment) throws Exception {
		System.out.println("댓글 리스트 등록 넘어오나");
		System.out.println("등록 전 서비스 임플 카드번호 : " + comment.getCardNo());
		dao.insertCardComment(comment);
		System.out.println("서비스 임플 카드번호 : " + comment.getCardNo());
		return dao.selectCardCommentByNo(comment.getCardNo());
	}
	
	/*댓글 수정  ======================================================================*/
	/*==============================================================================*/
	@Override
	public List<CommentVO> commentUpdate(CommentVO comment) throws Exception {
		System.out.println("서비스 임플 댓글 수정");
		System.out.println("수정 전 서비스 임플 카드번호 : " + comment.getCardNo());
		dao.updateCardComment(comment);
		System.out.println("수정 후 서비스 임플 카드번호 : " + comment.getCardNo());
		return dao.selectCardCommentByNo(comment.getCardNo());
	}
	
	/*댓글 삭제  ======================================================================*/
	/*==============================================================================*/
	@Override
	public List<CommentVO> commentDelete(CommentVO comment) throws Exception {
		System.out.println("서비스 일플 댓글 삭제");
		
		dao.deleteCardComment(comment.getCardCommentNo());
		System.out.println("삭제되는 서비스 임플 카드번호 : " + comment.getCardCommentNo());
		return dao.selectCardCommentByNo(comment.getCardNo());
	}

}
