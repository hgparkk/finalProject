package com.codingbamboo.finalproject.campaign.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.campaign.dao.ICampaignDAO;
import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;
import com.codingbamboo.finalproject.common.vo.SearchVO;

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
	public List<CampaignDTO> getCampaignList(SearchVO search){
		List<CampaignDTO> result = dao.getCampaignList(search);
		return result;
	}
	
	// 캠페인 전체 갯수 조회
	public int getCampaignCount() {
		int result = dao.getCampaignCount();
		return result;
	}
	
	// 캠페인 한 페이지 갯수 조회
	public int getCampaignPageCount(SearchVO search) {
		int result = dao.getCampaignPageCount(search);
		return result;
	}
}
