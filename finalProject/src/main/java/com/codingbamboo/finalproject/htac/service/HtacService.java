package com.codingbamboo.finalproject.htac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.htac.dao.IHtacDAO;
import com.codingbamboo.finalproject.htac.dto.HtacDTO;

@Service
public class HtacService {
	
	@Autowired
	IHtacDAO dao;
	
	// 주택면적, 가구원수별 가구수 가져오기
	public HtacDTO getHtac(HtacDTO htac){
		return dao.getHtac(htac);
	}

}
