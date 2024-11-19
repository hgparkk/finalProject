package com.codingbamboo.finalproject.campaign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.campaign.dao.ICampaignDAO;
import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;

@Service
public class CampaignService {
	
	@Autowired
	ICampaignDAO dao;
	
	// 캠페인 등록
	public int registCampaign(CampaignDTO campaign) {
		int result = dao.registCampaign(campaign);
		return result;
	}
	
	// 캠페인 목록 조회
	public List<CampaignDTO> getCampaignList(){
		List<CampaignDTO> result = dao.getCampaignList();
		return result;
	}
}
