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

#header {
	background-color: transparent;
	transition: background-color 0.3s ease; /* 부드러운 전환 */
	width: 100%;
	color: black;
}

/* 스크롤 후 변경될 배경색 */
.scrolled {
	background-color: blue !important;
	color: white !important;
}

.top-container {
	width: 100%;
	height: 100%;
	justify-content: space-between;
}

.img-box {
	width: 15%;
}

.main-box {
	width: 60%;
	font-size: 1vw;
}

.main {
	font-size: 1.5vw;
	font-weight: bold;
}

.dropdown {
	width: 20%;
}

.dropdonw-menu {
	width: 110%;
}

.co2 {
	width: 20%;
	font-weight: bold;
}

.aTag {
	width: 100%;
	font-size: 1vw;
	color: black;
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	justify-content: center;
	display: flex;
	font-weight: bold;
}

.login-box {
	width: 15%;
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
}
</style>
</head>


<body>

	<nav class="navbar fixed-top p-0" id="header">
		<div class="d-flex top-container">
			<div class="img-box d-flex align-items-center justify-content-center">
				<a
					class="nav-link main d-flex align-items-center justify-content-center"
					href="#"> <img src="image/favicon.ico"> Coding Bamboo
				</a>
			</div>

			<div class="d-flex main-box">
				<div
					class="dropdown d-flex align-items-center justify-content-center me-2">
					<a class="aTag" data-bs-toggle="dropdown" style="font-size: 0.9vw">탄소중립
						생활 실천 소개</a>
					<ul class="dropdown-menu nav-item">
						<li><a class="dropdown-item detail" href="#">탄소중립 생활 실천
								소개</a></li>
					</ul>
				</div>
				<a
					class="nav-link co2 me-2 d-flex align-items-center justify-content-center"
					href="#">탄소발자국 계산</a>
				<div
					class="dropdown d-flex align-items-center nav-link justify-content-center me-2">
					<a class="aTag" data-bs-toggle="dropdown" id="header">탄소중립 알려드려요</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item detail" href="#">탄소
								저감 기술 연구 동향</a></li>
					</ul>
				</div>

				<div
					class="dropdown d-flex align-items-center justify-content-center me-2">
					<a class="aTag" data-bs-toggle="dropdown" aria-expanded="false" id="header">소통공간</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item detail" href="#">건의하기</a></li>
						<%-- <c:if test="">
						<li><a class="dropdown-item" href="#">건의사항 목록</a></li>
					</c:if> --%>
						<li><a class="dropdown-item detail" href="#">공지사항</a></li>
					</ul>
				</div>
				<a
					class="nav-link co2 d-flex align-items-center justify-content-center"
					href="#">태양광 발전 예측 지도</a>
			</div>
			<div
				class="login-box d-flex align-items-center justify-content-center">
				<c:if test="${sessionScope.login == null }">
					<a class="nav-link login" href="#">로그인</a>
				</c:if>
				<c:if test="${sessionScope.login != null }">
					<a class="nav-link rounded" href="#">로그아웃</a>
				</c:if>
			</div>
		</div>
	</nav>

</body>
<script type="text/javascript">
	window.addEventListener('scroll', function() {
		const header = document.getElementById('header');
		const aTag = document.querySelectorAll(".aTag");
		const scrollThreshold = 100; // 배경색 변경을 시작할 스크롤 위치(px)

		if (window.scrollY > scrollThreshold) {
			header.classList.add('scrolled');
			aTag.forEach(link => link.classList.add('scrolled'));
		} else {
			header.classList.remove('scrolled');
			aTag.forEach(link => link.classList.remove('scrolled'));
		}
	});
</script>
</html>