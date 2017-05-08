package kr.co.coily.repository.vo;

import java.util.Date;

public class QuizVO {
	
	private int quizNo;
	private int userNo;
	private String quizTitle;
	private String quizContent;
	private String quizWriteType;
	private String quizUrlType;
	private String quizAnswer;
	private Date quizRegDate;
	private String regDate;
	private String userNickName;
	private int groupHeaderNo;

	public int getQuizNo() {
		return quizNo;
	}
	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getQuizTitle() {
		return quizTitle;
	}
	public void setQuizTitle(String quizTitle) {
		this.quizTitle = quizTitle;
	}
	public String getQuizContent() {
		return quizContent;
	}
	public void setQuizContent(String quizContent) {
		this.quizContent = quizContent;
	}
	public String getQuizWriteType() {
		return quizWriteType;
	}
	public void setQuizWriteType(String quizWriteType) {
		this.quizWriteType = quizWriteType;
	}
	public String getQuizUrlType() {
		return quizUrlType;
	}
	public void setQuizUrlType(String quizUrlType) {
		this.quizUrlType = quizUrlType;
	}
	public String getQuizAnswer() {
		return quizAnswer;
	}
	public void setQuizAnswer(String quizAnswer) {
		this.quizAnswer = quizAnswer;
	}
	public Date getQuizRegDate() {
		return quizRegDate;
	}
	public void setQuizRegDate(Date quizRegDate) {
		this.quizRegDate = quizRegDate;
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
	public int getGroupHeaderNo() {
		return groupHeaderNo;
	}
	public void setGroupHeaderNo(int groupHeaderNo) {
		this.groupHeaderNo = groupHeaderNo;
	}
	
	
	
	

}
