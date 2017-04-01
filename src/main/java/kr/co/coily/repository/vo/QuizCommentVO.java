package kr.co.coily.repository.vo;

public class QuizCommentVO {
	private int quizCommentNo;
	private int quizNo;
	private int userNo;
	private String quizCommentContent;
	private String quizCommentRegDate;
	
	public int getQuizCommentNo() {
		return quizCommentNo;
	}
	public void setQuizCommentNo(int quizCommentNo) {
		this.quizCommentNo = quizCommentNo;
	}
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
	public String getQuizCommentContent() {
		return quizCommentContent;
	}
	public void setQuizCommentContent(String quizCommentContent) {
		this.quizCommentContent = quizCommentContent;
	}
	public String getQuizCommentRegDate() {
		return quizCommentRegDate;
	}
	public void setQuizCommentRegDate(String quizCommentRegDate) {
		this.quizCommentRegDate = quizCommentRegDate;
	}
}
