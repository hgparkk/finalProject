package com.codingbamboo.finalproject.suggestionattach.dao;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.suggestionattach.dto.SuggestionAttachDTO;

@Mapper
public interface ISuggestionAttachDAO {
	int insertSuggestionAttach(SuggestionAttachDTO suggestionAttach);
}
