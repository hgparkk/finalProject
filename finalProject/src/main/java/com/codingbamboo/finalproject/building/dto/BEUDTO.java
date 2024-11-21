package com.codingbamboo.finalproject.building.dto;

import java.sql.Date;

public class BEUDTO {
	private int beuNo;
	private int buildingNo;
	private Date beuMonth;
	private int beuElectric;
	
	public BEUDTO() {
		super();
	}

	public BEUDTO(int beuNo, int buildingNo, Date beuMonth, int beuElectric) {
		super();
		this.beuNo = beuNo;
		this.buildingNo = buildingNo;
		this.beuMonth = beuMonth;
		this.beuElectric = beuElectric;
	}

	public int getBeuNo() {
		return beuNo;
	}

	public void setBeuNo(int beuNo) {
		this.beuNo = beuNo;
	}

	public int getBuildingNo() {
		return buildingNo;
	}

	public void setBuildingNo(int buildingNo) {
		this.buildingNo = buildingNo;
	}

	public Date getBeuMonth() {
		return beuMonth;
	}

	public void setBeuMonth(Date beuMonth) {
		this.beuMonth = beuMonth;
	}

	public int getBeuElectric() {
		return beuElectric;
	}

	public void setBeuElectric(int beuElectric) {
		this.beuElectric = beuElectric;
	}

	@Override
	public String toString() {
		return "BEUDTO [beuNo=" + beuNo + ", buildingNo=" + buildingNo + ", beuMonth=" + beuMonth + ", beuElectric="
				+ beuElectric + "]";
	}
}