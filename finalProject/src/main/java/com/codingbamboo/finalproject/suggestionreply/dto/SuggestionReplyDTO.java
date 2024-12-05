package com.codingbamboo.finalproject.suggestionreply.dto;

public class SuggestionReplyDTO {

	private int replyNo;
	private int sgNo;
	private String replyContent;
	private int replyIsread;
	private String replyDate;
	
	public SuggestionReplyDTO() {
		super();
	}

	public SuggestionReplyDTO(int replyNo, int sgNo, String replyContent, int replyIsread, String replyDate) {
		super();
		this.replyNo = replyNo;
		this.sgNo = sgNo;
		this.replyContent = replyContent;
		this.replyIsread = replyIsread;
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "SuggestionReplyDTO [replyNo=" + replyNo + ", sgNo=" + sgNo + ", replyContent=" + replyContent
				+ ", replyIsread=" + replyIsread + ", replyDate=" + replyDate + "]";
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getSgNo() {
		return sgNo;
	}

	public void setSgNo(int sgNo) {
		this.sgNo = sgNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getReplyIsread() {
		return replyIsread;
	}

	public void setReplyIsread(int replyIsread) {
		this.replyIsread = replyIsread;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	
}
