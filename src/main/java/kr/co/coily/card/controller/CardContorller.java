package kr.co.coily.card.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.card.service.CardService;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.SearchVO;

@Controller
@RequestMapping("/card")
public class CardContorller {
	@Autowired
	private CardService service;

	/*카드 리스트	====================================================================*/
	/*==============================================================================*/
	
	@ResponseBody
	@RequestMapping("/list.do")
	public Map<String, Object> list(SearchVO search) throws Exception{
		System.out.println("보드컨트롤러 어디 까지 오냐");
		Map<String, Object> map = service.list(search);
		return map;
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
		service.write(cardVO);
		return "";
		
	}
	/*카드 등록  ======================================================================*/
	/*==============================================================================*/
}
