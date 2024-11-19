package com.codingbamboo.finalproject.campaign.dto;

import java.sql.Date;

public class CampaignDTO {
	private int campaignNo;
	private String campaignImg;
	private String campaignTitle;
	private Date campaignDate;
	private String campaignUrl;

	public CampaignDTO() {
	}

	public CampaignDTO(int campaignNo, String campaignImg, String campaignTitle, Date campaignDate,
			String campaignUrl) {
		super();
		this.campaignNo = campaignNo;
		this.campaignImg = campaignImg;
		this.campaignTitle = campaignTitle;
		this.campaignDate = campaignDate;
		this.campaignUrl = campaignUrl;
	}

	@Override
	public String toString() {
		return "CampaignDTO [campaignNo=" + campaignNo + ", campaignImg=" + campaignImg + ", campaignTitle="
				+ campaignTitle + ", campaignDate=" + campaignDate + ", campaignUrl=" + campaignUrl + "]";
	}

	public int getCampaignNo() {
		return campaignNo;
	}

	public void setCampaignNo(int campaignNo) {
		this.campaignNo = campaignNo;
	}

	public String getCampaignImg() {
		return campaignImg;
	}

	public void setCampaignImg(String campaignImg) {
		this.campaignImg = campaignImg;
	}

	public String getCampaignTitle() {
		return campaignTitle;
	}

	public void setCampaignTitle(String campaignTitle) {
		this.campaignTitle = campaignTitle;
	}

	public Date getCampaignDate() {
		return campaignDate;
	}

	public void setCampaignDate(Date campaignDate) {
		this.campaignDate = campaignDate;
	}

	public String getCampaignUrl() {
		return campaignUrl;
	}

	public void setCampaignUrl(String campaignUrl) {
		this.campaignUrl = campaignUrl;
	}

	


}
