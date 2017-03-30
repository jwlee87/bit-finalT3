package kr.co.coily.repository.vo;

import java.util.Date;

public class UserVO {
	private int userNo;
	private String userEmail;
	private String userPsw;
	private String userNickName;
	private Date userRegDate;
	private String userStatus;
	private int userJoinNo;
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
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
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
