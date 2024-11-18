package com.codingbamboo.finalproject.campaign.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.campaign.dao.ICampaignDAO;
import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;

@Service
public class CampaignService {
	
	@Autowired
	ICampaignDAO dao;
	
	// Ä·ÆäÀÎ µî·Ï
	public int registCampaign(CampaignDTO campaign) {
		int result = dao.registCampaign(campaign);
		return result;
	}
}
