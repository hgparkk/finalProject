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
    transition: background-color 0.3s, color 0.3s;
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

/* 다크 모드 스타일 */
.dark-mode {
    background-color: #333 !important;
    color: #ffffff !important;
}

.dark-mode .sub-title, .dark-mode .tag {
    color: #ffffff !important;
    background-color: #555 !important;
}

.dark-mode .speech-bubble {
    background-color: #555 !important;
}

.dark-mode .speech-bubble::after {
    border-right-color: #555 !important;
}

.dark-mode .power-button img {
    filter: brightness(0) invert(1) !important;
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
    margin-top: 20px;
}

.homeBoxDetail .rule-item img {
    width: 20px;
    height: 20px;
    margin-right: 10px;
    vertical-align: middle;
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

		<h1 class="mt-5">탄소중립은 모두가 함께 만들어가는 변화입니다.</h1>
		<h1>온실가스를 줄이고 흡수를 늘려,</h1>
		<h1>지속 가능한 지구를 위해 노력합시다.</h1>
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

      <div class="main-title">조금의 불편함이 더 나은 미래를 만듭니다.<br> 에너지 절약, 여러분도 실천하고 계신가요?
</div>

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
    <!-- 불필요한 조명기구 소등하기 -->
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>불필요한 조명기구 소등하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail1.jpg" alt="조명기구">
            <span>조명기구 한 개의 전기 사용량은 작지만 여러 개의 조명기구를 장시간 사용하기 때문에 전체 전기 사용량에서 조명이 차지하는 비중은 높은 편이다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1가구당 이산화탄소 감축량: 251kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>사용하지 않는 조명기구 소등하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>소등행사(4월 22일 지구의 날 등) 참여하기</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 세탁기 사용 횟수 줄이기 -->
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>세탁기 사용 횟수 줄이기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail2.jpg" alt="세탁기">
            <span>세탁기의 전기 사용량을 줄이려면, 세탁물의 양보다는 사용 횟수를 줄이는 것이 효과적이다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1가구당 이산화탄소 감축량: 9kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>빨래는 최대한 모아 세탁 횟수 줄이기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>전기 사용량이 큰 온수 대신 냉수로 세탁하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>건조기는 ‘강하게 모드’로 설정해 사용 시간 줄이기</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 전기장판 사용 줄이기 -->
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>전기장판 사용 줄이기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail4.png" alt="전기장판">
            <span>전기장판 사용 시간을 줄이고 체온과 비슷한 온도로 설정해 사용하면, 전기 사용량과 함께 장시간 사용 시 발생할 수 있는 화상의 위험도 줄일 수 있다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1가구당 이산화탄소 감축량: 315kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>전기장판 사용 시간 줄이고, 필요한 시간만큼 타이머 설정해 사용하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>보온성 유지를 위해 전기장판 위에 얇은 이불 덮어두기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>전기장판을 사용하지 않을 때는 전원 차단하기</span>
                </div>
            </div>
        </div>
    </div>
</div>




   <!-- 학교에서 detail -->
<div class="homeBoxDetail-container" id="schoolDetail" style="display: none;">
    <!-- 빈 교실의 조명은 소등한다 -->
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>빈 교실의 조명은 소등한다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail1.jpg" alt="조명기구">
            <span>조명기구 한 개의 전기 사용량은 작지만 여러 개의 조명기구를 장시간 사용하기 때문에 전체 전기 사용량에서 조명이 차지하는 비중은 높은 편이다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 학교 이산화탄소 감축량: 0.7t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>빈 교실의 조명기구 소등하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>학급별로 에너지 지킴이 임명하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>학교 외벽 조명기구의 점등·소등 관리 철저히 하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>전자기기 대기전력을 차단한다</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail2.jpg" alt="전자기기">
            <span>대기전력은 기기의 동작과 관계없이 전원을 끈 상태에서도 소비되는 전력으로 불필요하게 낭비되는 전기를 말한다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 학교 이산화탄소 감축량: 1t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>대기전력이 높거나, 일시적으로만 사용하는 전자기기 확인하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>전자기기(에어컨 등)를 사용하지 않을 때는 콘센트 뽑기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>전자기기의 특성과 학사일정을 고려해 대기전력 차단장치 설치·관리하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>절수 설비와 기기를 설치한다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail3.jpg" alt="절수 설비">
            <span>물을 적게 사용하도록 구조·규격 등의 기준에 맞게 제작된 절수 설비와 기존 설비에 부속품을 교체하거나 추가로 장착해 사용하는 절수 기기가 있다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 학교 이산화탄소 감축량: 5t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>세면대, 변기 등의 교체 시 절수 설비(수도꼭지 등) 설치하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>수도꼭지, 양변기에 절수 기기 장착하기</span>
                </div>
            </div>
        </div>
    </div>
</div>




   <!-- 기업에서 detail -->
<div class="homeBoxDetail-container" id="enterpriseDetail" style="display: none;">
    <!-- 승강기 격층 운행하고, 계단 이용하기 -->
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>승강기 격층 운행하고, 계단 이용하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail1.jpg" alt="승강기">
            <span>건물 승강기의 평균 운행 횟수는 1대/일 1,200회 정도이며, 연간 약 41t의 탄소를 배출한다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 1t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>승강기 격층 운행하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>승강기 대신 계단 이용하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>전자기기 대기전력 차단하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail2.jpg" alt="전자기기">
            <span>대기전력은 기기의 동작과 관계없이 전원을 끈 상태에서도 소비되는 전력으로 불필요하게 낭비되는 전기를 말한다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 0.4t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>대기전력이 높거나, 일시적으로만 사용하는 전자기기 확인하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>전자기기 특성과 사용 정도를 고려해 대기전력 차단장치 설치·관리하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>점심시간 및 퇴근 시 직원들이 대기전력 차단하는 사내 문화 조성하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>고효율 전자기기 사용하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail3.jpg" alt="고효율 전자기기">
            <span>에너지 효율등급이 1등급에 가까운 전자기기일수록 등급이 낮은 제품보다 구매 비용이 높지만, 장기적으로 전기요금을 절약하고 탄소 배출을 줄일 수 있다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 23t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>에너지 관련 제도별 로고를 확인하고, 고효율 전자기기 구매하기 (자세한 내용은 한국에너지공단 효율관리제도 누리집에서 확인)</span>
                </div>
            </div>
        </div>
    </div>
</div>


   <div class="homeBoxDetail-container" id="enterpriseDetail"
      style="display: none;">
      <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
         <span>고효율 전자기기 사용하기</span> <span class="toggle-icon">▲</span>
      </div>
      <div class="homeBoxDetail-content">
         <div class="homeBoxDetail">
            <img
               src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail4.png"
               > <span>에너지 효율등급이 1등급에 가까운 전자기기일수록 등급이 낮은
               제품보다 구매 비용이 높지만, 장기적으로 전기요금을 절약하고 탄소 배출을 줄일 수 있다. </span> <span
               class="effect">실천효과</span> <span class="effect-value">우리 기업
               이산화탄소 감축량: 23t</span> <span class="rules-title">실천수칙</span>
            <div class="rules">
               <div class="rule-item">
                  <img
                     src="${pageContext.request.contextPath}/resources/image/check_box.png"
                     alt="체크"> <span>에너지 관련 제도별 로고를 확인하고, 고효율 전자기기
                     구매하기(자세한 내용은 한국에너지공단 효율관리제도 누리집(https://eep.energy.or.kr)에서 확인)</span>
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

        function toggleDarkMode() {
            const darkModePart = document.getElementById("darkModePart");
            const powerButtonImage = document.getElementById("powerButtonImage");
            darkModePart.classList.toggle("dark-mode");

            if (darkModePart.classList.contains("dark-mode")) {
                powerButtonImage.style.filter = "brightness(0) invert(1)";
            } else {
                powerButtonImage.style.filter = "none";
            }
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
    </script>
</body>
</html>
