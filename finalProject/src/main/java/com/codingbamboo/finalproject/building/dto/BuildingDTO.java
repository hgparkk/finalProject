package com.codingbamboo.finalproject.building.dto;

public class BuildingDTO {
	private int buildingNo;
	private String buildingAddressLot;
	private String buildingAddressRoad;
	private double buildingArea;
	private double buildingLatitude;
	private double buildingLongitude;
	
	public BuildingDTO() {
		super();
	}

	public BuildingDTO(int buildingNo, String buildingAddressLot, String buildingAddressRoad, double buildingArea,
			double buildingLatitude, double buildingLongitude) {
		super();
		this.buildingNo = buildingNo;
		this.buildingAddressLot = buildingAddressLot;
		this.buildingAddressRoad = buildingAddressRoad;
		this.buildingArea = buildingArea;
		this.buildingLatitude = buildingLatitude;
		this.buildingLongitude = buildingLongitude;
	}

	public int getBuildingNo() {
		return buildingNo;
	}

	public void setBuildingNo(int buildingNo) {
		this.buildingNo = buildingNo;
	}

	public String getBuildingAddressLot() {
		return buildingAddressLot;
	}

	public void setBuildingAddressLot(String buildingAddressLot) {
		this.buildingAddressLot = buildingAddressLot;
	}

	public String getBuildingAddressRoad() {
		return buildingAddressRoad;
	}

	public void setBuildingAddressRoad(String buildingAddressRoad) {
		this.buildingAddressRoad = buildingAddressRoad;
	}

	public double getBuildingArea() {
		return buildingArea;
	}

	public void setBuildingArea(double buildingArea) {
		this.buildingArea = buildingArea;
	}

	public double getBuildingLatitude() {
		return buildingLatitude;
	}

	public void setBuildingLatitude(double buildingLatitude) {
		this.buildingLatitude = buildingLatitude;
	}

	public double getBuildingLongitude() {
		return buildingLongitude;
	}

	public void setBuildingLongitude(double buildingLongitude) {
		this.buildingLongitude = buildingLongitude;
	}

	@Override
	public String toString() {
		return "BuildingDTO [buildingNo=" + buildingNo + ", buildingAddressLot=" + buildingAddressLot
				+ ", buildingAddressRoad=" + buildingAddressRoad + ", buildingArea=" + buildingArea
				+ ", buildingLatitude=" + buildingLatitude + ", buildingLongitude=" + buildingLongitude + "]";
	}
}