package com.codingbamboo.finalproject.campaign.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CampaignController {
	
	// 캠페인 페이지 이동
	@RequestMapping("campaignView")
	public String campaignView() {
		return "campaign/campaignView";
	}
}
