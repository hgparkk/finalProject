package com.codingbamboo.finalproject.hmc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.hmc.dto.HmcDTO;

@Mapper
public interface IHmcDAO {
	
	// 가구원별 인구수와 비율
	public List<HmcDTO> getHmc();

}
