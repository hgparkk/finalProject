package com.codingbamboo.finalproject.carbonCalculate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.carbonCalculate.dto.CarbonCalculateDTO;

@Mapper
public interface ICarbonCalculateDAO {
	// ź�ҹ��ڱ� ��� �����ϱ�
	int insertCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// ź�ҹ��ڱ� ��� ��ȸ�ϱ�
	CarbonCalculateDTO getCal(int no);
	
	// ź�ҹ��ڱ� ��� ��� ��ȸ
	List<CarbonCalculateDTO> getCarbonCalList();
}
