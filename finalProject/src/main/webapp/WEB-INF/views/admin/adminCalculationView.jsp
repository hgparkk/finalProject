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
            <h1>탄소발자국 계산식 관리</h1>
        </div>
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/updateCalculationDo" method="post">
                <c:forEach var="coefficient" items="${calculation}">
                    <div class="form-item">
                        <label for="coefficient${coefficient.coefficientNo}" class="label">
                            ${coefficient.coefficientName} CO₂ 계수
                        </label>
                        <input type="hidden" name="coefficientNo" value="${coefficient.coefficientNo}">
                        <input type="number" step="0.00001" class="input" 
                               name="coefficientValue" value="${coefficient.coefficientValue}">
                    </div>
                </c:forEach>
                <button id="submitBtn" type="submit">저장하기</button>
            </form>
        </div>
    </div>
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>