package com.codingbamboo.finalproject.hme.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.hme.dao.IHmeDAO;
import com.codingbamboo.finalproject.hme.dto.HmeDTO;

@Service
public class HmeService {
	
	@Autowired
	IHmeDAO dao;
	
	// 가족 구성원별 탄소 배출량
	public List<HmeDTO> getHme(HmeDTO hme){
		return dao.getHme(hme);
	}

}
