package com.codingbamboo.finalproject.carbonresearch.dto;

import java.sql.Date;

public class CarbonResearchDTO {
	private int techNo;
	private String techTitle;
	private Date techDate;
	private String techUrl;
	
	public CarbonResearchDTO() {
		super();
	}

	public CarbonResearchDTO(int techNo, String techTitle, Date techDate, String techUrl) {
		super();
		this.techNo = techNo;
		this.techTitle = techTitle;
		this.techDate = techDate;
		this.techUrl = techUrl;
	}

	@Override
	public String toString() {
		return "CarbonResearchDTO [techNo=" + techNo + ", techTitle=" + techTitle + ", techDate=" + techDate
				+ ", techUrl=" + techUrl + "]";
	}

	public int getTechNo() {
		return techNo;
	}

	public void setTechNo(int techNo) {
		this.techNo = techNo;
	}

	public String getTechTitle() {
		return techTitle;
	}

	public void setTechTitle(String techTitle) {
		this.techTitle = techTitle;
	}

	public Date getTechDate() {
		return techDate;
	}

	public void setTechDate(Date techDate) {
		this.techDate = techDate;
	}

	public String getTechUrl() {
		return techUrl;
	}

	public void setTechUrl(String techUrl) {
		this.techUrl = techUrl;
	}
	
	
}
