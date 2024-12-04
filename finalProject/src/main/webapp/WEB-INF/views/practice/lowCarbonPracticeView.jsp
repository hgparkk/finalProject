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

<!-- 케로셀js -->
<script src="js/Carousel.js"></script>

<style>
html, body {
	overflow-y: scroll;
	overflow-x: hidden;
	background-color: #f4f7f6;
	font-family: 'Noto Sans KR', sans-serif;
}

[data-scroll-container] {
	overflow: visible;
}

.container {
	padding: 50px;
}

.title h1 {
	font-size: 60px;
	color: rgb(23, 160, 101);
	line-height: 1.2;
	font-weight: 700;
}

.subStart {
	font-size: 28px;
	color: green;
	font-weight: 700;
	margin-left: 10px;
}

.carbon-leaf-img {
	width: 30px;
	margin-bottom: 5px;
}

.textStress {
	color: green;
	text-decoration-line: underline;
	font-weight: bold;
}

.photoTitle {
	font-weight: bold;
	font-size: 28px;
	color: black;
	margin-top: 20px;
}

.subContents {
	font-size: 20px;
}
/* Carousel styling */
.carousel-inner {
	text-align: center;
}

.photo-section-wrapper {
	padding: 40px 5vw;
}

/* 카드 크기 50% 확대 */
.photo-item {
	background-color: white;
	border-radius: 10px;
	overflow: hidden;
	text-align: center;
	width: 330px;
	height: 450px;
	padding: 15px;
	margin: auto;
}

.photo-item a {
	text-decoration: none;
	color: inherit;
	display: block;
}

.photo-item a:hover {
	cursor: pointer;
}

.photo-item img {
	width: 100%;
	height: 380px;
	object-fit: cover;
	border-radius: 10px;
	transition: transform 0.3s ease;
}

.photo-item a img:hover {
	transform: scale(1.05);
}

.photo-title {
	color: #333;
	font-weight: bold;
	margin-top: 10px;
	font-size: 20px;
}

