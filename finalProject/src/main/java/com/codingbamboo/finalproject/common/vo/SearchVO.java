package com.codingbamboo.finalproject.common.vo;

public class SearchVO {
    private String searchOption;        // 검색 옵션 (예: 제목, 내용, 작성자)
    private String searchWord;          // 검색어
    private int campaignCount;          // 캠페인 게시판의 총 게시물 수
    
    private int pageNo = 1;             // 현재 페이지 번호
    private int rowSizePerPage = 9;    // 한 페이지당 표시할 항목 수
    
    // 현재 페이지의 시작 항목과 끝 항목 번호
    private int start;
    private int end;
    
    // 페이지네이션에서 첫 페이지 번호와 마지막 페이지 번호
    private int firstPage;
    private int lastPage;
    
    // 총 페이지 수 (게시물 수에 따른 계산)
    private int finalPage;
    
    // 기본 생성자
    public SearchVO() {
    }
    
    // 캠페인 게시판의 페이지네이션을 설정하는 메서드
    public void campaignSetting() {
        start = rowSizePerPage * (pageNo - 1) + 1;  // 시작 항목 번호 계산
        end = rowSizePerPage * pageNo;               // 끝 항목 번호 계산
        
        firstPage = ((pageNo - 1) / 9) * 9 + 1;   // 페이지네이션에서 첫 페이지 번호 계산
        lastPage = firstPage + 8;                   // 페이지네이션에서 마지막 페이지 번호 계산
        
        finalPage = (int) Math.ceil((double) campaignCount / rowSizePerPage); // 총 페이지 수 계산
        
        // 마지막 페이지가 총 페이지 수를 초과하지 않도록 조정
        if (lastPage > finalPage) {
            lastPage = finalPage;
        }
    }

	public SearchVO(String searchOption, String searchWord, int campaignCount, int pageNo, int rowSizePerPage,
			int start, int end, int firstPage, int lastPage, int finalPage) {
		super();
		this.searchOption = searchOption;
		this.searchWord = searchWord;
		this.campaignCount = campaignCount;
		this.pageNo = pageNo;
		this.rowSizePerPage = rowSizePerPage;
		this.start = start;
		this.end = end;
		this.firstPage = firstPage;
		this.lastPage = lastPage;
		this.finalPage = finalPage;
	}

	@Override
	public String toString() {
		return "SearchVO [searchOption=" + searchOption + ", searchWord=" + searchWord + ", campaignCount="
				+ campaignCount + ", pageNo=" + pageNo + ", rowSizePerPage=" + rowSizePerPage + ", start=" + start
				+ ", end=" + end + ", firstPage=" + firstPage + ", lastPage=" + lastPage + ", finalPage=" + finalPage
				+ "]";
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getCampaignCount() {
		return campaignCount;
	}

	public void setCampaignCount(int campaignCount) {
		this.campaignCount = campaignCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRowSizePerPage() {
		return rowSizePerPage;
	}

	public void setRowSizePerPage(int rowSizePerPage) {
		this.rowSizePerPage = rowSizePerPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getFinalPage() {
		return finalPage;
	}

	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}

}
