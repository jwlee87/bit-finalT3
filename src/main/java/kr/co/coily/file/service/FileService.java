package kr.co.coily.file.service;

import java.util.List;

import kr.co.coily.repository.vo.FileItemVO;

public interface FileService {
	public void insertFile(List<FileItemVO> lFile) throws Exception;
}
