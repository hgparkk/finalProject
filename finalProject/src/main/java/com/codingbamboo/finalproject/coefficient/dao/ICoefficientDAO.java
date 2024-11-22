package com.codingbamboo.finalproject.coefficient.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Mapper
public interface ICoefficientDAO {
    
    // co2계산 계수 불러오기
 	List<CoefficientDTO> getCoefficientValue();
	
}
