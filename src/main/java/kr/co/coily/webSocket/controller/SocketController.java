package kr.co.coily.webSocket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/editor")
@Controller
public class SocketController {
	@RequestMapping("/form.do")
	public String viewList() throws Exception {
		
		return "code/codeEditor";
		
	}
}
