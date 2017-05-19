package kr.co.coily.file.service;

import java.util.List;

import kr.co.coily.repository.vo.FileItemVO;

public interface FileService {
	public void insertFile(List<FileItemVO> lFile) throws Exception;

	public int selectEmptyCard(int fileRefNo) throws Exception;
	public void insertCardEmpty(int fileRefNo) throws Exception;
	public void deleteFile(int fileNo) throws Exception;
	public int selectFile(int fileRefNo) throws Exception;
	public FileItemVO selectFileInfo(int fileNo) throws Exception;

	public void insertOneFile(FileItemVO fileItem) throws Exception;
}
