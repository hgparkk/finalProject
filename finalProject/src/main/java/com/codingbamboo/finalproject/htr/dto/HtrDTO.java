package com.codingbamboo.finalproject.htr.dto;

public class HtrDTO {
	private String htrType;
	private double htrRatio;
	
	public HtrDTO() {
		super();
	}

	public HtrDTO(String htrType, double htrRatio) {
		super();
		this.htrType = htrType;
		this.htrRatio = htrRatio;
	}

	@Override
	public String toString() {
		return "HtrDTO [htrType=" + htrType + ", htrRatio=" + htrRatio + "]";
	}

	public String getHtrType() {
		return htrType;
	}

	public void setHtrType(String htrType) {
		this.htrType = htrType;
	}

	public double getHtrRatio() {
		return htrRatio;
	}

	public void setHtrRatio(double htrRatio) {
		this.htrRatio = htrRatio;
	}
	
}
