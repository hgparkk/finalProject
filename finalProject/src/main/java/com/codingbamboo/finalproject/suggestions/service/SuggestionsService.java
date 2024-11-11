package com.codingbamboo.finalproject.suggestions.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.suggestions.dao.ISuggestionsDAO;
import com.codingbamboo.finalproject.suggestions.dto.AdminSuggestionsDTO;

@Service
public class SuggestionsService {

	@Autowired
	ISuggestionsDAO dao;
	
	public List<AdminSuggestionsDTO> getSgList(){
		List<AdminSuggestionsDTO> result = dao.getSgList();
		return result;
	}
	
}
