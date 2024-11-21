package com.codingbamboo.finalproject.coefficient.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Mapper
public interface ICoefficientDAO {
	
	// 모든 계수 정보 가져오기
    List<CoefficientDTO> selectAllCoefficients();
	
}
