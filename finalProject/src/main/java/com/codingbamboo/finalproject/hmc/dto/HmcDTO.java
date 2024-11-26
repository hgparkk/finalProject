package com.codingbamboo.finalproject.hmc.dto;

public class HmcDTO {
	private String hmcNumber;
	private int hmcCount;
	private double hmcCountRatio;
	
	public HmcDTO() {
		super();
	}
	
	public HmcDTO(String hmcNumber, int hmcCount, double hmcCountRatio) {
		super();
		this.hmcNumber = hmcNumber;
		this.hmcCount = hmcCount;
		this.hmcCountRatio = hmcCountRatio;
	}
	
	@Override
	public String toString() {
		return "HmcDTO [hmcNumber=" + hmcNumber + ", hmcCount=" + hmcCount + ", hmcCountRatio=" + hmcCountRatio + "]";
	}
	
	public String getHmcNumber() {
		return hmcNumber;
	}
	public void setHmcNumber(String hmcNumber) {
		this.hmcNumber = hmcNumber;
	}
	public int getHmcCount() {
		return hmcCount;
	}
	public void setHmcCount(int hmcCount) {
		this.hmcCount = hmcCount;
	}
	public double getHmcCountRatio() {
		return hmcCountRatio;
	}
	public void setHmcCountRatio(double hmcCountRatio) {
		this.hmcCountRatio = hmcCountRatio;
	}
	
	
}
