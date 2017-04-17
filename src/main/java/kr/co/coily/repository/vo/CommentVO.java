package kr.co.coily.repository.vo;

import java.util.Date;

public class CommentVO {
	private int cardCommentNo;
	private int cardNo;
	private int userNo;
	private String userNickName;
	private String cardCommentContent;
	private Date cardCommentRegDate;
	
	
	public int getCardCommentNo() {
		return cardCommentNo;
	}
	public void setCardCommentNo(int cardCommentNo) {
		this.cardCommentNo = cardCommentNo;
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
	public String getCardCommentContent() {
		return cardCommentContent;
	}
	public void setCardCommentContent(String cardCommentContent) {
		this.cardCommentContent = cardCommentContent;
	}
	public Date getCardCommentRegDate() {
		return cardCommentRegDate;
	}
	public void setCardCommentRegDate(Date cardCommentRegDate) {
		this.cardCommentRegDate = cardCommentRegDate;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
}
