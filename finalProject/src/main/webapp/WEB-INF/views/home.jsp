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

	<!-- 계산기 및 태양열 지도 파트 -->
	<section class="feature-section">
		<div class="container">
			<div class="row text-center d-flex align-items-stretch">
				<div class="col-md-6 mb-4 d-flex">
					<div class="feature-box flex-fill">
						<div class="hover-image-container">
							<img src="${pageContext.request.contextPath}/resources/image/sub_2.jpg" alt="탄소 발자국 계산기 이미지">
						</div>
						<div class="content-overlay">
							<h4>탄소 발자국 계산기</h4>
							<p>당신의 생활에서 발생하는 탄소 배출량을 계산하고 줄이는 방법을 알아보세요.</p>
							<a href="#" class="btn btn-primary mt-3">계산기 사용하기</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 mb-4 d-flex">
					<div class="feature-box flex-fill">
						<div class="hover-image-container">
							<img src="${pageContext.request.contextPath}/resources/image/sub_1.jpg" alt="태양열 발전 예측 지도 이미지">
						</div>
						<div class="content-overlay">
							<h4>태양열 발전 예측 지도</h4>
							<p>당신의 지역에서 태양열 발전량을 예측하고 환경에 미치는 영향을 확인해보세요.</p>
							<a href="#" class="btn btn-primary mt-3">예측 하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 탄소실천, 고객 문의 -->
	<div class="container py-5">
		<div class="row g-3 mb-5">
			<div class="col-md-6">
				<a href="#" class="service-link">
					<img src="${pageContext.request.contextPath}/resources/image/carbon_neutral.png" alt="탄소 중립 아이콘">
					<div>
						<h3>탄소 중립 생활 실천</h3>
						<p>탄소 중립 생활 실천 방법을 안내해 드립니다.</p>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="#" class="service-link">
					<img src="${pageContext.request.contextPath}/resources/image/talk.png" alt="고객 건의 아이콘">
					<div>
						<h3>건의 사항</h3>
						<p>언제나 고객의 소리에 귀 기울이겠습니다.</p>
					</div>
				</a>
			</div>
		</div>

		<!-- 공지사항 미리보기 -->
		<div class="position-relative mb-4">
			<h2 class="text-center fw-bold m-0">공지사항</h2>
			<a href="#" class="position-absolute text-decoration-none text-success" style="right: 20px; bottom: 0; margin-left: -20px;">더보기</a>
		</div>

		<div class="not_slide">
			<ul class="list-unstyled">
				<li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
					<span>공지사항1</span> <span class="text-muted">2000.00.00</span>
				</a></li>
				<li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
					<span>공지사항2</span> <span class="text-muted">2000.00.00</span>
				</a></li>
				<li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
					<span>공지사항3</span> <span class="text-muted">2000.00.00</span>
				</a></li>
			</ul>
		</div>

		<!-- 탄소저감기술 연구 동향 -->
		<div class="position-relative mb-5 mt-5">
			<h2 class="text-center fw-bold m-0">탄소저감기술 연구 동향</h2>
			<a href="#" class="position-absolute text-decoration-none text-success" style="right: 20px; bottom: 0; margin-left: -20px;">더보기</a>
		</div>

		<div class="not_slide mb-5 mt-5">
			<ul class="list-unstyled">
				<li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
					<span>연구동향1</span> <span class="text-muted">2000.00.00</span>
				</a></li>
				<li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
					<span>연구동향2</span> <span class="text-muted">2000.00.00</span>
				</a></li>
				<li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
					<span>연구동향3</span> <span class="text-muted">2000.00.00</span>
				</a></li>
			</ul>
		</div>
	</div>


	<!-- footer 인클루드 파일 -->
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
