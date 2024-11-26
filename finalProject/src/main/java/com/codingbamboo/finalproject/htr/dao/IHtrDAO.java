package com.codingbamboo.finalproject.htr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.htr.dto.HtrDTO;

@Mapper
public interface IHtrDAO {
	// 주택종류별 인구 비율
	public List<HtrDTO> getHtr();

}
