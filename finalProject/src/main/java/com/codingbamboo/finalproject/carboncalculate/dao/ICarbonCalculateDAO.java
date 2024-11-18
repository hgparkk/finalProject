package com.codingbamboo.finalproject.carboncalculate.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;

@Mapper
public interface ICarbonCalculateDAO {
	// ź�ҹ��ڱ� ��� �����ϱ�
	int insertCal(CarbonCalculateDTO carbonCalculateDTO);
	
	// ź�ҹ��ڱ� ��� ��ȸ�ϱ�
	CarbonCalculateDTO getCal(Date date);
	
	// ź�ҹ��ڱ� ��� ��� ��ȸ
	List<CarbonCalculateDTO> getCarbonCalList();
}
