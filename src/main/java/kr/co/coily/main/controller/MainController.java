package kr.co.coily.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@RequestMapping("/main.do")
	public void view() {
		System.out.println("mainView");
	}

}
