package com.codingbamboo.finalproject.coefficient.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.coefficient.dao.ICoefficientDAO;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Service
public class CoefficientService {
	
	@Autowired
	ICoefficientDAO coefficientDAO;
	
	// Coefficient 데이터 가져오는 메서드
    public List<CoefficientDTO> getAllCoefficient() {
        return coefficientDAO.selectAllCoefficients();
    }

}
