package kr.co.coily.favorite.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.favorite.service.FavoriteServiceImpl;
import kr.co.coily.repository.vo.FavoriteVO;
import kr.co.coily.repository.vo.SearchVO;

@Controller
@RequestMapping("/favorite")
public class FavoriteContorller  {
	
	@Autowired
	private FavoriteServiceImpl service;
	
	// 등록
	@ResponseBody
	@RequestMapping("/favoriteInsert.do")
	public String insertFavorite(HttpServletRequest request) throws Exception {
		System.out.println("보관함 등록하실게용");
		FavoriteVO favorite = new FavoriteVO();
		favorite.setCardNo(Integer.parseInt(request.getParameter("cardNo")));
		favorite.setUserNo(1);
		
		service.insertFavorite(favorite);
		return "";
	}
	
	// 삭제
	@RequestMapping("/favoriteDelete.do")
	@ResponseBody
	public String deleteFavorite(int cardNo) throws Exception {
		service.deleteFavorite(cardNo);
		return "";
	}
	
	// 리스트 조회
	@RequestMapping("/favoriteList.do")
	public String retrieveFavorite(SearchVO search, Model model) throws Exception {
		Map<String, Object> map = service.retreiveFavorite(search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult", map.get("pageResult"));
		return "favorite/favoriteList";
	}
}
