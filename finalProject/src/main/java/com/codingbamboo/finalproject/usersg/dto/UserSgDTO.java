package com.codingbamboo.finalproject.usersg.dto;

public class UserSgDTO {
	private int sgNo;
	private String userId;
	private String sgTitle;
	private String sgContent;
	private String sgDate;
	
	public UserSgDTO() {
		super();
	}

	public UserSgDTO(int sgNo, String userId, String sgTitle, String sgContent, String sgDate) {
		super();
		this.sgNo = sgNo;
		this.userId = userId;
		this.sgTitle = sgTitle;
		this.sgContent = sgContent;
		this.sgDate = sgDate;
	}

	@Override
	public String toString() {
		return "UserSgDTO [sgNo=" + sgNo + ", userId=" + userId + ", sgTitle=" + sgTitle + ", sgContent=" + sgContent
				+ ", sgDate=" + sgDate + "]";
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
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
