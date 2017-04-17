package kr.co.coily.card.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.coily.card.service.CardService;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.CommentVO;
import kr.co.coily.repository.vo.SearchVO;

@Controller
@RequestMapping("/card")
public class CardContorller {
	@Autowired
	private CardService Service;

	/*카드 리스트	====================================================================*/
	/*==============================================================================*/
	
	@RequestMapping("/list.do")
	public void list(SearchVO search, Model model) throws Exception{
		System.out.println("카드 컨트롤러 어디 까지 오냐");
		Map<String, Object> result = Service.list(search);
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	/*카드 리스트	====================================================================*/
	/*==============================================================================*/
	
	
	
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
		System.out.println( "컨트롤러 : " + cardNo);
		List<CommentVO> tmp = Service.commentList(cardNo);
		for(CommentVO c : tmp){
			System.out.println(c.getCardCommentContent());
			System.out.println("댓글 쓴인간" + c.getUserNickName());
		}
//		System.out.println("tmp:" + tmp);
		return tmp;
	}
	
	@RequestMapping("/commentRegist.do")
	@ResponseBody
	public List<CommentVO> commentRegist(CommentVO comment) throws Exception {
		
		System.out.println("카드번호 :" + comment);
		return Service.commentRegist(comment);
	}
		
	
	/*댓글 리스트 와 등록  ======================================================================*/
	/*==============================================================================*/
	
	
	/*댓글 리스트 수정  ======================================================================*/
	/*==============================================================================*/
	@RequestMapping("/commentUpdate.do")
	@ResponseBody
	public List<CommentVO> commentUpdate(CommentVO comment) throws Exception {
		return Service.commentUpdate(comment);
	}
	
	/*댓글 리스트 수정  ======================================================================*/
	/*==============================================================================*/
	
	
	/*댓글 리스트 삭제  ======================================================================*/
	/*==============================================================================*/
	/*@RequestMapping("/commentDelete.do")
	@ResponseBody
	public List<CommentVO> commentDelete(CommentVO comment) throws Exception {
		return Service.commentDelete(comment);
	}*/
	
	/*댓글 리스트 삭제  ======================================================================*/
	/*==============================================================================*/


}

