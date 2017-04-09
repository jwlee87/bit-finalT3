package kr.co.coily.repository.vo;

/**회원정보*/
public class UserVO {
	/**회원번호*/
	private int userNo;
	/**이메일*/
	private String userEmail;
	/**비밀번호*/
	private String userPsw;
	/**별명*/
	private String userNickName;
	/**가입날짜*/
	private String userRegDate;
	/**로그인,로그아웃 상태*/
	private String userStatus;
	/**회원가입 승인번호*/
	private int userJoinNo;
	/**회원가입 승인 상태*/
	private String userConf;

	
	
	public int getUserJoinNo() {
		return userJoinNo;
	}
	public void setUserJoinNo(int userJoinNo) {
		this.userJoinNo = userJoinNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPsw() {
		return userPsw;
	}
	public void setUserPsw(String userPsw) {
		this.userPsw = userPsw;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(String userRegDate) {
		this.userRegDate = userRegDate;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserConf() {
		return userConf;
	}
	public void setUserConf(String userConf) {
		this.userConf = userConf;
	}
	
	
	
	

}
