package com.codingbamboo.finalproject.admincoefficient.dao;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.admincoefficient.dto.AdminCoefficientDTO;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;

@Mapper
public interface IAdminCoefficientDAO {
	// 저장
	int insertCf(AdminCoefficientDTO adminCoefficientDTO);
	
	// 업데이트
	int updateCf(AdminCoefficientDTO coefficient);
	
	// 불러오기
	List<CoefficientDTO> getCoefficientValue();
	

}
