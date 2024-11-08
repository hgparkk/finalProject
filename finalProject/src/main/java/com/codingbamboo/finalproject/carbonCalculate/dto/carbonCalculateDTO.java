package com.codingbamboo.finalproject.carbonCalculate.dto;

public class carbonCalculateDTO {
	public int resultNo;
	public String userId;
	public String resultDate;
	public int electricUsage;
	public int gasUseage;
	public String trafficKind;
	public int trafficValue;
	public int wasteWeight;
	
	public carbonCalculateDTO() {
	}
	
	public carbonCalculateDTO(int resultNo, String userId, String resultDate, int electricUsage, int gasUseage,
			String trafficKind, int trafficValue, int wasteWeight) {
		this.resultNo = resultNo;
		this.userId = userId;
		this.resultDate = resultDate;
		this.electricUsage = electricUsage;
		this.gasUseage = gasUseage;
		this.trafficKind = trafficKind;
		this.trafficValue = trafficValue;
		this.wasteWeight = wasteWeight;
	}

	@Override
	public String toString() {
		return "carbonCalculateDTO [resultNo=" + resultNo + ", userId=" + userId + ", resultDate=" + resultDate
				+ ", electricUsage=" + electricUsage + ", gasUseage=" + gasUseage + ", trafficKind=" + trafficKind
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

	public String getResultDate() {
		return resultDate;
	}

	public void setResultDate(String resultDate) {
		this.resultDate = resultDate;
	}

	public int getElectricUsage() {
		return electricUsage;
	}

	public void setElectricUsage(int electricUsage) {
		this.electricUsage = electricUsage;
	}

	public int getGasUseage() {
		return gasUseage;
	}

	public void setGasUseage(int gasUseage) {
		this.gasUseage = gasUseage;
	}

	public String getTrafficKind() {
		return trafficKind;
	}

	public void setTrafficKind(String trafficKind) {
		this.trafficKind = trafficKind;
	}

	public int getTrafficValue() {
		return trafficValue;
	}

	public void setTrafficValue(int trafficValue) {
		this.trafficValue = trafficValue;
	}

	public int getWasteWeight() {
		return wasteWeight;
	}

	public void setWasteWeight(int wasteWeight) {
		this.wasteWeight = wasteWeight;
	}
	
	
}
