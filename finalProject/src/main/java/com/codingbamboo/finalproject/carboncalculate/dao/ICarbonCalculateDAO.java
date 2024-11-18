package com.codingbamboo.finalproject.carboncalculate.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;

@Mapper
public interface ICarbonCalculateDAO {
	// 탄소발자국 결과 저장하기
	int insertCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소발자국 결과 조회하기
	CarbonCalculateDTO getCal(Date date);
	
	// 탄소발자국 결과 목록 조회
	List<CarbonCalculateDTO> getCarbonCalList();
}
