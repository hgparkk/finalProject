package com.codingbamboo.finalproject.allcount.dto;

public class AllCountDTO {
	private int acNo;
	private double acCo2Emission;
	
	public AllCountDTO() {
		super();
	}
	public AllCountDTO(int acNo, double acCo2Emission) {
		super();
		this.acNo = acNo;
		this.acCo2Emission = acCo2Emission;
	}
	@Override
	public String toString() {
		return "AllCountDTO [acNo=" + acNo + ", acCo2Emission=" + acCo2Emission + "]";
	}
	public int getAcNo() {
		return acNo;
	}
	public void setAcNo(int acNo) {
		this.acNo = acNo;
	}
	public double getAcCo2Emission() {
		return acCo2Emission;
	}
	public void setAcCo2Emission(double acCo2Emission) {
		this.acCo2Emission = acCo2Emission;
	}
	
	
}
