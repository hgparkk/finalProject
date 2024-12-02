package com.codingbamboo.finalproject.usersg.dto;

public class UserSgDTO {
	private int sgNo;
	private int attachNo;
	private String user_id;
	private String sgTitle;
	private String sgContent;
	private String sgDate;
	
	public UserSgDTO() {
		super();
	}

	public UserSgDTO(int sgNo, int attachNo, String user_id, String sgTitle, String sgContent, String sgDate) {
		super();
		this.sgNo = sgNo;
		this.attachNo = attachNo;
		this.user_id = user_id;
		this.sgTitle = sgTitle;
		this.sgContent = sgContent;
		this.sgDate = sgDate;
	}

	@Override
	public String toString() {
		return "UserSgDTO [sgNo=" + sgNo + ", attachNo=" + attachNo + ", user_id=" + user_id + ", sgTitle=" + sgTitle
				+ ", sgContent=" + sgContent + ", sgDate=" + sgDate + "]";
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
