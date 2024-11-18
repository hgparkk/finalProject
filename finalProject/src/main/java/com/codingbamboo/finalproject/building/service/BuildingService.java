package com.codingbamboo.finalproject.building.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.building.dao.IBuildingDAO;
import com.codingbamboo.finalproject.building.dto.BEUDTO;
import com.codingbamboo.finalproject.building.dto.BuildingDTO;

@Service
public class BuildingService {

	@Autowired
	IBuildingDAO dao;
	
	public List<BuildingDTO> selectAllBuildingList(){
		return dao.selectAllBuildingList();
	}
	
	public List<BEUDTO> selectBEUList(int buildingNo){
		return dao.selectBEUList(buildingNo);
	}
}