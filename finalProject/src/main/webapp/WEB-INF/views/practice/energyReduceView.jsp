<%@ page language="java" pageEncoding="UTF-8"%>
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

<style>
html, body {
	overflow-y: scroll;
	overflow-x: hidden;
	background-color: #f4f7f6;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
	min-height: 100vh;
}

[data-scroll-container] {
	overflow: visible;
	min-height: 100%;
}

.title {
	position: relative;
	text-align: center;
	color: white;
	width: 100vw;
	margin: 0 auto;
	min-height: 80vh;
}

.title img {
	width: 100%;
	height: 80vh;
	object-fit: cover;
}

.title::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.title-content {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
	width: 90%;
	max-width: 800px;
	text-align: center;
}

.title span {
	font-size: 40px;
	font-weight: 700;
	color: white;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
	margin-bottom: 10px;
	display: block;
}

.title h1 {
	font-weight: bold;
	color: white;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
	margin: 10px 0;
	font-size: 24px;
	line-height: 1.5;
}

.paired-text {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px 0;
}

.paired-text h2 {
	margin: 0 15px;
	font-weight: bold;
}

.text-blue {
	color: #007bff;
}

.text-light-green {
	color: #7fbf7f;
}

/* 대괄호가 양옆으로 이동하는 애니메이션 */
.bracket {
	font-size: 40px;
	position: relative;
	opacity: 1;
	margin: 0 5px;
	display: inline-block;
}

.bracket-left {
	transform: translateX(5px); /* 더욱 중앙으로 붙인 상태 */
	animation: moveLeft 1s forwards ease-in-out 0.5s; /* 왼쪽으로 이동 */
}

.bracket-right {
	transform: translateX(-5px); /* 더욱 중앙으로 붙인 상태 */
	animation: moveRight 1s forwards ease-in-out 0.5s; /* 오른쪽으로 이동 */
}

@
keyframes moveLeft { 0% {
	transform: translateX(5px);
}

100


%
{
transform


:


translateX
(


-10px


)
;


} /* 왼쪽으로 이동 */
}
@
keyframes moveRight { 0% {
	transform: translateX(-5px);
}

100


%
{
transform


:


translateX
(


10px


)
;


} /* 오른쪽으로 이동 */
}

/* 텍스트 서서히 나타나는 애니메이션 */
.fade-in-text {
	opacity: 0;
	animation: fadeInText 1s forwards ease-in-out 1.5s; /* 대괄호가 열린 후 나타남 */
	display: inline;
}

@
keyframes fadeInText { 0% {
	opacity: 0;
}

100


%
{
opacity


:


1
;


}
}

/* 전원 버튼과 텍스트 섹션 */
.darkModePart {
	width: 90%;
	max-width: 1200px;
	height: 80vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
	margin: 50px auto;
	padding: 20px;
	transition: background-color 0.3s, color 0.3s; /* 다크모드 전환 애니메이션 */
}

.power-button {
	position: relative;
	width: 20%;
	max-width: 150px;
	margin-bottom: 20px;
	cursor: pointer; /* 클릭 가능한 버튼으로 표시 */
}

.power-button img {
	width: 100%;
	height: auto;
	object-fit: contain;
	transition: filter 0.3s; /* 이미지 색상 변경을 위한 애니메이션 */
}

.speech-bubble {
	position: absolute;
	top: -30px;
	right: -80px;
	background-color: #007bff;
	color: #ffffff;
	padding: 10px 15px;
	border-radius: 20px;
	font-size: 14px;
	line-height: 1.2;
	width: 150px;
	text-align: center;
}

.speech-bubble::after {
	content: '';
	position: absolute;
	top: 50%;
	left: -10px;
	transform: translateY(-50%);
	border: 10px solid transparent;
	border-right-color: #007bff;
}

.main-title {
	font-size: 2rem;
	font-weight: 700;
	margin-bottom: 20px;
}

.sub-title {
	font-size: 1.1rem;
	font-weight: 500;
	color: #666;
	line-height: 1.6;
	margin-top: 20px;
	max-width: 800px;
	transition: color 0.3s; /* 색상 변경 애니메이션 */
}

.tags {
	display: flex;
	gap: 10px;
	margin-top: 20px;
	flex-wrap: wrap;
	justify-content: center;
}

.tag {
	background-color: #e0e0e0;
	color: #333;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 14px;
}

/* 다크 모드 스타일 */
.dark-mode {
	background-color: #333;
	color: #ffffff;
}

.dark-mode .sub-title {
	color: #ffffff;
}

.dark-mode .tag {
	background-color: #555;
	color: #ffffff;
}

.dark-mode .speech-bubble {
	background-color: #555;
}

