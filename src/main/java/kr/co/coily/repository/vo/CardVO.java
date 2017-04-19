package kr.co.coily.repository.vo;

import java.util.Date;

public class CardVO {
	private int cardNo;
	private int userNo;
	private String userNickName;
	private String cardContent;
	private Date cardRegDate;
	private int fileGroupNo;
	private String userImgPath;
	
	public String getUserImgPath() {
		return userImgPath;
	}
	public void setUserImgPath(String userImgPath) {
		this.userImgPath = userImgPath;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getCardContent() {
		return cardContent;
	}
	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}
	public Date getCardRegDate() {
		return cardRegDate;
	}
	public void setCardRegDate(Date cardRegDate) {
		this.cardRegDate = cardRegDate;
	}
	public int getFileGroupNo() {
		return fileGroupNo;
	}
	public void setFileGroupNo(int fileGroupNo) {
		this.fileGroupNo = fileGroupNo;
	}

}
