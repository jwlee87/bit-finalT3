package test;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<TestVO> selectList() {
		List<TestVO> test = sqlSessionTemplate.selectList("test.testDAO.selectList");
		return test;
	}
}
