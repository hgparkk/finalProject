package com.codingbamboo.finalproject.htac.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.htac.dto.HtacDTO;

@Mapper
public interface IHtacDAO {
	// 주택면적, 가구원수별 가구수 가져오기
	public List<HtacDTO> getHtac();

}
