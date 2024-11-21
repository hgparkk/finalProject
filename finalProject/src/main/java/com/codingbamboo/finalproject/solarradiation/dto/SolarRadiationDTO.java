package com.codingbamboo.finalproject.solarradiation.dto;

import java.sql.Date;

public class SolarRadiationDTO {
	private int srNo;
	private Date srMonth;
	private double srRadiation;
	
	public SolarRadiationDTO() {
		super();
	}

	public SolarRadiationDTO(int srNo, Date srMonth, double srRadiation) {
		super();
		this.srNo = srNo;
		this.srMonth = srMonth;
		this.srRadiation = srRadiation;
	}

	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public Date getSrMonth() {
		return srMonth;
	}

	public void setSrMonth(Date srMonth) {
		this.srMonth = srMonth;
	}

	public double getSrRadiation() {
		return srRadiation;
	}

	public void setSrRadiation(double srRadiation) {
		this.srRadiation = srRadiation;
	}

	@Override
	public String toString() {
		return "SolarRadiationDTO [srNo=" + srNo + ", srMonth=" + srMonth + ", srRadiation=" + srRadiation + "]";
	}
}