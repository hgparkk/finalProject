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

/* 대괄호 애니메이션 */
.bracket {
	font-size: 40px;
	position: relative;
	margin: 0 5px;
	display: inline-block;
}

.bracket-left {
	transform: translateX(10px);
	animation: moveLeft 1s forwards ease-in-out 0.5s;
}

.bracket-right {
	transform: translateX(-10px);
	animation: moveRight 1s forwards ease-in-out 0.5s;
}

@keyframes moveLeft {
    0% {
        transform: translateX(10px);
    }
    100% {
        transform: translateX(-10px);
    }
}

@keyframes moveRight {
    0% {
        transform: translateX(-10px);
    }
    100% {
        transform: translateX(10px);
    }
}


/* 텍스트 서서히 나타나는 애니메이션 */
.fade-in-text {
    opacity: 0; /* 초기 상태 - 숨김 */
    animation: fadeInText 1.5s forwards ease-in-out; /* 2초 동안 서서히 나타남 */
}


@keyframes fadeInText {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
.power-button {
	position: relative;
	width: 20%;
	max-width: 150px;
	margin-bottom: 20px;
	cursor: pointer;
}

.power-button img {
	width: 100%;
	height: auto;
	object-fit: contain;
	transition: filter 0.3s;
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
	transition: color 0.3s;
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

/* homeBoxDetail 스타일 */
.homeBoxDetail-container {
	background-color: #f7f7f7;
	border-radius: 10px;
	margin: 20px auto;
	width: 80%;
	max-width: 900px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
}

.homeBoxDetail-header {
	background-color: #333;
	color: #fff;
	padding: 15px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	cursor: pointer;
	font-size: 1.2rem;
	font-weight: bold;
	border-radius: 10px;
}

.toggle-icon {
	font-size: 1rem;
}

.homeBoxDetail-content {
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.4s ease;
}

.homeBoxDetail-content.open {
	overflow: auto;
}

.homeBoxDetail {
	background-color: #ffffff;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
}

.homeBoxDetail img {
	width: 100%;
	border-radius: 8px;
	margin-bottom: 15px;
}

.homeBoxDetail span {
	display: block;
	margin-top: 10px;
	font-size: 1rem;
	line-height: 1.6;
	color: #333;
}

.homeBoxDetail .effect {
	font-weight: bold;
	color: #17a2b8;
	font-size: 1.2rem;
	margin-top: 15px;
	display: block;
}

.homeBoxDetail .effect-value {
	font-size: 1.5rem;
	font-weight: bold;
	color: #555;
}

.homeBoxDetail .rules-title {
	font-weight: bold;
	color: #333;
	margin-bottom: 10px;
	display: block;
}

.homeBoxDetail .rule-item {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.homeBoxDetail .rule-item img {
	width: 20px;
	height: 20px;
	margin-right: 10px;
	vertical-align: middle;
	margin-top: 20px;
}

.content-wrapper {
	display: flex;
	align-items: flex-start;
	justify-content: center;
	padding: 40px;
	gap: 30px;
	max-width: 1200px;
	margin: 0 auto;
}

.platePart {
	display: flex;
	align-items: center;
	justify-content: center;
}

.plate-button {
	position: relative;
	text-align: center;
}

#plateImage {
	width: 300px;
	height: auto;
	border-radius: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

#plateImage:hover {
	transform: scale(1.05);
}

.speech-bubble {
	position: absolute;
	top: 20px;
	left: -240px; /* 이미지 왼쪽에 말풍선 배치 */
	background-color: #32cd32;
	color: #fff;
	padding: 15px 20px; /* 패딩을 조금 늘려 텍스트가 상자 안에 들어가도록 함 */
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-size: 14px;
	line-height: 1.5;
	text-align: center;
	width: 200px; /* 상자의 너비를 살짝 늘림 */
	font-weight: bold;
	white-space: nowrap;
}

/* 화살표가 생기지 않도록 의사 요소 제거 */
.speech-bubble:before, .speech-bubble:after {
	content: none !important;
}

.text-content {
	flex: 1;
	max-width: 450px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.main-title {
	font-size: 28px;
	font-weight: 700;
	color: #333;
	line-height: 1.4;
	margin-bottom: 10px;
}

.tags {
	margin: 10px 0;
}

.tag {
	display: inline-block;
	background-color: #e0f7e0;
	color: #32cd32;
	padding: 5px 10px;
	border-radius: 15px;
	font-size: 14px;
	margin-right: 8px;
}

.sub-title {
	font-size: 16px;
	color: #666;
	line-height: 1.6;
	margin-top: 15px;
}
</style>

</head>
<body>
	<!-- 탑 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="title">
		<img
			src="${pageContext.request.contextPath}/resources/image/ecoConsumptionMain.jpg"
			alt="에너지 절약 이미지">
		<div class="title-content">
			<span>탄소중립</span>
			<h1 class="mb-5">친환경 소비편</h1>

			<div class="paired-text">
				<h2 class="text-warning">신중한</h2>
				<span class="bracket bracket-left">[</span>
				<h2 class="fade-in-text text-warning">소비</h2>
				<span class="bracket bracket-right">]</span>
			</div>

			<div class="paired-text">
				<h2 class="text-light-green">건강한</h2>
				<span class="bracket bracket-left">[</span>
				<h2 class="fade-in-text text-light-green">지구</h2>
				<span class="bracket bracket-right">]</span>
			</div>

		<h1 class="mt-5">탄소중립은 모두가 함께 만들어가는 변화입니다.</h1>
		<h1>온실가스를 줄이고 흡수를 늘려,</h1>
		<h1>지속 가능한 지구를 위해 노력합시다.</h1>
		</div>
	</div>

	<!-- 전원 버튼과 텍스트 부분 -->
	<div class="content-wrapper">
		<div class="platePart">
			<div class="plate-button">
				<img
					src="${pageContext.request.contextPath}/resources/image/plate1.png"
					alt="식기 버튼" id="plateImage" onclick="togglePlate()">
				<div class="speech-bubble">
					이미지를 클릭하여<br>친환경 소비를 실천해 주세요!
				</div>
			</div>
		</div>

		<div class="text-content">
			<div class="main-title">
				조금 고민되도<br> 지구를 위해 친환경 소비를<br> 실천했던 적이 있나요?
			</div>

			<div class="tags">
				<span class="tag">#생활 속</span> <span class="tag">#친환경 소비</span>
			</div>

			<div class="sub-title">
				생활 속에서 실천할 수 있는<br> 친환경 소비는 무엇이 있을까요? <br>
				<br> 음식물 쓰레기로 인한 온실가스 배출은 폐기물 처리 과정에서 주로 발생합니다. 필요한 만큼의 식재료를
				구입하고 음식을 남기지 않는 습관은 음식물 쓰레기를 줄이는 효과적인 방법입니다. 탄소중립을 위한 변화는 이러한 작은
				실천에서부터 시작됩니다.
			</div>
		</div>
	</div>


	<!-- 세 개의 박스 섹션 -->
	<div class="threeBoxSelect">
		<div class="box homeBox" onclick="showDetail('homeDetail')">
			<img
				src="${pageContext.request.contextPath}/resources/image/home.jpg"
				alt="가정에서"> <span>#가정에서</span>
		</div>
		<div class="box schoolBox" onclick="showDetail('schoolDetail')">
			<img
				src="${pageContext.request.contextPath}/resources/image/school.jpg"
				alt="학교에서"> <span>#학교에서</span>
		</div>
		<div class="box enterpriseBox"
			onclick="showDetail('enterpriseDetail')">
			<img
				src="${pageContext.request.contextPath}/resources/image/enterprise.jpg"
				alt="기업에서"> <span>#기업에서</span>
		</div>
	</div>

	<!-- 집에서detail -->
	<div class="homeBoxDetail-container" id="homeDetail"
		style="display: none;">
		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>녹색제품 구매하기</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail4.jpg"
					alt="조명기구"> <span>녹색제품은 에너지 자원의 투입과 온실가스 및 오염물질의 발생을
					최소화하는 제품이다.</span> <span class="effect">실천효과</span> <span
					class="effect-value">1인당 이산화탄소 감축량: 3kg</span> <span
					class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>녹색제품(환경표지 제품, 우수재활용 제품, 저탄소 제품) 구매하기</span>
					</div>

				</div>
			</div>
		</div>

		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>우리나라, 우리 지역 제철 식제료 이용하기</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail5.jpg"
					alt="세탁기"> <span>제철 지역 식재료는 생산지에서 우리 식탁으로 오르기까지 전과정에서
					배출되는 온실가스를 줄이고, 이를 활용한 요리를 통해 신선하고 영양까지 풍부한 식생활을 즐길 수 있다.</span> <span
					class="effect">실천효과</span> <span class="effect-value">1인당
					이산화탄소 감축량: 132kg</span> <span class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>국내산·제철 식재료 이용하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>지역 농산물(로컬푸드) 매장 이용하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>텃밭 또는 화분과 같은 용기를 이용해 채소를 직접 키워 먹기</span>
					</div>
				</div>
			</div>
		</div>

		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>다회용기에 내용물만 구매하기</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail6.jpg"
					alt="전기장판"> <span>빈 다회용기를 이용하여 화장품, 세제 등을 필요한 만큼 덜어서
					구매하면, 생활용품 형태의 플라스틱 폐기물 발생량을 줄일 수 있다.</span> <span class="effect">실천효과</span>
				<span class="effect-value">1인당 이산화탄소 감축량: 0.9kg</span> <span
					class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>빈 다회용기를 이용하여 화장품, 세제 등 구매하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>리필스테이션 이용하고 탄소중립포인트 적립받기</span>
					</div>

				</div>
			</div>
		</div>
	</div>




	<!-- 학교에서 detail -->
	<div class="homeBoxDetail-container" id="schoolDetail"
		style="display: none;">

		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>저탄소, 친환경 식단을 운영한다</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail4.jpg"
					alt="조명기구"> <span>농축수산물을 생산·유통·보관하는 과정에서 온실가스가 배출되기
					때문에 탄소 배출이 적은 제품을 선택하여 저탄소·친환경 급식 문화를 조성해야 한다.</span> <span class="effect">실천효과</span>

				<span class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>저탄소 농축산물, 친환경 수산물 인증마크를 확인하고 구매하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>우리나라, 우리 지역, 제철 식재료로 식단 구성하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>조리 시 열 사용을 줄일 수 있는 생채나 무침 위주의 식단
							구성하기</span>
					</div>
				</div>
			</div>
		</div>


		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>교내에서 텃밭 채소를 길러 본다.</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail5.jpg"
					alt="전자기기"> <span>텃밭 활동을 통해 식재료의 온실가스 줄이기, 올바른 식습관 형성,
					먹거리의 소중함 등을 배울 수 있다.</span> <span class="effect">실천효과</span> <span
					class="effect-value">우리 학교 이산화탄소 감축량: 1t</span> <span
					class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>학교 내 유휴 부지인 화단이나 자투리 공간을 활용하여 텃밭
							조성하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>텃밭 수업을 먹거리 및 식습관에 대한 교육과 연계하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>텃밭에서 재배한 농산물을 급식 식재료로 사용하기</span>
					</div>
				</div>
			</div>
		</div>

		<!-- 절수 설비와 기기를 설치한다 -->
		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>국산목재로 만든 제품을 구매한다.</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail5.png"
					alt="절수 설비"> <span>목재는 가공이 쉽고 생산 과정에서 에너지를 적게 소모하는 친환경
					소재이며, 특히 국산목재는 수입목재와 비교하여 운송 과정에서 발생하는 탄소 배출량이 낮다.</span> <span
					class="effect">실천효과</span> <span class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>국산목재로 만들어진 제품(가구, 생활제품, 소품 등) 구매하기</span>
					</div>

				</div>
			</div>
		</div>
	</div>




	<!-- 기업에서 detail -->
	<div class="homeBoxDetail-container" id="enterpriseDetail"
		style="display: none;">
		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>저탄소·친환경 식단 이용하기</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail4.jpg"
					alt="승강기"> <span>농축수산물을 생산·유통·보관하는 과정에서 온실가스가 배출되기 때문에
					탄소 배출이 적은 제품을 선택하여 저탄소·친환경 식단을 운영해야 한다.</span> <span class="effect">실천효과</span>
				<span class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>저탄소 농축산물, 친환경 수산물 인증마크를 확인하고 구매하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>우리나라, 우리 지역, 제철 식재료로 식단 구성하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>조리 시 열 사용을 줄일 수 있는 생채나 무침 위주의 식단
							구성하기</span>
					</div>
				</div>
			</div>
		</div>

		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>탄소 발자국을 고려한 소비 촉진하기</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail5.jpg">
				<span>‘탄소발자국’이란 제품이나 서비스의 생산부터 폐기까지 전과정에 걸쳐 발생한 온실가스 배출량을
					이산화탄소 배출량으로 환산하여 표시한 것이다.</span> <span class="effect">실천효과</span> <span
					class="effect-value">우리 기업 이산화탄소 감축량: 0.4t</span> <span
					class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>소비자 및 임직원 대상으로 탄소발자국을 고려한 소비 교육·홍보하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>품질이 보증되고 오래 사용 가능한 제품 구매하기</span>
					</div>
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>재활용하기 쉬운 재질·구조로 된 제품 구매하기</span>
					</div>
				</div>
			</div>
		</div>

		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>자원순환성을 고려한 제품 전략 수립하기</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail6.jpg"
					alt="고효율 전자기기"> <span>제품의 기획 단계에서부터 ‘환경’에 대한 책임을 고려해야
					하며, 생산부터 폐기까지 제품 전체의 자원순환성을 강화하기 위해 노력해야 한다.</span> <span class="effect">실천효과</span>
				<span class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>환경성적표지, 저탄소 인증제품 개발하기</span>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="homeBoxDetail-container" id="enterpriseDetail"
		style="display: none;">
		<div class="homeBoxDetail-header" onclick="toggleDetail(this)">
			<span>국산목재로 만든 제품구입하기</span> <span class="toggle-icon">▲</span>
		</div>
		<div class="homeBoxDetail-content">
			<div class="homeBoxDetail">
				<img
					src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail4.png">
				<span>목재는 가공이 쉽고 생산 과정에서 에너지를 적게 소모하는 친환경 소재이며, 특히 국산목재는
					수입목재와 비교하여 운송 과정에서 발생하는 탄소 배출량이 낮다. </span> <span class="effect">실천효과</span>
				<span class="rules-title">실천수칙</span>
				<div class="rules">
					<div class="rule-item">
						<img
							src="${pageContext.request.contextPath}/resources/image/check_box.png"
							alt="체크"> <span>에국산목재로 만들어진 제품(가구, 생활제품, 소품 등) 구매하기</span>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- footer 인클루드 파일 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        function showDetail(id) {
            document.querySelectorAll('.homeBoxDetail-container').forEach(container => {
                container.style.display = 'none';
            });
            document.getElementById(id).style.display = 'block';
        }

       

        function toggleDetail(element) {
            const content = element.nextElementSibling;
            const icon = element.querySelector(".toggle-icon");

            if (content.style.maxHeight) {
                content.style.maxHeight = null;
                icon.textContent = "▲";
                content.classList.remove('open');
            } else {
                content.style.maxHeight = content.scrollHeight + "px";
                icon.textContent = "▼";
                content.classList.add('open');
            }
        }
        function togglePlate() {
            const plateImage = document.getElementById("plateImage");
            const plate1Path = "${pageContext.request.contextPath}/resources/image/plate1.png";
            const plate2Path = "${pageContext.request.contextPath}/resources/image/plate2.png";

            if (plateImage.src.includes("plate1.png")) {
                plateImage.src = plate2Path;
            } else {
                plateImage.src = plate1Path;
            }
        }
    </script>
</body>
</html>
