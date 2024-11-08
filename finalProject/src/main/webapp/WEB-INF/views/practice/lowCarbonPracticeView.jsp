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
<!-- Cafe24 Ssurround 폰트 임포트 -->
<link
	href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/Cafe24Ssurround.woff2"
	rel="stylesheet">

<!-- 헤더 인클루드 파일 -->
<%@ include file="/WEB-INF/inc/header.jsp"%>
<!-- Locomotive Scroll CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.css">
<style type="text/css">
html, body {
	overflow: hidden;
	background-color: ivory;
}

.container {
	padding: 50px;
}

.title {
	width: 500px%;
	padding: 10px;
	text-align: center;
}

.title h1 {
    font-family: "Cafe24 Ssurround", sans-serif;
    font-size: 73px;
    color: rgb(23, 160, 101);
    background-color: rgba(0, 0, 0, 0);
    line-height: 114.062px;
    letter-spacing: -5px;
    word-spacing: 0px;
    font-weight: 700;
    font-style: normal;
    font-variant: normal;
    text-transform: none;
    text-decoration: none;
    text-align: center;
    text-indent: 0px;
    vertical-align: baseline;
}
</style>
</head>
<body>
	<!-- 탑 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container d-flex flex-column align-items-center">
		<div class="title mt-5 mb-5">
			<h1>탄소중립 생활 실천하기</h1>
		</div>
	</div>
	<!-- footer 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
