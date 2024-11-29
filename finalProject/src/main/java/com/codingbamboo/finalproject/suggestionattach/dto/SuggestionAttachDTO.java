package com.codingbamboo.finalproject.suggestionattach.dto;

public class SuggestionAttachDTO {
	private int saNo;
	private int sgNo;
	
	public SuggestionAttachDTO() {
		super();
	}

	public SuggestionAttachDTO(int saNo, int sgNo) {
		super();
		this.saNo = saNo;
		this.sgNo = sgNo;
	}

	@Override
	public String toString() {
		return "SuggestionAttachDTO [saNo=" + saNo + ", sgNo=" + sgNo + "]";
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
	
	

}
