package kr.co.coily.card.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.coily.card.service.CardService;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.CommentVO;
import kr.co.coily.repository.vo.SearchVO;
import kr.co.coily.repository.vo.UserVO;

@Controller
@RequestMapping("/card")
public class CardContorller {
	@Autowired
	private CardService Service;

	/*카드 리스트	====================================================================*/
	/*==============================================================================*/
	
	// 리스트 조회 url 호출(페이지 이동)
		@RequestMapping("/list.do")
		public void locationList() throws Exception{
			System.out.println("123123123");
//			return "card/list";
		}
		
		// 리스트 조회 ajax 호출
		@ResponseBody
		@RequestMapping("/cardList.do")
		public Map<String, Object> list(SearchVO search) throws Exception{
			System.out.println("cardList 들어와야돼 ㅠㅠㅠㅠㅠㅠ제발  ㅠㅠㅠㅠㅠ");
			Map<String, Object> result = Service.list(search);
			return result;
		}
	
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
	@RequestMapping("/writeForm.do")
	public void writeForm() throws Exception{
		
	}
	
	@ResponseBody
	@RequestMapping("/write.do")
	public String write(HttpServletRequest request) throws Exception{
		System.out.println("등록은 어디까지 가나?");
		System.out.println("내용 : "  + request.getParameter("cardContent") );
		
		CardVO cardVO = new CardVO();
		cardVO.setCardContent(request.getParameter("cardContent"));
		cardVO.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		
		Service.write(cardVO);
//		Service.file(cardVO);
		return "";
		
	}
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
	
	
	/*카드 상세조회  ======================================================================*/
	/*==============================================================================*/
	
	@RequestMapping("/detail.do")
	public Map<String, Object> detail(int cardNo) throws Exception {
		Map<String, Object> map  = Service.detail(cardNo);
		Map<String, Object> result = new HashMap<>();
		result.put("detail", map.get("cardVO"));
		CardVO cardVO = new CardVO();
		cardVO.setUserNo(cardNo);
//		result.put("file", map.get("file"));
//		System.out.println(result);
		return result;
		
	
		
//		CardVO card = new CardVO();
//		card.setUserNo(cardNo);
//		card.set(Request.getParameter("userNickName"));
//		card.setTitle(Request.getParameter("title"));;
//		param.put("card", card);
	}
	/*카드 상세조회  ======================================================================*/
	/*==============================================================================*/
	
	
	
	/*카드 수정  ======================================================================*/
	/*==============================================================================*/
	@ResponseBody
	@RequestMapping("/update.do")
	public String update(CardVO card) throws Exception {
		System.out.println("카드넘버 : " + card.getCardNo());
		System.out.println("수정내용 : " + card.getCardContent());
		System.out.println("회원번호 : " + card.getUserNo());
		
		card.setCardContent(card.getCardContent());
		Service.update(card);
		return "ok";
	}
//		card.setFileGroupNo(fileGroupNo);
	/*카드 수정  ======================================================================*/
	/*==============================================================================*/
	
	
	
	/*카드 삭제  ======================================================================*/
	/*==============================================================================*/
	
	
	@RequestMapping("/delete.do")
	public String delete(int cardNo, RedirectAttributes attr) throws Exception {
		System.out.println("삭제되나요???????");
		Service.delete(cardNo);
		return "redirect:list.do";
	}
	
	/*카드 삭제  ======================================================================*/
	/*==============================================================================*/
	
	
	
	
	/*댓글 리스트 와 등록  ======================================================================*/
	/*==============================================================================*/
	@RequestMapping("/commentList.do")
	@ResponseBody
	public List<CommentVO> commentList(int cardNo) throws Exception {
		System.out.println( "댓글리스트 번호 : " + cardNo);
		
		return Service.commentList(cardNo);
	}
	
	@RequestMapping("/commentRegist.do")
	@ResponseBody
	public List<CommentVO> commentRegist(CommentVO comment, HttpSession session) throws Exception {
		System.out.println("카드 번호 : " + comment.getCardNo());
		System.out.println("카드 댓글 내용 : " + comment.getCardCommentContent());
		
		UserVO user = (UserVO)session.getAttribute("user");
		comment.setUserNo(user.getUserNo());
//		comment.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		System.out.println("댓글 등록번호 :" + comment);
		System.out.println(user.getUserNo());

		return Service.commentRegist(comment);
	}
	
	/*댓글 리스트 와 등록  ======================================================================*/
	/*==============================================================================*/
	
	
	/*댓글 리스트 수정  ======================================================================*/
	/*==============================================================================*/
	@RequestMapping("/commentUpdate.do")
	@ResponseBody
	public List<CommentVO> commentUpdate(CommentVO comment, HttpServletRequest request) throws Exception {
		System.out.println(comment.getCardCommentContent());
		System.out.println("컨트롤러 수정");
		comment.setUserNickName(request.getParameter("CardCommentContent"));
		return Service.commentUpdate(comment);
	}
	
	/*댓글 리스트 수정  ======================================================================*/
	/*==============================================================================*/
	
	
	/*댓글 리스트 삭제  ======================================================================*/
	/*==============================================================================*/
	@RequestMapping("/commentDelete.do")
	@ResponseBody
	public List<CommentVO> commentDelete(CommentVO comment) throws Exception {
//		System.out.println(commentDelete(comment));
		System.out.println("댓글 삭제");
		
		return Service.commentDelete(comment);
	}
	
	/*댓글 리스트 삭제  ======================================================================*/
	/*==============================================================================*/

}

