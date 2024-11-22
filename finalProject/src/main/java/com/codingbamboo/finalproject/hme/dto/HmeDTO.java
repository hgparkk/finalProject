package com.codingbamboo.finalproject.hme.dto;

public class HmeDTO {
	private String hmeEnergySource;
	private String hmeHouseholdMembers;
	private double hmeConsumption;
	
	public HmeDTO() {
		super();
	}

	public HmeDTO(String hmeEnergySource, String hmeHouseholdMembers, double hmeConsumption) {
		super();
		this.hmeEnergySource = hmeEnergySource;
		this.hmeHouseholdMembers = hmeHouseholdMembers;
		this.hmeConsumption = hmeConsumption;
	}

	@Override
	public String toString() {
		return "HmeDTO [hmeEnergySource=" + hmeEnergySource + ", hmeHouseholdMembers=" + hmeHouseholdMembers
				+ ", hmeConsumption=" + hmeConsumption + "]";
	}

	public String getHmeEnergySource() {
		return hmeEnergySource;
	}

	public void setHmeEnergySource(String hmeEnergySource) {
		this.hmeEnergySource = hmeEnergySource;
	}

	public String getHmeHouseholdMembers() {
		return hmeHouseholdMembers;
	}

	public void setHmeHouseholdMembers(String hmeHouseholdMembers) {
		this.hmeHouseholdMembers = hmeHouseholdMembers;
	}

	public double getHmeConsumption() {
		return hmeConsumption;
	}

	public void setHmeConsumption(double hmeConsumption) {
		this.hmeConsumption = hmeConsumption;
	}
	
}
