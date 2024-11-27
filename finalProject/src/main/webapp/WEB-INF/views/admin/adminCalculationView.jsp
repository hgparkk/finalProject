<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산식 수정</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.container {
    width: 80%;
    margin: auto;
    padding: 2vw;
    font-family: Arial, sans-serif;
}

.title {
    text-align: center;
    margin-bottom: 2vw;
}

.form-container {
    border: 1px solid #ccc;
    border-radius: 0.5vw;
    padding: 2vw;
    background-color: #f9f9f9;
}

.form-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5vw;
}

.label {
    font-weight: bold;
    font-size: 1.2vw;
}

.input {
    width: 40%;
    padding: 0.5vw;
    font-size: 1vw;
    text-align: right;
    border: 1px solid #ccc;
    border-radius: 0.3vw;
}

#submitBtn {
    display: block;
    margin: 2vw auto;
    background-color: green;
    color: white;
    font-size: 1.2vw;
    font-weight: bold;
    padding: 0.7vw 1.5vw;
    border: none;
    border-radius: 0.3vw;
    cursor: pointer;
}

#submitBtn:hover {
    background-color: darkgreen;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
    <div class="container">
        <div class="title">
            <h1>탄소발자국 계산식 수정</h1>
        </div>
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/updateCoefficient" method="post">
                <!-- 전기 CO2 발생량 수정 -->
                <div class="form-item">
                    <label for="electricCoefficient" class="label">전기 CO₂ 계수</label>
                    <input type="number" step="0.00001" class="input" id="electricCoefficient" 
                           name="electricCoefficient" value="${keyGetCoefficientValue[2]['coefficientValue']}" required>
                </div>
                <!-- 가스 CO2 발생량 수정 -->
                <div class="form-item">
                    <label for="gasCoefficient" class="label">가스 CO₂ 계수</label>
                    <input type="number" step="0.00001" class="input" id="gasCoefficient" 
                           name="gasCoefficient" value="${keyGetCoefficientValue[3]['coefficientValue']}" required>
                </div>
                <!-- 휘발유 CO2 발생량 수정 -->
                <div class="form-item">
                    <label for="gasolineCoefficient" class="label">휘발유 CO₂ 계수</label>
                    <input type="number" step="0.00001" class="input" id="gasolineCoefficient" 
                           name="gasolineCoefficient" value="${keyGetCoefficientValue[4]['coefficientValue']}" required>
                </div>
                <!-- 경유 CO2 발생량 수정 -->
                <div class="form-item">
                    <label for="dieselCoefficient" class="label">경유 CO₂ 계수</label>
                    <input type="number" step="0.00001" class="input" id="dieselCoefficient" 
                           name="dieselCoefficient" value="${keyGetCoefficientValue[5]['coefficientValue']}" required>
                </div>
                <!-- LPG CO2 발생량 수정 -->
                <div class="form-item">
                    <label for="lpgCoefficient" class="label">LPG CO₂ 계수</label>
                    <input type="number" step="0.00001" class="input" id="lpgCoefficient" 
                           name="lpgCoefficient" value="${keyGetCoefficientValue[6]['coefficientValue']}" required>
                </div>
                <!-- 폐기물 CO2 발생량 수정 -->
                <div class="form-item">
                    <label for="wasteCoefficient" class="label">폐기물 CO₂ 계수</label>
                    <input type="number" step="0.00001" class="input" id="wasteCoefficient" 
                           name="wasteCoefficient" value="${keyGetCoefficientValue[7]['coefficientValue']}" required>
                </div>
                <button id="submitBtn" type="submit">저장하기</button>
            </form>
        </div>
    </div>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>