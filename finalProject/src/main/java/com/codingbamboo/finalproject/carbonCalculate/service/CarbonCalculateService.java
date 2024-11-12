package com.codingbamboo.finalproject.carbonCalculate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carbonCalculate.dao.ICarbonCalculateDAO;

@Service
public class CarbonCalculateService {
	@Autowired
	ICarbonCalculateDAO dao;
	
}
