package com.codingbamboo.finalproject.admincoefficient.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.admincoefficient.dao.IAdminCoefficientDAO;
import com.codingbamboo.finalproject.admincoefficient.dto.AdminCoefficientDTO;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Service
public class AdminCoefficientService {

	@Autowired
	IAdminCoefficientDAO dao;
 	
	public List<CoefficientDTO> getCoefficientValue(){
 		return dao.getCoefficientValue();
 	}

	public void updateCoefficients(List<CoefficientDTO> coefficient) {
		for (CoefficientDTO updateCf : coefficient) {
			dao.updateCf(updateCf);
		}
	}
	
}
