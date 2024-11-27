package com.codingbamboo.finalproject.htac.dto;

public class HtacDTO {
	private String htacHouseType;
	private String htacArea;
	private int htacHouseholdSize1;
	private int htacHouseholdSize2;
	private int htacHouseholdSize3;
	private int htacHouseholdSize4;
	private int htacHouseholdSize5;
	private int htacHouseholdSize6;
	
	public HtacDTO() {
		super();
	}

	public HtacDTO(String htacHouseType, String htacArea, int htacHouseholdSize1, int htacHouseholdSize2,
			int htacHouseholdSize3, int htacHouseholdSize4, int htacHouseholdSize5, int htacHouseholdSize6) {
		super();
		this.htacHouseType = htacHouseType;
		this.htacArea = htacArea;
		this.htacHouseholdSize1 = htacHouseholdSize1;
		this.htacHouseholdSize2 = htacHouseholdSize2;
		this.htacHouseholdSize3 = htacHouseholdSize3;
		this.htacHouseholdSize4 = htacHouseholdSize4;
		this.htacHouseholdSize5 = htacHouseholdSize5;
		this.htacHouseholdSize6 = htacHouseholdSize6;
	}

	@Override
	public String toString() {
		return "HtacDTO [htacHouseType=" + htacHouseType + ", htacArea=" + htacArea + ", htacHouseholdSize1="
				+ htacHouseholdSize1 + ", htacHouseholdSize2=" + htacHouseholdSize2 + ", htacHouseholdSize3="
				+ htacHouseholdSize3 + ", htacHouseholdSize4=" + htacHouseholdSize4 + ", htacHouseholdSize5="
				+ htacHouseholdSize5 + ", htacHouseholdSize6=" + htacHouseholdSize6 + "]";
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

	public int getHtacHouseholdSize1() {
		return htacHouseholdSize1;
	}

	public void setHtacHouseholdSize1(int htacHouseholdSize1) {
		this.htacHouseholdSize1 = htacHouseholdSize1;
	}

	public int getHtacHouseholdSize2() {
		return htacHouseholdSize2;
	}

	public void setHtacHouseholdSize2(int htacHouseholdSize2) {
		this.htacHouseholdSize2 = htacHouseholdSize2;
	}

	public int getHtacHouseholdSize3() {
		return htacHouseholdSize3;
	}

	public void setHtacHouseholdSize3(int htacHouseholdSize3) {
		this.htacHouseholdSize3 = htacHouseholdSize3;
	}

	public int getHtacHouseholdSize4() {
		return htacHouseholdSize4;
	}

	public void setHtacHouseholdSize4(int htacHouseholdSize4) {
		this.htacHouseholdSize4 = htacHouseholdSize4;
	}

	public int getHtacHouseholdSize5() {
		return htacHouseholdSize5;
	}

	public void setHtacHouseholdSize5(int htacHouseholdSize5) {
		this.htacHouseholdSize5 = htacHouseholdSize5;
	}

	public int getHtacHouseholdSize6() {
		return htacHouseholdSize6;
	}

	public void setHtacHouseholdSize6(int htacHouseholdSize6) {
		this.htacHouseholdSize6 = htacHouseholdSize6;
	}

}
