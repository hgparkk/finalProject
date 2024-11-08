<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

<style type="text/css">
.carbonCal-container {
	width: 100%;
	max-width: 1300px;
	min-width: 500px;
	display:flex;
	justify-content: center;
	margin: auto;
}

.carbonCal-title{
	width: 100%;
	height: 10vh;
}

.home-go{
	border: 1px solid #CCCCCC;
	border-radius: 0.4vw;
	padding: 0.3vw;
	padding-left: 0.5vw;
	padding-right: 0.5vw;
	text-decoration: none;
	color: black;
	font-size: 1vw
}

.home-go > img{
	width: 1vw;
	height: 1vw;
}
</style>
</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="carbonCal-container">
		<div class="carbonCal-title w-50">
			<h1 style="color:green; font-weight:bold;">탄소발자국 계산기</h1>
			<span style="font-size:0.7vw;">내가 생활 속에서 배출화는 이산화탄소의 양은 얼마나 될까요?</span>
		</div>
		<div class="w-50 d-flex align-items-center justify-content-end">
			<a class="home-go" href="${pageContext.request.contextPath }">
				<img src="${pageContext.request.contextPath}/resources/image/home.png">
				<span>홈으로 이동</span>
			</a>
		</div>
		<div>
			
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>