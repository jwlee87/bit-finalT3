package kr.co.coily.repository.vo;

import java.util.Date;

public class FavoriteVO {
	private int favoriteNo;
	private int cardNo;
	private int userNo;
	private Date favoriteRegDate;
	private String cardContent;
	private String userImgPath;
	private String userNickName;
	private int groupHeaderNo;
	private String groupHeaderName;
	
	public String getGroupHeaderName() {
		return groupHeaderName;
	}
	public void setGroupHeaderName(String groupHeaderName) {
		this.groupHeaderName = groupHeaderName;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getCardContent() {
		return cardContent;
	}
	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}
	public String getUserImgPath() {
		return userImgPath;
	}
	public void setUserImgPath(String userImgPath) {
		this.userImgPath = userImgPath;
	}
	public int getFavoriteNo() {
		return favoriteNo;
	}
	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
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
	public Date getFavoriteRegDate() {
		return favoriteRegDate;
	}
	public void setFavoriteRegDate(Date favoriteRegDate) {
		this.favoriteRegDate = favoriteRegDate;
	}
	public int getGroupHeaderNo() {
		return groupHeaderNo;
	}
	public void setGroupHeaderNo(int groupHeaderNo) {
		this.groupHeaderNo = groupHeaderNo;
	}
	
	
	
	
}
