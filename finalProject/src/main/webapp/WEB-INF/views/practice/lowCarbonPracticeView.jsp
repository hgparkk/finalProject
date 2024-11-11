<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Noto Sans KR 폰트 임포트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<!-- 헤더 인클루드 파일 -->
<%@ include file="/WEB-INF/inc/header.jsp"%>
<!-- Locomotive Scroll CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.css">
<style type="text/css">
html, body {
	overflow: hidden;
	background-color: #f4f7f6;
	font-family: 'Noto Sans KR', sans-serif; /* Noto Sans KR 폰트 적용 */
}

.container {
	padding: 50px;
}

.title {
	text-align: center;
}

.title h1 {
	font-size: 60px;
	color: rgb(23, 160, 101);
	line-height: 1.2;
	font-weight: 700;
	text-align: center;
}

.subStart {
	font-size: 28px;
	color: green;
	font-weight: 700;
}

.subContents {
	text-align: center;
	margin-top: 10px;
	font-size: 18px;
	line-height: 1.6;
}

.d-flex-center {
	display: flex;
	align-items: center;
	justify-content: center;
}

.carbon-leaf-img {
	margin-right: 10px;
	position: relative;
	top: -5px;
}
.textStress{
	color: green;
	text-decoration-line: underline;
}

</style>
</head>
<body>
	<!-- 탑 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	
	<div class="container text-center">
		<div class="title mt-5 mb-5">
			<h1 style="color: black;">탄소중립</h1>
			<h1>생활 실천하기</h1>
		</div>

		<div class="d-flex-center mb-3">
			<img
				src="${pageContext.request.contextPath}/resources/image/carbon_leaf.png"
				class="carbon-leaf-img">
			<h1 class="subStart">탄소중립,</h1>
		</div>

		<div class="subContents">
			<span>이미 많이 알고 계시지만 선뜻 실천하기 어려웠던 순간들이 많으셨죠?</span><br> <span>탄소중립
				실천포털에서는 실생활에서 적극적으로 실천할 수 있도록</span><br>
				<span style="color: green; text-decoration-line: underline;">에너지, 소비, 수송, 자원순환, 흡수원 5대 분야별로 분류해</span>
				<span>구체적인 방안을 소개하고 있어요.</span><br> <span>이제 일상
				속에서 쉽게 탄소중립 생활을 실천해보세요!</span>
		</div>
	</div>

	<!-- footer 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
