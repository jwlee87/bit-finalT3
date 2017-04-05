package kr.co.coily.repository.vo;

import java.util.Date;

public class GroupDetailVO {
	
	private int groupDetailNo;
	private int groupHeaderNo;
	private int userNo;
	private String groupDetailConf;
	private Date groupDetailRegDate;
	private String groupHeaderName;
	
	
	public String getGroupHeaderName() {
		return groupHeaderName;
	}
	public void setGroupHeaderName(String groupHeaderName) {
		this.groupHeaderName = groupHeaderName;
	}
	public int getGroupDetailNo() {
		return groupDetailNo;
	}
	public void setGroupDetailNo(int groupDetailNo) {
		this.groupDetailNo = groupDetailNo;
	}
	public int getGroupHeaderNo() {
		return groupHeaderNo;
	}
	public void setGroupHeaderNo(int groupHeaderNo) {
		this.groupHeaderNo = groupHeaderNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getGroupDetailConf() {
		return groupDetailConf;
	}
	public void setGroupDetailConf(String groupDetailConf) {
		this.groupDetailConf = groupDetailConf;
	}
	public Date getGroupDetailRegDate() {
		return groupDetailRegDate;
	}
	public void setGroupDetailRegDate(Date groupDetailRegDate) {
		this.groupDetailRegDate = groupDetailRegDate;
	}
	
	
	
}
