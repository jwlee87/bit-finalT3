package kr.co.coily.repository.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coily.repository.vo.FileItemVO;

@Repository
public class FileDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertFile(List<FileItemVO> lFile) throws Exception {
		System.out.println("dao");
		
		for(FileItemVO item: lFile) {
			sqlSessionTemplate.insert("kr.co.coily.repository.dao.fileDAO.insertFileItem", item);
		}
		
		System.out.println("dao 성공");
		
	}

	public FileItemVO selectFileInfo(int fileNo) {
		return sqlSessionTemplate.selectOne("kr.co.coily.repository.dao.fileDAO.selectFileItem", fileNo);
	}

	public void insertOneFile(FileItemVO fileItem) {
		sqlSessionTemplate.insert("kr.co.coily.repository.dao.fileDAO.insertOneFile", fileItem);
	}
}
