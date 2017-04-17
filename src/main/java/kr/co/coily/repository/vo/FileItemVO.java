package kr.co.coily.repository.vo;

import java.util.Date;

public class FileItemVO {
	
	private int fileNo;
	private int fileRefNo;
	private String fileType;
	private String fileOriName;
	private String fileSysName;
	private String filePath;
	private String fileExt;
	private long fileSize;
	private Date fileRegDate;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getFileRefNo() {
		return fileRefNo;
	}
	public void setFileRefNo(int fileRefNo) {
		this.fileRefNo = fileRefNo;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	public String getFileSysName() {
		return fileSysName;
	}
	public void setFileSysName(String fileSysName) {
		this.fileSysName = fileSysName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileExt() {
		return fileExt;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public Date getFileRegDate() {
		return fileRegDate;
	}
	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}
	
	

}
