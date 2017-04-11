package kr.co.coily.common.file;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/file")
@Controller
public class fileController {
	
	@RequestMapping("/fileTest.do")
	public String fileForm() throws Exception {
		return "file/fileTest";
	}
	
	
	@RequestMapping("/writeForm.do")
	public String writeForm() throws Exception {
		return "file/fileForm";
	}
}
