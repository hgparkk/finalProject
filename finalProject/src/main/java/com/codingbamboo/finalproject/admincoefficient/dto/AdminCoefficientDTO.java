package com.codingbamboo.finalproject.admincoefficient.dto;

public class AdminCoefficientDTO {
    private int coefficientNo;        // 계수 번호
    private String coefficientName;   // 계수 이름
    private double coefficientValue;  // 계수 값
	
    public AdminCoefficientDTO() {
		super();
	}

	public AdminCoefficientDTO(int coefficientNo, String coefficientName, double coefficientValue) {
		super();
		this.coefficientNo = coefficientNo;
		this.coefficientName = coefficientName;
		this.coefficientValue = coefficientValue;
	}

	@Override
	public String toString() {
		return "AdminCoefficientDTO [coefficientNo=" + coefficientNo + ", coefficientName=" + coefficientName
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
