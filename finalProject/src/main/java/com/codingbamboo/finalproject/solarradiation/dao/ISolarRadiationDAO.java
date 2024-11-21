package com.codingbamboo.finalproject.solarradiation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.solarradiation.dto.SolarRadiationDTO;

@Mapper
public interface ISolarRadiationDAO {
	public List<SolarRadiationDTO> selectSolarRadiation(String year);
}