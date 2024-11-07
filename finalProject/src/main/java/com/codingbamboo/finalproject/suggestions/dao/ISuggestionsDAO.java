package com.codingbamboo.finalproject.suggestions.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.codingbamboo.finalproject.suggestions.dto.adminSuggestionsDTO;

@Mapper
public interface ISuggestionsDAO {
	List<adminSuggestionsDTO> getSgList();
}
