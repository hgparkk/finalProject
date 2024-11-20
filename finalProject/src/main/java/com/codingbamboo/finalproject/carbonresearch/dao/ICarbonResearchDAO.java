package com.codingbamboo.finalproject.carbonresearch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.carbonresearch.dto.CarbonResearchDTO;

@Mapper
public interface ICarbonResearchDAO {
	List<CarbonResearchDTO> getCarbonResearchList();
}
