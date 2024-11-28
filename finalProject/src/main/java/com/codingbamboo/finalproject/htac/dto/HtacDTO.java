package com.codingbamboo.finalproject.htac.dto;

public class HtacDTO {
	private int htacNo;
	private String htacHouseType;
	private String htacArea;
	private int htacHousehold;
	private int htacValue;
	
	public HtacDTO() {
		super();
	}

	public HtacDTO(int htacNo, String htacHouseType, String htacArea, int htacHousehold, int htacValue) {
		super();
		this.htacNo = htacNo;
		this.htacHouseType = htacHouseType;
		this.htacArea = htacArea;
		this.htacHousehold = htacHousehold;
		this.htacValue = htacValue;
	}

	@Override
	public String toString() {
		return "HtacDTO [htacNo=" + htacNo + ", htacHouseType=" + htacHouseType + ", htacArea=" + htacArea
				+ ", htacHousehold=" + htacHousehold + ", htacValue=" + htacValue + "]";
	}

	public int getHtacNo() {
		return htacNo;
	}

	public void setHtacNo(int htacNo) {
		this.htacNo = htacNo;
	}

	public String getHtacHouseType() {
		return htacHouseType;
	}

	public void setHtacHouseType(String htacHouseType) {
		this.htacHouseType = htacHouseType;
	}

	public String getHtacArea() {
		return htacArea;
	}

	public void setHtacArea(String htacArea) {
		this.htacArea = htacArea;
	}

	public int getHtacHousehold() {
		return htacHousehold;
	}

	public void setHtacHousehold(int htacHousehold) {
		this.htacHousehold = htacHousehold;
	}

	public int getHtacValue() {
		return htacValue;
	}

	public void setHtacValue(int htacValue) {
		this.htacValue = htacValue;
	}

}