/* Carousel Controls 위치 조정 및 크기 확대 */
.carousel-control-prev, .carousel-control-next {
	width: 7%; /* 버튼 크기 증가 */
	height: 7%; /* 버튼 크기 증가 */
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

.carousel-control-prev {
	left: calc(50% - 280px); /* 카드 왼쪽에서 100px 간격 */
}

.carousel-control-next {
	right: calc(50% - 280px); /* 카드 오른쪽에서 100px 간격 */
}

.home-go {
	border: 1px solid #CCCCCC;
	border-radius: 0.4vw;
	padding: 0.3vw;
	padding-left: 0.5vw;
	padding-right: 0.5vw;
	text-decoration: none;
	color: black;
	font-size: 1vw;
	margin-top: 50px
}

.home-go>img {
	width: 1vw;
	height: 1vw;
}

.slider {
	position: relative;
	width: 100%;
	max-width: 100%;
}

.slider .slider__inner {
	display: flex;
	position: relative;
	align-items: center;
	max-width: 750px;
	height: 400px;
	margin: 0 auto;
}

.slider .slider__inner .slider__item {
	position: absolute;
	height: 150px;
	width: 150px;
	opacity: 0;
	transition: all 0.3s ease-in-out;
	z-index: -1;
	user-select: none;
}

.slider .slider__inner .slider__item-trigger-next {
	left: 15%;
	transform: translateX(-50%);
}

.slider .slider__inner .slider__item-trigger-previous {
	left: 85%;
	transform: translateX(-50%);
}

.slider .slider__inner .slider__item-selected {
	box-shadow: 0 0 30px rgba(255, 255, 255, 0.6), 0 0 60px
		rgba(255, 255, 255, 0.45), 0 0 110px rgba(255, 255, 255, 0.25), 0 0
		100px rgba(255, 255, 255, 0.1);
	height: 300px;
	opacity: 1;
	left: 50%;
	transform: translateX(-50%);
	width: 300px;
	z-index: 2;
}

.slider .slider__inner .slider__item-previous, .slider .slider__inner .slider__item-next
	{
	height: 200px;
	opacity: 1;
	width: 200px;
	z-index: 1;
}

.slider .slider__inner .slider__item-last, .slider .slider__inner .slider__item-first
	{
	opacity: .4;
	z-index: 0;
}

.slider .slider__inner .slider__item-previous {
	left: 30%;
	transform: translateX(-50%);
}

.slider .slider__inner .slider__item-next {
	left: 70%;
	transform: translateX(-50%);
}

.slider .slider__inner .slider__item-first {
	left: 15%;
	transform: translateX(-50%);
}

.slider .slider__inner .slider__item-last {
	left: 85%;
	transform: translateX(-50%);
}

.slider .slider__inner .slider__item-container {
	position: relative;
	width: 100%;
	height: 100%;
}

.slider .slider__inner .slider__item-img {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
}

.slider .slider__inner .slider__item-datas {
	position: absolute;
	bottom: 0;
	width: 100%;
	padding: .5rem 0;
	background-color: rgba(255, 255, 255, 0.75);
	text-align: center;
	font-family: 'Arial';
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.slider .slider__controls {
	display: flex;
	position: absolute;
	left: 0;
	right: 0;
	width: 100%;
	justify-content: space-between;
	align-items: center;
}

.slider .slider__controls-previous, .slider .slider__controls-next {
	border: 0;
	cursor: pointer;
	font-size: 50px;
	background-color: transparent;
	color: rgba(0, 0, 0, 0.75);
	padding: 0;
}

.slider .slider__controls-previous:focus, .slider .slider__controls-next:focus
	{
	outline: none;
}
.slider__item-selected{
	cursor: pointer;
}

@media ( max-width : 750px) {
	.slider .slider__controls {
		display: none;
	}
}
</style>
</head>
<body data-scroll-container>
	<!-- 탑 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="w-50 d-flex align-items-center justify-content-end mb-5"
		style="margin-left: 600px;">
		<a class="home-go" href="${pageContext.request.contextPath }/"> <img
			src="${pageContext.request.contextPath}/resources/image/home.png">
			<span>홈으로 이동</span>
		</a>
	</div>

	<div class="container text-center" data-scroll>
		<!-- 제목 -->
		<div class="title mb-5">
			<h1 style="color: black;">탄소중립</h1>
			<h1>생활 실천하기</h1>
		</div>

		<!-- 서브 제목 -->
		<div
			class="d-flex align-items-center justify-content-center mb-3 mt-5"
			data-scroll>
			<img
				src="${pageContext.request.contextPath}/resources/image/carbon_leaf.png"
				class="carbon-leaf-img">
			<h1 class="subStart">탄소중립,</h1>
		</div>

		<!-- 서브 텍스트 -->
		<div class="subContents mb-5 mt-5" data-scroll>
			<p>일상에서 바로 적용할 수 있는 다양한 방법들을 통해 탄소중립 목표 달성에 함께 동참할 수 있습니다.</p>
			<p>탄소중립 실천포털에서는 실생활에서 적극적으로 실천할 수 있도록</p>
			<p class="textStress">에너지, 소비, 수송, 자원순환, 흡수원 5대 분야별로 분류해</p>
			<p>탄소중립 실천포털은 에너지, 소비, 수송, 자원순환, 흡수원 등 5대 분야로 나누어 구체적인 실천 방안을
				제공합니다.</p>
		</div>

		<div style="padding-top: 10px"></div>

		<div class="photoTitle">
			<span>탄소중립 생활 실천</span> <span style="color: green;">5대 분야</span>
		</div>
	</div>



	<!-- 케로셀 -->
	<div class="slider photo-section-wrapper">
		<div class="slider__inner">
			<!-- Slides -->

			<div class="slider__item">
				<div id="energyReduce" class="slider__item-container">
					<img
						src="${pageContext.request.contextPath}/resources/image/box1.jpg"
						class="slider__item-img" />
					<div class="slider__item-datas">
						<span>에너지 절약</span>
					</div>
				</div>
			</div>
			<div class="slider__item">
				<div id="ecoConsumption" class="slider__item-container">
					<img
						src="${pageContext.request.contextPath}/resources/image/box2.jpg"
						class="slider__item-img" />
					<div class="slider__item-datas">
						<span>친환경 소비</span>
					</div>
				</div>
			</div>
			<div class="slider__item">
				<div id="ecoMovement" class="slider__item-container">
					<img
						src="${pageContext.request.contextPath}/resources/image/box3.jpg"
						class="slider__item-img" />
					<div class="slider__item-datas">
						<span>친환경 이동</span>
					</div>
				</div>
			</div>
			<div class="slider__item">
				<div id="ecoCircular" class="slider__item-container">
					<img
						src="${pageContext.request.contextPath}/resources/image/box4.jpg"
						class="slider__item-img" />
					<div class="slider__item-datas">
						<span>자원순환</span>
					</div>
				</div>
			</div>
			<div class="slider__item">
				<div id="ecoSinks" class="slider__item-container">
					<img
						src="${pageContext.request.contextPath}/resources/image/box5.jpg"
						class="slider__item-img" />
					<div class="slider__item-datas">
						<span>흡수원 보호</span>
					</div>
				</div>
			</div>

			<!-- Slider Controls -->
			<div class="slider__controls"></div>
		</div>
	</div>


	<!-- footer 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<!-- Locomotive Scroll 및 Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.js"></script>
	<script>
		const scroll = new LocomotiveScroll({
			el : document.querySelector('[data-scroll-container]'),
			smooth : true,
			inertia : 0.75
		});

		
	</script>
	<!-- 케로셀 script -->
	<script type="text/javascript">
	const myCarousel = new Carousel({
	      container: document.querySelector('.slider'),
	      items: document.querySelectorAll('.slider__item'),
	      displayControls: true,
	      controlsContainer: document.querySelector('.slider__controls'),
	      textControls: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"]
	});
	
	document.getElementById('energyReduce').addEventListener('click',()=>{
		if(document.getElementById('energyReduce').parentElement.classList.contains('slider__item-selected')){
			window.location.href = '${pageContext.request.contextPath}/energyReduceView'
		}
	});
	
	document.getElementById('ecoConsumption').addEventListener('click',()=>{
		if(document.getElementById('ecoConsumption').parentElement.classList.contains('slider__item-selected')){
			window.location.href = '${pageContext.request.contextPath}/ecoConsumptionView'
		}
	});
	
	document.getElementById('ecoMovement').addEventListener('click',()=>{
		if(document.getElementById('ecoMovement').parentElement.classList.contains('slider__item-selected')){
			window.location.href = '${pageContext.request.contextPath}/ecoMovementView'
		}
	});
	
	document.getElementById('ecoCircular').addEventListener('click',()=>{
		if(document.getElementById('ecoCircular').parentElement.classList.contains('slider__item-selected')){
			window.location.href = '${pageContext.request.contextPath}/ecoCircularView'
		}
	});
	
	document.getElementById('ecoSinks').addEventListener('click',()=>{
		if(document.getElementById('ecoSinks').parentElement.classList.contains('slider__item-selected')){
			window.location.href = '${pageContext.request.contextPath}/ecoSinksView'
		}
	});
	





	
	</script>
</body>
</html>
