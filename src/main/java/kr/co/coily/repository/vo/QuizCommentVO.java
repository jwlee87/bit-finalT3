package kr.co.coily.repository.vo;

public class QuizCommentVO {
	
	private int quizCommentNo;
	private int quizNo;
	private int userNo;
	private String quizSolveChk;
	private String quizCommentRegDate;
	private String userNickName;
	
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
	public String getQuizSolveChk() {
		return quizSolveChk;
	}
	public void setQuizSolveChk(String quizSolveChk) {
		this.quizSolveChk = quizSolveChk;
	}
	public String getQuizCommentRegDate() {
		return quizCommentRegDate;
	}
	public void setQuizCommentRegDate(String quizCommentRegDate) {
		this.quizCommentRegDate = quizCommentRegDate;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	
	
}
