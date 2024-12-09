package com.codingbamboo.finalproject.coefficient.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.coefficient.dao.ICoefficientDAO;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Service
public class CoefficientService {
	
	@Autowired
	ICoefficientDAO dao;
    
    // 계수 불러오기
 	public List<CoefficientDTO> getCoefficientValue(){
 		return dao.getCoefficientValue();
 	}

 	public void updateCoefficients(List<CoefficientDTO> coefficient) {
		for (CoefficientDTO updateCf : coefficient) {
			dao.updateCf(updateCf);
		}
	}
}
