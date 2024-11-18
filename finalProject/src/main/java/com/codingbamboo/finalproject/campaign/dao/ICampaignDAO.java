package com.codingbamboo.finalproject.campaign.dao;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;

@Mapper
public interface ICampaignDAO {
	// 캠페인 등록하기
	int registCampaign(CampaignDTO campaign);
}
