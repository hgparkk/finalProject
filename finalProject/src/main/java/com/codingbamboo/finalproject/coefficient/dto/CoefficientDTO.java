package com.codingbamboo.finalproject.coefficient.dto;

public class CoefficientDTO {
	private int coefficientNo;
	private String coefficientName;
	private double coefficientValue;
	
	public CoefficientDTO() {
		super();
	}

	public CoefficientDTO(int coefficientNo, String coefficientName, double coefficientValue) {
		super();
		this.coefficientNo = coefficientNo;
		this.coefficientName = coefficientName;
		this.coefficientValue = coefficientValue;
	}

	@Override
	public String toString() {
		return "CoefficientDTO [coefficientNo=" + coefficientNo + ", coefficientName=" + coefficientName
				+ ", coefficientValue=" + coefficientValue + "]";
	}

	public int getCoefficientNo() {
		return coefficientNo;
	}

	public void setCoefficientNo(int coefficientNo) {
		this.coefficientNo = coefficientNo;
	}

	public String getCoefficientName() {
		return coefficientName;
	}

	public void setCoefficientName(String coefficientName) {
		this.coefficientName = coefficientName;
	}

	public double getCoefficientValue() {
		return coefficientValue;
	}

	public void setCoefficientValue(double coefficientValue) {
		this.coefficientValue = coefficientValue;
	}

	
}
