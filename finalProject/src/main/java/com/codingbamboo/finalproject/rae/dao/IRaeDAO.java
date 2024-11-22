package com.codingbamboo.finalproject.rae.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.rae.dto.RaeDTO;

@Mapper
public interface IRaeDAO {
	// 주거 면적별 탄소 배출량
	public List<RaeDTO> getRae();
}
