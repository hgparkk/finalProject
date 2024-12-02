package com.codingbamboo.finalproject.campaign.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;
import com.codingbamboo.finalproject.common.vo.SearchVO;

@Mapper
public interface ICampaignDAO {
	// 캠페인 등록
	int registCampaign(CampaignDTO campaign);
	
	// 캠페인 삭제
	int deleteCampaign(int campaignNo);
	
	// 캠페인 목록 조회
	List<CampaignDTO> getCampaignList(SearchVO search);
	
	// 캠페인 전체 갯수 조회
	int getCampaignCount();
	
	// 캠페인 한 페이지 갯수 조회
	int getCampaignPageCount(SearchVO search);
	
	// 계수 가져오기
	List<CampaignDTO> getCoefficientList(double coefficient);
}
