package com.codingbamboo.finalproject.campaign.dao;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;

@Mapper
public interface ICampaignDAO {
	// ķ���� ����ϱ�
	int registCampaign(CampaignDTO campaign);
}
