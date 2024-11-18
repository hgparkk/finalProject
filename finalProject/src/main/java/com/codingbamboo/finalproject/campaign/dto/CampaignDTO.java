package com.codingbamboo.finalproject.campaign.dto;

import java.sql.Date;

public class CampaignDTO {
	private int campaignNo;
	private int attachNo;
	private String campaignTitle;
	private Date campaingDate;
	private String campaignUrl;

	public CampaignDTO() {
	}

	public CampaignDTO(int campaignNo, int attachNo, String campaignTitle, Date campaingDate, String campaignUrl) {
		this.campaignNo = campaignNo;
		this.attachNo = attachNo;
		this.campaignTitle = campaignTitle;
		this.campaingDate = campaingDate;
		this.campaignUrl = campaignUrl;
	}

	@Override
	public String toString() {
		return "CampaignDTO [campaignNo=" + campaignNo + ", attachNo=" + attachNo + ", campaignTitle=" + campaignTitle
				+ ", campaingDate=" + campaingDate + ", campaignUrl=" + campaignUrl + "]";
	}

	public int getCampaignNo() {
		return campaignNo;
	}

	public void setCampaignNo(int campaignNo) {
		this.campaignNo = campaignNo;
	}

	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public String getCampaignTitle() {
		return campaignTitle;
	}

	public void setCampaignTitle(String campaignTitle) {
		this.campaignTitle = campaignTitle;
	}

	public Date getCampaingDate() {
		return campaingDate;
	}

	public void setCampaingDate(Date campaingDate) {
		this.campaingDate = campaingDate;
	}

	public String getCampaignUrl() {
		return campaignUrl;
	}

	public void setCampaignUrl(String campaignUrl) {
		this.campaignUrl = campaignUrl;
	}

}
