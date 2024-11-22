package com.codingbamboo.finalproject.rae.dto;

public class RaeDTO {

	private String raeEnergySource;
	private String raeResidentailArea;
	private double raeConsumption;

	public RaeDTO() {
		super();
	}

	public RaeDTO(String raeEnergySource, String raeResidentailArea, double raeConsumption) {
		super();
		this.raeEnergySource = raeEnergySource;
		this.raeResidentailArea = raeResidentailArea;
		this.raeConsumption = raeConsumption;
	}

	@Override
	public String toString() {
		return "RaeDTO [raeEnergySource=" + raeEnergySource + ", raeResidentailArea=" + raeResidentailArea
				+ ", raeConsumption=" + raeConsumption + "]";
	}

	public String getRaeEnergySource() {
		return raeEnergySource;
	}

	public void setRaeEnergySource(String raeEnergySource) {
		this.raeEnergySource = raeEnergySource;
	}

	public String getRaeResidentailArea() {
		return raeResidentailArea;
	}

	public void setRaeResidentailArea(String raeResidentailArea) {
		this.raeResidentailArea = raeResidentailArea;
	}

	public double getRaeConsumption() {
		return raeConsumption;
	}

	public void setRaeConsumption(double raeConsumption) {
		this.raeConsumption = raeConsumption;
	}

}
