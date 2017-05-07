package kr.co.coily.editor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/editor")
@Controller
public class EditController {
	
	@RequestMapping("/videoChat.do")
	public String viewVideoChat() throws Exception {
		return "editor/videoChatForm";
	}
	
}

