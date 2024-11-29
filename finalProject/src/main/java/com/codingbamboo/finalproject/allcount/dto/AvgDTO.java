package com.codingbamboo.finalproject.allcount.dto;

public class AvgDTO {
	private Double avgAcCo2Emission;

	public AvgDTO() {
		super();
	}

	public AvgDTO(Double avgAcCo2Emission) {
		super();
		this.avgAcCo2Emission = avgAcCo2Emission;
	}

	@Override
	public String toString() {
		return "AvgDTO [avgAcCo2Emission=" + avgAcCo2Emission + "]";
	}

	public Double getAvgAcCo2Emission() {
		return avgAcCo2Emission;
	}

	public void setAvgAcCo2Emission(Double avgAcCo2Emission) {
		this.avgAcCo2Emission = avgAcCo2Emission;
	}
	
}
