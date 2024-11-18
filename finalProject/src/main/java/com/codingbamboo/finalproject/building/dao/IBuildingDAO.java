package com.codingbamboo.finalproject.building.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.building.dto.BEUDTO;
import com.codingbamboo.finalproject.building.dto.BuildingDTO;

@Mapper
public interface IBuildingDAO {
	public List<BuildingDTO> selectAllBuildingList();
	public List<BEUDTO> selectBEUList(int buildingNo);
}