.dark-mode .speech-bubble::after {
	border-right-color: #555;
}

.dark-mode .power-button img {
	filter: brightness(0) invert(1); /* 이미지 색상을 흰색으로 변경 */
}

/* threeBoxSelect 스타일 */
.threeBoxSelect {
	display: flex;
	justify-content: space-between;
	margin: 50px auto;
	width: 90%;
	max-width: 1200px;
}

.threeBoxSelect .box {
	width: 30%;
	background-color: green;
	color: #ffffff;
	border-radius: 10px;
	overflow: hidden;
	text-align: center;
	padding: 20px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.threeBoxSelect .box img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-bottom: 3px solid #555;
	margin-bottom: 15px;
}

.threeBoxSelect .box span {
	font-size: 1.2rem;
	font-weight: bold;
	display: block;
	margin-top: 10px;
}

.threeBoxSelect .box:hover {
	transform: scale(1.05);
}
</style>

</head>
<body data-scroll-container>
	<!-- 탑 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="title">
		<img
			src="${pageContext.request.contextPath}/resources/image/energyReduceMain.jpg"
			alt="에너지 절약 이미지">
		<div class="title-content">
			<span>탄소중립</span>
			<h1 class="mb-5">에너지 절약편</h1>

			<div class="paired-text">
				<h2 class="text-blue">전원은</h2>
				<span class="bracket bracket-left">[</span>
				<h2 class="fade-in-text text-blue">끄고</h2>
				<span class="bracket bracket-right">]</span>
			</div>

			<div class="paired-text">
				<h2 class="text-light-green">실천은</h2>
				<span class="bracket bracket-left">[</span>
				<h2 class="fade-in-text text-light-green">켜자</h2>
				<span class="bracket bracket-right">]</span>
			</div>

			<h1 class="mt-5">탄소중립은 대기 중 온실가스 농도가 인간 활동에 의해 더 이상 증가되지 않도록,</h1>
			<h1>배출량을 최대한 줄이고, 흡수량을 늘려 순 배출량이 ‘0’이 되도록 하는 것입니다.</h1>
			<h1>‘넷 제로(Net Zero), 탄소 제로(Carbon Zero)’라고도 합니다.</h1>
		</div>
	</div>

	<!-- 전원 버튼과 텍스트 부분 -->
	<div class="darkModePart" id="darkModePart">
		<div class="power-button" onclick="toggleDarkMode()">
			<img
				src="${pageContext.request.contextPath}/resources/image/on_off_button.png"
				alt="전원 버튼" id="powerButtonImage">
			<div class="speech-bubble">
				전원버튼을 클릭하여<br>에너지 절약을 실천해 주세요!
			</div>
		</div>

		<div class="main-title">조금 불편해도, 지구를 위해 에너지 절약을 실천했던 적이 있나요?</div>

		<div class="tags">
			<span class="tag">#생활 속</span> <span class="tag">#에너지 절약법</span>
		</div>

		<div class="sub-title">
			생활 속에서 실천할 수 있는 에너지 절약법은 무엇이 있을까요?<br> 모니터 화면이나 스마트폰 화면에서 다크 모드를
			적용하면 소비전력이 25~30% 줄어들어 탄소 배출 저감에 기여할 수 있습니다. 탄소중립 사회 전환은 우리의 작은 생활습관의
			변화로부터 시작합니다.
		</div>
	</div>

	<!-- 세 개의 박스 섹션 -->
	<div class="threeBoxSelect">
		<div class="box homeBox">
			<img
				src="${pageContext.request.contextPath}/resources/image/home.jpg"
				alt="가정에서"> <span>#가정에서</span>
		</div>
		<div class="box schoolBox">
			<img
				src="${pageContext.request.contextPath}/resources/image/school.jpg"
				alt="학교에서"> <span>#학교에서</span>
		</div>
		<div class="box enterpriseBox">
			<img
				src="${pageContext.request.contextPath}/resources/image/enterprise.jpg"
				alt="기업에서"> <span>#기업에서</span>
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

		// 다크 모드 전환 함수
		function toggleDarkMode() {
			const darkModePart = document.getElementById("darkModePart");
			const powerButtonImage = document
					.getElementById("powerButtonImage");
			darkModePart.classList.toggle("dark-mode");

			// 다크 모드에 따라 전원 버튼 이미지 변경
			if (darkModePart.classList.contains("dark-mode")) {
				powerButtonImage.style.filter = "brightness(0) invert(1)"; // 흰색으로 변경
			} else {
				powerButtonImage.style.filter = "none"; // 원래 색상으로 복구
			}
		}
	</script>
</body>
</html>
