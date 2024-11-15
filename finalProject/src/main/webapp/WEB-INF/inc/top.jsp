<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.navbar {
	width: 100%;
	height: 10vh;
}

.top-container {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.img-box {
	width: 16%;
}

.main-box {
	width: 60%;
	display: flex;
	justify-content: space-between;
	font-size: 1vw;
	align-items: center;
}

.main {
	font-size: 1.2vw;
	font-weight: bold;
}

.dropdown-body {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 20%;
	text-align: center;
}

:root { -
	-dropdown-width: 100%;
}

.dropdown-select {
	width: var(- -dropdown-width);
	opacity: 0;
	position: absolute;
	left: 0;
	top: 100%;
	background-color: green;
	padding-top: 1vh;
	padding-bottom: 1vh;
	border-radius: 1vw;
	transition-duration: 0.3s;
	font-size: 1vw;
	z-index: 10;
	box-sizing: border-box;
}

.dropdown-body:hover>.dropdown-select {
	opacity: 100%;
}

.co2 {
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
}

.co2:hover {
	color: green;
}

.aTag {
	font-size: 1vw;
	font-weight: bold;
	color: black;
	text-decoration: none;
	cursor: pointer;
	padding: 0 1vw; /* 좌우 간격을 균등하게 추가 */
}

.aTag:hover {
	color: green;
}

.login-box {
	width: 13.5%;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	margin-right: 0.5vw;
}

.login {
	font-size: 1vw;
	font-weight: bold;
}

.detail {
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	font-size: 0.9vw;
	color: white;
	margin-top: 0.5vw;
	margin-bottom: 0.5vw;
	padding: 0.5vw;
}

.detail:hover {
	font-weight: bold;
}

.nav-link {
	margin: 0 1vw;
}

.dropdown-body, .aTag {
	display: flex;
	justify-content: center;
	align-items: center;
}

.dropdown-body {
	width: auto;
}

.dropdown-select a {
	padding: 0.8vw 0;
	line-height: 1;
}

.dropdown-select {
	margin-top: 0.4vw;
	width: 100%;
}
</style>
</head>

<body>

	<nav class="navbar p-0">
		<div class="d-flex top-container">
			<div class="img-box d-flex align-items-center justify-content-center">
				<a
					class="nav-link main d-flex align-items-center justify-content-center"
					href="${pageContext.request.contextPath }"> <img
					src="image/favicon.ico"> Coding Bamboo
				</a>
			</div>

			<div class="d-flex main-box">

				<!-- 탄소중립 알려드려요 드롭다운 -->
				<div class="dropdown-body">
					<a class="aTag" href="">탄소중립 알려드려요</a>
					<div class="dropdown-select">
						<a class="detail"
							href="${pageContext.request.contextPath}/lowCarbonPracticeView">탄소중립
							생활 실천 소개</a> <a class="detail" href="#">탄소저감기술 연구동향</a>
					</div>
				</div>

				<!-- 소통공간 드롭다운 -->
				<div class="dropdown-body">
					<a class="aTag">소통공간</a>
					<div class="dropdown-select">
						<c:if test="${sessionScope.login.userIsmaster != 1}">
							<a class="detail" href="#">건의하기</a>
						</c:if>
						<c:if test="${sessionScope.login.userIsmaster == 1}">
							<a class="detail" href="#">건의사항 목록</a>
						</c:if>
						<a class="detail" href="#">공지사항</a>
					</div>
				</div>

				<a class="nav-link co2"
					href="${pageContext.request.contextPath }/carbonCalView">탄소발자국
					계산</a> <a class="nav-link co2" href="#">태양광 발전 예측 지도</a>
			</div>

			<!-- 로그인 부분 -->
			<div class="login-box">
				<c:if test="${sessionScope.login == null }">
					<a class="nav-link login"
						href="${pageContext.request.contextPath }/loginView">로그인</a>
				</c:if>
				<c:if
					test="${sessionScope.login != null && sessionScope.login.userIsmaster == 1}">
					<a class="aTag">${sessionScope.login.userId }</a>
					<a class="aTag" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a>
				</c:if>
				<c:if
					test="${sessionScope.login != null && sessionScope.login.userIsmaster != 1}">
					<a class="aTag"
						href="${pageContext.request.contextPath }/myPageUserInfoView">${sessionScope.login.userId }</a>
					<a class="aTag" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>

</body>

</html>
