<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	width: 55%;
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
	opacity: 0;
	visibility: hidden;
	position: absolute;
	left: -10%;
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
	visibility: visible;
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

.aTag-not {
	font-size: 1vw;
	font-weight: bold;
	color: black;
	text-decoration: none;
	padding: 0 1vw; /* 좌우 간격을 균등하게 추가 */
}

.login-box {
	width: 22%;
	display: flex;
	justify-content: flex-end;
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
	width: 120%;
}
</style>

<nav class="navbar p-0">
	<div class="d-flex top-container">
		<c:if test="${sessionScope.login.userIsmaster != 1}">
			<div class="img-box d-flex align-items-center justify-content-center">
				<a class="nav-link main d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }">
					<img src="image/favicon.ico"> Coding Bamboo
				</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.login.userIsmaster == 1}">
			<div class="img-box d-flex align-items-center justify-content-center">
				<a class="nav-link main d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }/adminHomeView">
					<img src="image/favicon.ico"> Coding Bamboo
				</a>
			</div>
		</c:if>

		<div class="d-flex main-box">
			<c:if test="${sessionScope.login.userIsmaster != 1}">
				<!-- 탄소중립 알려드려요 드롭다운 -->
				<div class="dropdown-body">
					<span class="aTag dropdown-text">탄소중립 알려드려요</span>
					<div class="dropdown-select">
						<a class="detail" href="${pageContext.request.contextPath}/lowCarbonPracticeView">탄소중립 생활 실천 소개</a>
						<a class="detail" href="${pageContext.request.contextPath }/carbonResearchView">탄소저감기술 연구동향</a>
					</div>
				</div>

				<!-- 탄소중립 참여해요 드롭다운 -->
				<div class="dropdown-body">
					<span class="aTag dropdown-text">탄소중립 참여해요</span>
					<div class="dropdown-select">
						<a class="detail" href="${pageContext.request.contextPath}/campaignView">캠페인</a>
					</div>
				</div>

				<!-- 소통공간 드롭다운 -->
				<div class="dropdown-body">
					<span class="aTag dropdown-text">소통공간</span>
					<div class="dropdown-select">
						<a class="detail" href="#">건의하기</a>
						<a class="detail" href="${pageContext.request.contextPath }/noticeView">공지사항</a>
					</div>
				</div>

				<a class="nav-link co2" href="${pageContext.request.contextPath }/carbonCalView">탄소발자국 계산</a>
				<a class="nav-link co2" href="${pageContext.request.contextPath}/solarRadiationView">태양광 발전량 모의 예측</a>
			</c:if>
			<c:if test="${sessionScope.login != null && sessionScope.login.userIsmaster == 1}">
				<!-- 탄소중립 알려드려요 드롭다운 -->
				<div class="dropdown-body">
					<span class="aTag dropdown-text">탄소중립 알려드려요</span>
					<div class="dropdown-select">
						<a class="detail" href="${pageContext.request.contextPath }/carbonResearchView">탄소저감기술 연구동향</a>
					</div>
				</div>

				<!-- 탄소중립 참여해요 드롭다운 -->
				<div class="dropdown-body">
					<span class="aTag dropdown-text">탄소중립 참여해요</span>
					<div class="dropdown-select">
						<a class="detail" href="${pageContext.request.contextPath}/campaignView">캠페인</a>
					</div>
				</div>

				<!-- 소통공간 드롭다운 -->
				<div class="dropdown-body">
					<span class="aTag dropdown-text">소통공간</span>
					<div class="dropdown-select">
						<a class="detail" href="${pageContext.request.contextPath}/adminSuggestionsView">건의사항 목록</a>
						<a class="detail" href="${pageContext.request.contextPath }/noticeView">공지사항</a>
					</div>
				</div>
			</c:if>

		</div>

		<!-- 로그인 부분 -->
		<div class="login-box">
			<c:if test="${sessionScope.login == null }">
				<a class="nav-link login" href="${pageContext.request.contextPath }/loginView">로그인</a>
			</c:if>
			<c:if test="${sessionScope.login.userIsmaster == 1}">
				<span class="aTag-not">${sessionScope.login.userName}</span>
				<a class="aTag" href="${pageContext.request.contextPath }/adminHomeView">관리 메뉴</a>
				<a class="aTag" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a>
			</c:if>
			<c:if test="${sessionScope.login != null && sessionScope.login.userIsmaster != 1}">
				<span class="aTag-not">${sessionScope.login.userName}</span>
				<a class="aTag" href="${pageContext.request.contextPath }/myPageMyCarbonResultView">마이페이지</a>
				<a class="aTag" href="${pageContext.request.contextPath }/logoutDo">로그아웃</a>
			</c:if>
		</div>
	</div>
</nav>
