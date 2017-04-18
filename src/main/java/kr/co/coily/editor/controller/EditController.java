package kr.co.coily.editor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/editor")
@Controller
public class EditController {
	
	@RequestMapping("/form.do")
	public String viewList() throws Exception {
		
		return "editor/editorForm";
		
	}
}
