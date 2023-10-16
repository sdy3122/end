package kr.co.vo;

public class Criteria {
	private int page;
	private int perPageNum;
	private String name;
	private long registNumber;
	
	public long getRegistNumber() {
		return registNumber;
	}

	public void setRegistNumber(long registNumber) {
		this.registNumber = registNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public Criteria() {
		this.page = 1;
		// 한화면에 표시될 게시글 개수 n개
		this.perPageNum = 12;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
}
