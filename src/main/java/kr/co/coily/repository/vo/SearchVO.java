package kr.co.coily.repository.vo;

public class SearchVO extends PageVO{
	
	private String searchWord;
	private int cardNo;
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}

}
