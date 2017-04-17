package kr.co.coily.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.FileDAO;
import kr.co.coily.repository.vo.FileItemVO;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDAO dao;
	
	@Override
	public void insertFile(List<FileItemVO> lFile) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스");
		dao.insertFile(lFile);
		System.out.println("서비스 성공");
	}

}
