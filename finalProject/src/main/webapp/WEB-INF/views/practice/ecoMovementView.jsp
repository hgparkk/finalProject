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
    opacity: 0;
    animation: fadeInText 1s forwards ease-in-out 1.5s;
    display: inline;
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
.home-go {
	border: 1px solid #CCCCCC;
	border-radius: 0.4vw;
	padding: 0.3vw;
	padding-left: 0.5vw;
	padding-right: 0.5vw;
	text-decoration: none;
	color: black;
	font-size: 1vw
}
</style>

</head>
<body>
   <!-- 탑 인클루드 파일 -->
   <%@ include file="/WEB-INF/inc/top.jsp"%>

		<div class="w-50 d-flex align-items-center justify-content-end mb-5" style="margin-left:600px;">
			<a class="home-go" href="${pageContext.request.contextPath }/lowCarbonPracticeView">
				<span>이전으로</span>
			</a>
		</div>
   <div class="title">
      <img
         src="${pageContext.request.contextPath}/resources/image/ecoMovementMain.jpg"
         alt="에너지 절약 이미지">
      <div class="title-content">
         <span>탄소중립</span>
         <h1 class="mb-5">친환경 이동편</h1>

         <div class="paired-text">
            <h2 class="text-info">지구도</h2>
            <span class="bracket bracket-left">[</span>
            <h2 class="fade-in-text text-info">건강하게</h2>
            <span class="bracket bracket-right">]</span>
         </div>

         <div class="paired-text">
            <h2 class="text-light-green">나도</h2>
            <span class="bracket bracket-left">[</span>
            <h2 class="fade-in-text text-light-green">건강하게</h2>
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
                src="${pageContext.request.contextPath}/resources/image/ecoMovement1.png"
                id="plateImage" onclick="togglePlate()">
            <div class="speech-bubble">
                이미지를 클릭하여<br>친환경 이동을 실천해 주세요!
            </div>
        </div>
    </div>

    <div class="text-content">
        <div class="main-title">
            조금 힘들어도<br>
            지구를 위해 친환경 이동을<br>
            실천했던 적이 있나요?
        </div>

        <div class="tags">
            <span class="tag">#생활 속</span>
            <span class="tag">#친환경 이동</span>
        </div>

        <div class="sub-title">
            생활 속에서 실천할 수 있는<br>
            친환경 이동은 무엇이 있을까요?
            <br><br>
            우리나라의 수송 분야 온실가스 배출량 중 도로부문이 96.5%를 차지합니다.
			2km 이내의 가까운 거리는 걷거나 자전거를 이용하면 온실가스 저감이 가능합니다.
			탄소중립의 사회 전환은 우리의 작은 생활습관의 변화로부터 시작합니다.
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
<div class="homeBoxDetail-container" id="homeDetail" style="display: none;">
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>개인용 자동차 대신 대중교통 이용하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail7.jpg" alt="조명기구">
            <span>우리나라 등록 자동차 중 약 82.4%가 개인용 자동차인 만큼, 이를 줄이기 위해 생활 속에서 대중교통 타기를 습관화하는 노력이 필요하다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1대당 이산화탄소 감축량: 242kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>버스(시내·마을버스, 시외·고속버스 등), 지하철, 기차 등 대중교통 적극 이용하기</span>
                </div>
                
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>가까운 거리는 걷거나 자전거 이용하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail8.jpg" alt="세탁기">
            <span>우리나라의 수송 분야 온실가스 배출량 중 도로 부문이 차지하는 비중이 높은 만큼, 가까운 거리는 걷거나 자전거를 이용하는 노력이 필요하다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1인당 이산화탄소 감축량: 147kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>가까운 거리는 걷거나 자전거 이용하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>자동차 공유 서비스 이용시 무공해차 이용하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail9.jpg" alt="전기장판">
            <span>대부분의 전기 자동차는 내연기관 자동차의 평균 연비(16km/L) 보다 3배 가량 연비가 높다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">이용자당 이산화탄소 감축량: 10kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>자동차 공유 서비스 이용 시 무공해차(전기·수소 자동차) 대여하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>무공해차 이용하고, 탄소중립포인트 적립받기</span>
                </div>
                
            </div>
        </div>
    </div>
</div>




   <!-- 학교에서 detail -->
<div class="homeBoxDetail-container" id="schoolDetail" style="display: none;">

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>등하교 시 도보 및 대중교통 이용한다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail7.jpg">
            <span>우리나라의 수송 분야 온실가스 배출량 중 도로 부문이 차지하는 비중이 높은 만큼, 가까운 거리는 대중교통이나 자전거를 이용하는 노력이 필요하다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리학교 이산화탄소 감축량: 19t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>등하교 및 출퇴근 시 대중교통(버스, 지하철 등), 도보 등을 이용하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>교직원 대상 자동차 요일제 시행하기</span>
                </div>
            </div>
        </div>
    </div>


    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>교직원 출퇴근 시 친환경 운전을 한다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail8.jpg">
            <span>친환경 운전은 경제성, 안정성, 편리성은 높이고 에너지는 절약하는 운전 습관으로 ‘에코 드라이브(경제운전)’라고도 하며, 자동차를 운행하는 방법, 습관 또는 행태 등을 개선하는 것만으로도 연료 소비와 온실가스 배출을 줄일 수 있다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 학교 이산화탄소 감축량: 6t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>급제동·급출발하지 않기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>공회전 최소화하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>바퀴 공기압 확인하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>에어컨 사용 줄이기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>교직원 대상 교육하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>스쿨버스는 무공해차로 교체하고 학교에 전기충전기 설치하기.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail9.jpg">
            <span>전기 자동차는 배터리와 모터만으로, 수소 자동차는 수소로 발생된 전기 에너지로 구동되므로 무공해차인 전기·수소 자동차를 타면 미세먼지와 온실가스 배출을 줄일 수 있다.</span>
			
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>출퇴근 및 출장 시 대중교통, 자전거 이용 장려하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>출퇴근 시간 조정, 자전거 거치대 또는 주차장·샤워 시설 제공 등 활성화 방안 마련하기</span>
                </div>
               
            </div>
        </div>
    </div>
</div>




   <!-- 기업에서 detail -->
<div class="homeBoxDetail-container" id="enterpriseDetail" style="display: none;">
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>임직원 대상 대중교통, 자전거 이용 활성화하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail7.jpg" alt="승강기">
            <span>우리나라의 수송 분야 온실가스 배출량 중 도로 부문이 차지하는 비중이 높은 만큼, 가까운 거리는 대중교통이나 자전거를 이용하는 노력이 필요하다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 4t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>출퇴근 및 출장 시 대중교통, 자전거 이용 장려하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>출퇴근 시간 조정, 자전거 거치대 또는 주차장·샤워 시설 제공 등 활성화 방안 마련하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>임직원 대상 자동차 요일제 시행하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>공용차량을 무공해차로 교체하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail8.jpg">
            <span>전기 자동차는 배터리와 모터만으로, 수소 자동차는 수소로 발생된 전기 에너지로 구동되므로 무공해차인 전기·수소 자동차를 타면 미세먼지와 온실가스 배출을 줄일 수 있다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 2t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>공용 차량은 전기·수소 자동차 구매하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>필요 시 전기·수소 자동차 대여하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>기업 주차장이 있는 경우, 전기 충전기를 설치하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>출퇴근 시 친환경 운전 실천하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail9.jpg" alt="고효율 전자기기">
            <span>친환경 운전은 경제성, 안정성, 편리성은 높이고 에너지는 절약하는 운전 습관으로 ‘에코 드라이브(경제운전)’라고도 하며, 자동차를 운행하는 방법, 습관 또는 행태 등을 개선하는 것만으로도 연료 소비와 온실가스 배출을 줄일 수 있다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 5t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>임직원 대상 교육하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>에어컨 사용 줄이기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>바퀴 공기압 확인하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>적재물 줄이기</span>
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
            const plate1Path = "${pageContext.request.contextPath}/resources/image/ecoMovement1.png";
            const plate2Path = "${pageContext.request.contextPath}/resources/image/ecoMovement2.png";

            if (plateImage.src.includes("ecoMovement1.png")) {
                plateImage.src = plate2Path;
            } else {
                plateImage.src = plate1Path;
            }
        }
    </script>
</body>
</html>
