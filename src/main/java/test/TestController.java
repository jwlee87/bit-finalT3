package test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
	
	@Autowired
	private TestServiceImpl service;
	
	@RequestMapping("/test.do")
	public List<TestVO> selectList() throws Exception {
		
		List<TestVO> test = service.selectList();
		return test;
		
	}
	
}
