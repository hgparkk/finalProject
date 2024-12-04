package com.codingbamboo.finalproject.carboncalculate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;

@Mapper
public interface ICarbonCalculateDAO {
	// 탄소 발자국 결과 저장
	int insertCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소 발자국 결과 업데이트
	int updateCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소 발자국 결과 불러오기
	List<CarbonCalculateDTO> selectCalList(@Param("userId") String userId, @Param("year") String year);
	
	// 탄소 발자국 등록된 날짜 불러오기
	CarbonCalculateDTO getCalByDate(CarbonCalculateDTO carbonCalculateDTO);
	
	// 탄소 발자국 저장 결과 삭제
	int deleteCal(CarbonCalculateDTO carbonCaluateDTO);
}
