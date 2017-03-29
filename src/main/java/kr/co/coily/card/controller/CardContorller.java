package kr.co.coily.card.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.coily.card.service.CardService;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.SearchVO;

@Controller
@RequestMapping
@RestController
public class CardContorller {
	@Autowired
	private CardService service;
	
	@ResponseBody
	@RequestMapping("/list.do")
	public Map<String, Object> list(SearchVO search) throws Exception{
		System.out.println("보드컨트롤러 어디까지 오냐");
		Map<String, Object> map = service.list(search);
		return map;
	}
}
