package com.codingbamboo.finalproject.suggestionattach.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.suggestionattach.dao.ISuggestionAttachDAO;
import com.codingbamboo.finalproject.suggestionattach.dto.SuggestionAttachDTO;

@Service
public class SuggestionAttachService {

	@Autowired
	ISuggestionAttachDAO dao;
	
	public int insertSuggestionAttach(SuggestionAttachDTO suggestionAttach) {
		return dao.insertSuggestionAttach(suggestionAttach);
	}
}
