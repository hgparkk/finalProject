package com.codingbamboo.finalproject.solarradiation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.solarradiation.dao.ISolarRadiationDAO;
import com.codingbamboo.finalproject.solarradiation.dto.SolarRadiationDTO;

@Service
public class SolarRadiationService {
	
	@Autowired
	ISolarRadiationDAO dao;
	
	public List<SolarRadiationDTO> selectSolarRadiation(String year){
		return dao.selectSolarRadiation(year);
	}
}