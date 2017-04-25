package kr.co.coily.repository.vo;

public class PageVO {
	private int pageNo = 0;

	public int getBegin() {
		int begin = 0;
		if(pageNo != 0) {
			begin = (pageNo -1) * 5;
		}
		return begin;
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
