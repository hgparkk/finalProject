package com.codingbamboo.finalproject.hte.dto;

public class HteDTO {
	private String hteEnergySource;
	private String hteHouseType;
	private double hteConsumption;
	
	public HteDTO() {
		super();
	}
	public HteDTO(String hteEnergySource, String hteHouseType, double hteConsumption) {
		super();
		this.hteEnergySource = hteEnergySource;
		this.hteHouseType = hteHouseType;
		this.hteConsumption = hteConsumption;
	}
	
	@Override
	public String toString() {
		return "HteDTO [hteEnergySource=" + hteEnergySource + ", hteHouseType=" + hteHouseType + ", hteConsumption="
				+ hteConsumption + "]";
	}
	
	public String getHteEnergySource() {
		return hteEnergySource;
	}
	public void setHteEnergySource(String hteEnergySource) {
		this.hteEnergySource = hteEnergySource;
	}
	public String getHteHouseType() {
		return hteHouseType;
	}
	public void setHteHouseType(String hteHouseType) {
		this.hteHouseType = hteHouseType;
	}
	public double getHteConsumption() {
		return hteConsumption;
	}
	public void setHteConsumption(double hteConsumption) {
		this.hteConsumption = hteConsumption;
	}
	
}
