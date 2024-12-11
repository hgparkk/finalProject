package com.codingbamboo.finalproject.carboncalculate.dto;

import java.sql.Date;
import java.util.Calendar;

public class CarbonCalculateDTO {
	public int resultNo;
	public String userId;
	public Date resultDate;
	public double gasUsage;
	public double electricUsage;
	public String trafficKind;
	public double trafficValue;
	public double wasteWeight;
	
	public CarbonCalculateDTO() {
	}

	public CarbonCalculateDTO(int resultNo, String userId, Date resultDate, double gasUsage, double electricUsage,
			String trafficKind, double trafficValue, double wasteWeight) {
		super();
		this.resultNo = resultNo;
		this.userId = userId;
		this.resultDate = resultDate;
		this.gasUsage = gasUsage;
		this.electricUsage = electricUsage;
		this.trafficKind = trafficKind;
		this.trafficValue = trafficValue;
		this.wasteWeight = wasteWeight;
	}


	@Override
	public String toString() {
		return "CarbonCalculateDTO [resultNo=" + resultNo + ", userId=" + userId + ", resultDate=" + resultDate
				+ ", gasUsage=" + gasUsage + ", electricUsage=" + electricUsage + ", trafficKind=" + trafficKind
				+ ", trafficValue=" + trafficValue + ", wasteWeight=" + wasteWeight + "]";
	}

	public int getResultNo() {
		return resultNo;
	}

	public void setResultNo(int resultNo) {
		this.resultNo = resultNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getResultDate() {
		return resultDate;
	}

	public void setResultDate(Date resultDate) {
		this.resultDate = resultDate;
	}

	public double getGasUsage() {
		return gasUsage;
	}

	public void setGasUsage(double gasUsage) {
		this.gasUsage = gasUsage;
	}

	public double getElectricUsage() {
		return electricUsage;
	}

	public void setElectricUsage(double electricUsage) {
		this.electricUsage = electricUsage;
	}

	public String getTrafficKind() {
		return trafficKind;
	}

	public void setTrafficKind(String trafficKind) {
		this.trafficKind = trafficKind;
	}

	public double getTrafficValue() {
		return trafficValue;
	}

	public void setTrafficValue(double trafficValue) {
		this.trafficValue = trafficValue;
	}

	public double getWasteWeight() {
		return wasteWeight;
	}

	public void setWasteWeight(double wasteWeight) {
		this.wasteWeight = wasteWeight;
	}

	public int getYear() {
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(resultDate);
	    return cal.get(Calendar.YEAR);
	}

	public int getMonth() {
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(resultDate);
	    return cal.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더함
	}
}
