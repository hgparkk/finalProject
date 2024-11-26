package com.codingbamboo.finalproject.rae.dto;

public class RaeDTO {

	private String raeEnergySource;
	private String raeResidentialArea;
	private double raeConsumption;

	public RaeDTO() {
		super();
	}

	public RaeDTO(String raeEnergySource, String raeResidentialArea, double raeConsumption) {
		super();
		this.raeEnergySource = raeEnergySource;
		this.raeResidentialArea = raeResidentialArea;
		this.raeConsumption = raeConsumption;
	}

	@Override
	public String toString() {
		return "RaeDTO [raeEnergySource=" + raeEnergySource + ", raeResidentialArea=" + raeResidentialArea
				+ ", raeConsumption=" + raeConsumption + "]";
	}

	public String getRaeEnergySource() {
		return raeEnergySource;
	}

	public void setRaeEnergySource(String raeEnergySource) {
		this.raeEnergySource = raeEnergySource;
	}

	public String getRaeResidentialArea() {
		return raeResidentialArea;
	}

	public void setRaeResidentialArea(String raeResidentialArea) {
		this.raeResidentialArea = raeResidentialArea;
	}

	public double getRaeConsumption() {
		return raeConsumption;
	}

	public void setRaeConsumption(double raeConsumption) {
		this.raeConsumption = raeConsumption;
	}

}
