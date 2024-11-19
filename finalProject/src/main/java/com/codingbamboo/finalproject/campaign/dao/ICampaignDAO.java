package com.codingbamboo.finalproject.campaign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;

@Mapper
public interface ICampaignDAO {
	// 캠페인 등록
	int registCampaign(CampaignDTO campaign);
	
	// 캠페인 목록 조회
	List<CampaignDTO> getCampaignList();
}
