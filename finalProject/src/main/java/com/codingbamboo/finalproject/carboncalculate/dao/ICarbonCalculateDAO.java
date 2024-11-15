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
	
	//�ӽ�
	// ������ ���� �´� �����͸� ��ȸ�ϴ� �޼���
    @Select("SELECT * FROM carbon_result WHERE YEAR(result_date) = #{year} AND MONTH(result_date) = #{month}")
    List<CarbonCalculateDTO> getCarbonDataByMonth(@Param("year") int year, @Param("month") int month);
}
