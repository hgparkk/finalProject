package com.codingbamboo.finalproject.coefficient.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Mapper
public interface ICoefficientDAO {

	// 업데이트
	int updateCf(CoefficientDTO coefficient);
	
	// 불러오기
	List<CoefficientDTO> getCoefficientValue();	
}