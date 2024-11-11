package com.codingbamboo.finalproject.suggestions.dto;

public class AdminSuggestionsDTO {
	private int sgNo;
	private int attachNo;
	private String userId;
	private String sgTitle;
	private String sgContent;
	private String sgDate;
	
	public AdminSuggestionsDTO() {
		
	}

	public AdminSuggestionsDTO(int sgNo, int attachNo, String userId, String sgTitle, String sgContent, String sgDate) {
		super();
		this.sgNo = sgNo;
		this.attachNo = attachNo;
		this.userId = userId;
		this.sgTitle = sgTitle;
		this.sgContent = sgContent;
		this.sgDate = sgDate;
	}

	@Override
	public String toString() {
		return "adminSuggestionsDTO [sgNo=" + sgNo + ", attachNo=" + attachNo + ", userId=" + userId + ", sgTitle="
				+ sgTitle + ", sgContent=" + sgContent + ", sgDate=" + sgDate + "]";
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSgTitle() {
		return sgTitle;
	}

	public void setSgTitle(String sgTitle) {
		this.sgTitle = sgTitle;
	}

	public String getSgContent() {
		return sgContent;
	}

	public void setSgContent(String sgContent) {
		this.sgContent = sgContent;
	}

	public String getSgDate() {
		return sgDate;
	}

	public void setSgDate(String sgDate) {
		this.sgDate = sgDate;
	}
	
	
	
}
