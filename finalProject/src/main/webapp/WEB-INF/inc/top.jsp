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
	justify-content: space-around;
}

.empty {
	width: 0.5%
}

.img-box {
	width: 16%;
}

.main-box {
	width: 60%;
	font-size: 1vw;
}

.main {
	font-size: 1.5vw;
	font-weight: bold;
}

.dropdown-body {
	width: 20%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
}

.dropdown-body2 {
	width: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
}

.dropdown-select {
	width: 95%;
	opacity: 0;
	position: absolute;
	left: 2.5%;
	top: calc(80%);
	background-color: green;
	padding-top: 1vh;
	padding-bottom: 1vh;
	border-radius: 1vw;
	transition-duration: 0.3s;
}

.dropdown-select2 {
	width: 95%;
	opacity: 0;
	position: absolute;
	left: -25%;
	top: calc(80%);
	background-color: green;
	padding-top: 1vh;
	padding-bottom: 1vh;
	border-radius: 1vw;
	transition-duration: 0.3s;
}

.co2 {
	width: 20%;
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
}

.co2:hover {
	color: green;
}

.aTag {
	width: 100%;
	font-size: 1vw;
	font-weight: bold;
	color: black;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	cursor: pointer;
}

.aTag:hover {
	color: green
}

.dropdown-body:hover>.dropdown-select {
	opacity: 100%;
}

.dropdown-body2:hover>.dropdown-select2 {
	opacity: 100%;
}

.login-box {
	width: 13.5%;
	align-items: center;
	justify-content: center;
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
}

.detail:hover {
	font-weight: bold;
}
</style>
</head>


<body>

	<nav class="navbar p-0">
		<div class="d-flex top-container">
			<div class="empty"></div>
			<div class="img-box d-flex align-items-center justify-content-center">
				<a
					class="nav-link main d-flex align-items-center justify-content-center"
					href="${pageContext.request.contextPath }"> <img
					src="image/favicon.ico"> Coding Bamboo
				</a>
			</div>

			<div class="d-flex main-box">
				<a class="nav-link co2 me-2" href="#">탄소중립 생활 실천 소개</a> <a
					class="nav-link co2 me-2"
					href="${pageContext.request.contextPath }/carbonCalView">탄소발자국
					계산</a>

				<div class="dropdown-body me-2">
					<a class="aTag">탄소중립 알려드려요 </a>
					<div class="dropdown-select">
						<a class="detail" href="#">탄소저감기술 연구동향</a>
					</div>
				</div>

				<div class="dropdown-body me-2">
					<a class="aTag">소통공간 </a>
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
				<a class="nav-link co2" href="#">태양광 발전 예측 지도</a>
			</div>
			<div
				class="login-box d-flex align-items-center justify-content-start">
				<c:if test="${sessionScope.login == null }">
					<a class="nav-link login"
						href="${pageContext.request.contextPath }/loginView">로그인</a>
				</c:if>
				<c:if test="${sessionScope.login != null }">
					<div class="dropdown-body2">
						<a class="aTag d-flex justify-content-start">${sessionScope.login.userId }</a>
						<c:if test="${sessionScope.login.userIsmaster != 1 }">
							<div class="dropdown-select2 mt-3">
								<a class="detail"
									href="${pageContext.request.contextPath }/myPageUserInfoView">마이페이지</a>
								<a class="detail"
									href="${pageContext.request.contextPath }/myPageMySuggestionsView">나의
									건의사항</a> <a class="detail"
									href="${pageContext.request.contextPath }/pwChangeView">회원
									관리</a>
							</div>
						</c:if>
					</div>
					<a class="nav-link login" style="margin-right: 0.5vw;"
						href="${pageContext.request.contextPath }/logoutDo">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>

</body>
</html>