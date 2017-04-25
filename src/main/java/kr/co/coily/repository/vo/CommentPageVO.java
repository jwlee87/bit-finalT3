package kr.co.coily.repository.vo;

public class CommentPageVO {
	private int pageNo = 1;

	public int getBegin() {
		return (pageNo -1) * 5;
	}
	public int getEnd() {
		return pageNo * 5;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
