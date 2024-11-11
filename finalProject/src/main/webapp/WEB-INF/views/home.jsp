<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 헤더 인클루드 파일 -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

<!-- Locomotive Scroll CSS -->
<link rel="stylesheet" href="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.css">

<style>
/* General styling for the main content */
html, body {
	overflow: hidden;
	background-color: #f4f7f6;
}

.video-container {
	position: relative;
	width: 100vw;
	height: 500px;
	overflow: hidden;
}

.video-container video {
	width: 100vw;
	height: 100%;
	object-fit: cover;
	object-position: center center;
}

.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 2rem;
	font-weight: bold;
	text-align: center;
	padding: 1rem;
	background: rgba(0, 0, 0, 0.4);
	border-radius: 0.5rem;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
}

.feature-section, .not_slide-section {
	padding: 50px 0;
	background-color: #f4f7f6;
}

.feature-box {
	position: relative;
	border: 1px solid #ddd;
	border-radius: 10px;
	overflow: hidden;
	transition: all 0.3s ease;
	text-align: center;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.feature-box:hover .hover-image-container img {
	transform: scale(1.1);
}

.hover-image-container {
	position: relative;
	height: 250px;
	overflow: hidden;
}

.hover-image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.5s ease;
}

.content-overlay {
	padding: 20px;
}

.service-link {
    display: flex;
    align-items: center;
    text-align: center;
    padding: 1.5rem;
    background-color: #fff;
    border-radius: .5rem;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s, color 0.3s;
    color: #333;
    text-decoration: none;
    flex-direction: column;
}

.service-link:hover {
	background-color: green;
	color: white;
}

.service-link img {
	width: 70px;
	height: auto;
	margin-bottom: 15px;
}

.not_slide ul {
	list-style: none;
	padding: 0;
}

.not_slide li {
	display: flex;
	justify-content: space-between;
	padding: .75rem 1rem;
	border-bottom: 1px solid #ddd;
	transition: background-color 0.3s;
}

.not_slide li:hover {
	background-color: #d0f0c0;
}

/* Footer-specific styles */
.footer {
	width: 100%;
}

.footer-container {
	width: 100%;
	height: 20vh;
}

.footer-box {
	width: 55%;
	justify-content: center;
	margin: 0px;
	padding: 0px;
	columns: 0;
	flex-direction: column;
	font-size: 1vw;
}

.dropdown-menu {
	text-transform: translate(100px, 100px);
}

.main-img-box {
	width: 25%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn-find {
	width: 20%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.tags {
	display: flex;
	justify-content: center;
}

.line {
	border: 0.5px solid #DDDDDD;
}

.btn-success {
	width: 13vw;
	font-size: 1vw;
}

.detail2 {
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	font-size: 0.9vw;
	color: black;
	margin-top: 0.5vw;
	margin-bottom: 0.5vw;
}

.dropdown-menu {
	width: 13vw;
}
</style>
</head>
<body data-scroll-container>

	<!-- 탑 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- 메인 비디오 파트 -->
	<div class="video-container" data-scroll>
		<video autoplay muted loop playsinline>
			<source src="${pageContext.request.contextPath}/resources/video/main.mp4" type="video/mp4">
		</video>
		<div class="text-overlay">
			<p>대전 지역 탄소 및 태양광 발전 예측</p>
			<p>미래를 위한 스마트 에너지 솔루션</p>
			<p>Coding Bamboo</p>
		</div>
	</div>

	<!-- 캠페인 미리보기 파트 -->
	<div class="container my-5 text-center">
		<h2>캠페인 미리보기 파트</h2>
		<p>이곳에 캠페인 내용을 간략하게 소개(더보기 누르면 이동)</p>
	</div>

	<!-- 기타 섹션들 (계산기, 태양열 지도, 서비스 링크 등) -->
	<section class="feature-section">
		<div class="container">
			<div class="row text-center d-flex align-items-stretch">
				<!-- Your existing feature box content -->
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<!-- Bootstrap 및 Locomotive Scroll JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.js"></script>
	<script>
		const scroll = new LocomotiveScroll({
			el: document.querySelector('[data-scroll-container]'),
			smooth: true,
			smoothMobile: true,
			inertia: 0.75
		});
	</script>
</body>
</html>
