package com.codingbamboo.finalproject.allcount.dao;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.allcount.dto.AllCountDTO;
import com.codingbamboo.finalproject.allcount.dto.AvgDTO;

@Mapper
public interface IAllCountDAO {
	
	// 평균 탄소배출량 가져오기
	AvgDTO selectAvgCo2Emission();
	
	int insertCo2Emission(AllCountDTO allCount);
}
