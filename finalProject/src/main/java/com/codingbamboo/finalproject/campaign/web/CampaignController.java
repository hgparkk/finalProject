package com.codingbamboo.finalproject.campaign.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingbamboo.finalproject.campaign.dto.CampaignDTO;
import com.codingbamboo.finalproject.campaign.service.CampaignService;

@Controller
public class CampaignController {

	@Autowired
	CampaignService campaignService;

	// 캠페인 페이지 이동
	@RequestMapping("campaignView")
	public String campaignView(Model model) {
		// 캠페인 목록 조회
		List<CampaignDTO> getCampaignList = campaignService.getCampaignList();
		model.addAttribute("keyGetCampaignList", getCampaignList);

		return "campaign/campaignView";
	}

	// 캠페인 작성 페이지 이동
	@RequestMapping("/campaignWriteView")
	public String campaignWriteView(HttpSession session) {
		com.codingbamboo.finalproject.user.dto.UserDTO login = (com.codingbamboo.finalproject.user.dto.UserDTO) session.getAttribute("login");
		System.out.println(login.getUserIsmaster());

		// 로그인하지 않은 경우, 로그인 페이지로 리다이렉트
		if (login.getUserIsmaster() != 1) {
			return "redirect:/";
		}
		return "campaign/campaignWriteView";
	}
}
