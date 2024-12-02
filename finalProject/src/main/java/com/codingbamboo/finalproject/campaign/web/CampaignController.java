package com.codingbamboo.finalproject.campaign.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;
import com.codingbamboo.finalproject.campaign.service.CampaignService;
import com.codingbamboo.finalproject.common.vo.SearchVO;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class CampaignController {

	@Autowired
	CampaignService campaignService;

	// 캠페인 페이지 이동
	@RequestMapping("/campaignView")
	public String campaignView(Model model, SearchVO search) {
		// 캠페인 전체 갯수 조회
		int campaignCount = campaignService.getCampaignCount();
		model.addAttribute("keyCampaignCount", campaignCount);
		
		// 캠페인 한 페이지 갯수 조회
		int campaignPageCount = campaignService.getCampaignPageCount(search);
		
		search.setCampaignCount(campaignPageCount);
		
		// 검색 조건 설정
		search.campaignSetting();
		
		model.addAttribute("keySearch", search);
		
		// 캠페인 목록 조회
		List<CampaignDTO> getCampaignList = campaignService.getCampaignList(search);
		model.addAttribute("keyGetCampaignList", getCampaignList);

		return "campaign/campaignView";
	}

	// 캠페인 작성 페이지 이동
	@RequestMapping("/campaignWriteView")
	public String campaignWriteView(HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		// 로그인하지 않은 경우, 로그인 페이지로 리다이렉트
		if (login == null ||login.getUserIsmaster() != 1) {
			return "redirect:/";
		}
		
		return "campaign/campaignWriteView";
	}
	
	@PostMapping("/campaignWriteDo")
	public String campaignWriteDo(CampaignDTO campaign) {
		campaignService.registCampaign(campaign);
		return "redirect:/campaignView";
	}
	
	@PostMapping("/campaignDelDo")
	public String campaignDelDo(int campaignNo) {
		campaignService.deleteCampaign(campaignNo);
		return "redirect:/campaignView";
	}
}
