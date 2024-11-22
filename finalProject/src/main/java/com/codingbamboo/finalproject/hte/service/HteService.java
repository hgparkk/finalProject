package com.codingbamboo.finalproject.hte.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.hte.dao.IHteDAO;
import com.codingbamboo.finalproject.hte.dto.HteDTO;

@Service
public class HteService {
	
	@Autowired
	IHteDAO dao;
	
	// 건물 종류별 탄소 배출량
	public List<HteDTO> getHte(){
		return dao.getHte(); 
	}
	
}
