package com.codingbamboo.finalproject.hme.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.hme.dto.HmeDTO;

@Mapper
public interface IHmeDAO {
	// 가족 구성원별 탄소 배출량
	List<HmeDTO> getHme(HmeDTO hme);
}
