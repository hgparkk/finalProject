package com.codingbamboo.finalproject.carboncalculate.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.carboncalculate.dao.ICarbonCalculateDAO;
import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;

@Service
public class CarbonCalculateService {
	@Autowired
	ICarbonCalculateDAO dao;

	// ź�ҹ��ڱ� ��� ��� ����
	public int insertCal(CarbonCalculateDTO carbonCalculate) {
		int result = dao.insertCal(carbonCalculate);
		return result;
	}
	
	// ź�ҹ��ڱ� ���� ��� �� ��ȸ
		public CarbonCalculateDTO getCal(Date date) {
			CarbonCalculateDTO result = dao.getCal(date);
		    
		    return result;
		}

	// ź�ҹ��ڱ� ���� ��� ��������
	public List<CarbonCalculateDTO> getCarbonCalList() {
		List<CarbonCalculateDTO> result = dao.getCarbonCalList();
		return result;
	}
}
