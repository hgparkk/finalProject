package com.codingbamboo.finalproject.suggestions.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingbamboo.finalproject.suggestions.dto.AdminSuggestionsDTO;
import com.codingbamboo.finalproject.suggestions.service.SuggestionsService;

@Controller
public class AdiminSuggestionsController {
	
	@Autowired
	SuggestionsService suggestionsService;
	
	@RequestMapping("/adminSuggestionsView")
	public String adiminSuggestionsView(Model model) {
		
		List<AdminSuggestionsDTO> SgList = suggestionsService.getSgList();
		
		model.addAttribute("SgList", SgList);
		
		return "admin/adminSuggestionsView";
	}
}