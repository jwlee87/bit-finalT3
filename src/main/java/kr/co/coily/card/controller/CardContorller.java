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
import org.springframework.web.servlet.ModelAndView;

import kr.co.coily.card.service.CardService;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.CommentVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;
import kr.co.coily.repository.vo.UserVO;

@Controller
@RequestMapping("/card")
public class CardContorller {
	@Autowired
	private CardService Service;

	/*카드 리스트	====================================================================*/
	// 리스트 조회 url 호출(페이지 이동)
	@RequestMapping("/list.do")
	public void locationList() throws Exception{
		System.out.println("123123123");
//			return "card/list";
		}
		
	// 리스트 조회 ajax 호출
	@ResponseBody
	@RequestMapping("/cardList.do")
	public Map<String, Object> list(SearchVO search, HttpSession session) throws Exception{
		System.out.println("cardList 들어와야돼 ㅠㅠㅠㅠㅠㅠ제발  ㅠㅠㅠㅠㅠ");
		UserVO user = (UserVO)session.getAttribute("user");
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		search.setUserNo(user.getUserNo());
		search.setGroupHeaderNo(group.getGroupHeaderNo());
		Map<String, Object> result = Service.list(search);
		return result;
	}
		
	//스크롤 다운
	@RequestMapping("/cardScrollDown.do")
	@ResponseBody
	public List<CardVO> scrollDown(String cardNo, HttpSession session) throws Exception{
		int cardN = Integer.parseInt(cardNo);
//		System.out.print("cardN..........................."  + cardN);
		UserVO user = (UserVO)session.getAttribute("user");
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		CardVO card = new CardVO();
		card.setUserNo(user.getUserNo());
		card.setCardNo(cardN-1);
		card.setGroupHeaderNo(group.getGroupHeaderNo());
		return Service.cardScrollDown(card);
	}
	
	/*카드 등록  ======================================================================*/
	@RequestMapping("/writeForm.do")
	public ModelAndView writeForm() throws Exception{
		ModelAndView mav = new ModelAndView("card/writeForm");
		mav.addObject("cardNo", Service.selectCardNo());
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/write.do")
	public String write(HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("등록은 어디까지 가나?");
		System.out.println("내용 : "  + request.getParameter("cardContent") );
		
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		CardVO cardVO = new CardVO();
		cardVO.setCardNo(Integer.parseInt(request.getParameter("wCardNo")));
		cardVO.setCardContent(request.getParameter("cardContent"));
		cardVO.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		cardVO.setGroupHeaderNo(group.getGroupHeaderNo());
		
		Service.updateInitCard(cardVO);
//		Service.write(cardVO);
		return "";
		
	}

	
	/*카드 상세조회  ======================================================================*/
	@RequestMapping("/detail.do")
	public Map<String, Object> detail(int cardNo) throws Exception {
		Map<String, Object> map  = Service.detail(cardNo);
		Map<String, Object> result = new HashMap<>();
		result.put("detail", map.get("cardVO"));
		result.put("fileList", map.get("fileList"));
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxDetail.do")
	public Map<String, Object> ajaxdetail(int cardNo) throws Exception {
		Map<String, Object> map  = Service.detail(cardNo);
		Map<String, Object> result = new HashMap<>();
		result.put("detail", map.get("cardVO"));
		result.put("fileList", map.get("fileList"));
		return result;
	}
	
	@RequestMapping("/deleteFile.do")
	@ResponseBody
	public String deleteFile(int fileNo) throws Exception {
		Service.deleteFileItem(fileNo);
		return "";
	}
	
	/*카드 수정  ======================================================================*/
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
	
	/*카드 삭제  ======================================================================*/
	@RequestMapping("/delete.do")
	@ResponseBody
	public String delete(int cardNo) throws Exception {
		System.out.println("삭제되나요???????");
		System.out.println("카드번호..................."+ cardNo);
		Service.delete(cardNo);
		return "";
	}
	
	/*댓글 리스트 와 등록  ======================================================================*/
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
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		comment.setUserNo(user.getUserNo());
//		comment.setGroupHeaderNo(group.getGroupHeaderNo());
//		comment.setUserNo(Integer.parseInt(request.getParameter("userNo")));
		System.out.println("#####그룹넘버 : " + group.getGroupHeaderNo());
		System.out.println("댓글 등록번호 :" + comment);
		System.out.println(user.getUserNo());

		return Service.commentRegist(comment);
	}
	
	/*댓글 리스트 수정  ======================================================================*/
	@RequestMapping("/commentUpdate.do")
	@ResponseBody
	public List<CommentVO> commentUpdate(CommentVO comment, HttpServletRequest request) throws Exception {
		System.out.println(comment.getCardCommentContent());
		System.out.println("컨트롤러 수정");
		comment.setUserNickName(request.getParameter("CardCommentContent"));
		return Service.commentUpdate(comment);
	}
	
	/*댓글 리스트 삭제  ======================================================================*/
	@RequestMapping("/commentDelete.do")
	@ResponseBody
	public List<CommentVO> commentDelete(CommentVO comment) throws Exception {
//		System.out.println(commentDelete(comment));
		System.out.println("댓글 삭제");
		
		return Service.commentDelete(comment);
	}

}

