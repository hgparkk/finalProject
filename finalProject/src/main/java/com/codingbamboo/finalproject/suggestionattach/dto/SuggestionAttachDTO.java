package com.codingbamboo.finalproject.suggestionattach.dto;

public class SuggestionAttachDTO {
	private int saNo;
	private int sgNo;
	private int attachNo;
	
	public SuggestionAttachDTO() {
		super();
	}
	
	public SuggestionAttachDTO(int saNo, int sgNo, int attachNo) {
		super();
		this.saNo = saNo;
		this.sgNo = sgNo;
		this.attachNo = attachNo;
	}
	
	@Override
	public String toString() {
		return "SuggestionAttachDTO [saNo=" + saNo + ", sgNo=" + sgNo + ", attachNo=" + attachNo + "]";
	}
	
	public int getSaNo() {
		return saNo;
	}
	public void setSaNo(int saNo) {
		this.saNo = saNo;
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
	

	

}
