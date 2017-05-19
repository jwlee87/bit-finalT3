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

	public int selectEmptyCard(int fileRefNo) throws Exception {
		return dao.selectEmptyCard(fileRefNo);
	}
	
	public void insertCardEmpty(int fileRefNo) throws Exception {
		dao.insertCardEmpty(fileRefNo);
	}
	
	public void deleteFile(int fileRefNo) throws Exception {
		dao.deleteFile(fileRefNo);
	}
	
	public int selectFile(int fileRefNo) throws Exception {
		return dao.selectFile(fileRefNo);
	}
	
	@Override
	public FileItemVO selectFileInfo(int fileNo) throws Exception {
		return dao.selectFileInfo(fileNo);
	}
	
	@Override
	public void insertOneFile(FileItemVO fileItem) throws Exception {
		dao.insertOneFile(fileItem);
	}

}
