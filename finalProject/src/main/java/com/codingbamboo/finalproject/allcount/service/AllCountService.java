package com.codingbamboo.finalproject.allcount.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.allcount.dao.IAllCountDAO;
import com.codingbamboo.finalproject.allcount.dto.AllCountDTO;
import com.codingbamboo.finalproject.allcount.dto.AvgDTO;

@Service
public class AllCountService {
	
	@Autowired
	IAllCountDAO dao;
	
	// 평균 탄소 배출량
	public AvgDTO selectAvgCo2Emission() {
		return dao.selectAvgCo2Emission();
	}
	
	public int insertCo2Emission(AllCountDTO allCount) {
		return dao.insertCo2Emission(allCount);
	}

}
