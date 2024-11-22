package com.codingbamboo.finalproject.hte.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.hte.dto.HteDTO;

@Mapper
public interface IHteDAO {
	// 건물 종류별 탄소 배출량
	public List<HteDTO> getHte();

}
