package test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDAO dao;
	
	public List<TestVO> selectList() {
		List<TestVO> test = dao.selectList();
		return test;
	}

}
