package kr.co.coily.repository.vo;

import java.util.Date;

public class CommentVO {
	/**카드 댓글번호*/
	private int cardCommentNo;
	/**카드 번호*/
	private int cardNo;
	/**카드 회원번호*/
	private int userNo;
	/**카드 회원별명*/
	private String userNickName;
	/**카드 댓글 내용*/
	private String cardCommentContent;
	/**카드 등록일*/
	private Date cardCommentRegDate;
	private String regDate;
//	private int groupHeaderNo;
	
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
//	public int getGroupHeaderNo() {
//		return groupHeaderNo;
//	}
//	public void setGroupHeaderNo(int groupHeaderNo) {
//		this.groupHeaderNo = groupHeaderNo;
//	}
	
}
