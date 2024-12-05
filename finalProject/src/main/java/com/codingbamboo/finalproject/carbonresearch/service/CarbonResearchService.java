package com.codingbamboo.finalproject.carbonresearch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carbonresearch.dao.ICarbonResearchDAO;
import com.codingbamboo.finalproject.carbonresearch.dto.CarbonResearchDTO;

@Service
public class CarbonResearchService {

	@Autowired
	ICarbonResearchDAO dao;
	
	public List<CarbonResearchDTO> getTechList(){
		List<CarbonResearchDTO> result = dao.getTechList();
		return result;
	}
	
}
