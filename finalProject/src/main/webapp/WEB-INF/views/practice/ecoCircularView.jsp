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
    border-radius: 30%;
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
         src="${pageContext.request.contextPath}/resources/image/ecoCircularMain.jpg">
      <div class="title-content">
         <span>탄소중립</span>
         <h1 class="mb-5">자원순환편</h1>

         <div class="paired-text">
            <span class="bracket bracket-left">[</span>
            <h2 class="fade-in-text text-info">쏙쏙</h2>
            <span class="bracket bracket-right">]</span>
            <h2 class="text-info">비우고</h2>

         </div>

         <div class="paired-text">
            <span class="bracket bracket-left">[</span>
            <h2 class="fade-in-text text-light-green">꼭꼭</h2>
            <span class="bracket bracket-right">]</span>
            <h2 class="text-light-green">분리하자</h2>

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
                src="${pageContext.request.contextPath}/resources/image/bad_trash.png"
                id="plateImage" onclick="togglePlate()">
            <div class="speech-bubble">
                이미지를 클릭하여<br>자원순환을 실천해 주세요!
            </div>
        </div>
    </div>

    <div class="text-content">
        <div class="main-title">
            조금 번거롭지만,<br>
            환경을 위해 올바른 분리배출을<br>
            실천하고 있나요?
        </div>

        <div class="tags">
            <span class="tag">#생활 속</span>
            <span class="tag">#자원 순환</span>
        </div>

        <div class="sub-title">
            생활 속에서 실천할 수 있는<br>
            자원순환 실천은 무엇이 있을까요?
            <br><br>
가정에서 잘못 분리배출된 재활용 폐기물은 수거 후에도 선별 과정에서 폐기물로 처리되어 소각되거나 매립됩니다. 올바른 분리배출은 배출 단계에서부터 시작되며, 탄소중립을 위한 사회적 변화는 우리의 작은 실천에서 비롯됩니다.        </div>
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
        <span>비닐사용 줄이기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail10.jpg" alt="조명기구">
            <span>비닐의 경우 자연 분해에 오랜 기간이 소요되며, 소각하거나 땅속에 매립돼 썩는 과정에서 각종 유해 물질도 발생한다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1인당 이산화탄소 감축량: 25kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>편의점, 전통시장 등으로 물건 구매하러 갈 때 장바구니 들고 가기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>낱개 또는 겉에 물기가 없는 과일·채소 구매 시 속비닐 사용하지 않기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>1회용 비닐 랩 대신 다회용 랩(실리콘 랩 등) 사용하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>상자 포장 시 비닐 테이프, 에어캡 대신 종이 테이프·완충재 사용하기</span>
                </div>
                
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>음식물 쓰레기 줄이기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail11.jpg" alt="세탁기">
            <span>우리나라의 연간 음식물 쓰레기 발생량은 13,694t/일(2022년 기준)이며, 음식물 쓰레기는 분해 과정에서 메탄, 이산화탄소 등의 온실가스가 배출된다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1인당 이산화탄소 감축량: 0.5kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>식단계획과 유통기한을 고려해 최소한의 식재료만 구입하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>식재료는 소분하여 투명 용기에 보관하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>음식은 인원에 맞춰 주문하고, 먹지 않을 반찬은 사전에 반납하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>길거나 부피가 큰 음식물 쓰레기는 잘게 썰어 배출하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>1회용 컵대신 다회용 컵 사용하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail12.jpg" alt="전기장판">
            <span>우리나라는 커피 문화 확산 등 생활상이 변화함에 따라 1회용 컵 사용량이 해마다 증가하는 추세다</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">1인당 이산화탄소 감축량: 87kg</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>실내에서는 개인 컵을 사용하고, 외출할 때는 텀블러 사용하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>커피전문점 등에서 텀블러로 음료 구매하고, 탄소중립포인트 적립받기</span>
                </div>
                
            </div>
        </div>
    </div>
</div>




   <!-- 학교에서 detail -->
<div class="homeBoxDetail-container" id="schoolDetail" style="display: none;">

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>음식은 먹을 만큼만 담는다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail10.jpg">
            <span>우리나라의 연간 음식물 쓰레기 발생량은 13,694t/일(2022년 기준)이며, 음식물 쓰레기는 분해 과정에서 메탄, 이산화탄소 등의 온실가스가 배출된다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 학교 이산화탄소 감축량: 0.2t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>식단계획과 유통기한을 고려해 최소한의 식재료만 구입하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>먹지 않을 반찬은 사전에 반납하기</span>
                </div>
            </div>
        </div>
    </div>


    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>다회용 컵을 사용한다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail11.png">
            <span>1회용 컵의 사용량이 증가함에 따라 자원이 낭비되고, 이는 온실가스 배출량을 증가시킨다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 학교 이산화탄소 감축량: 27t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>학교에서 물 마실 때는 개인 컵 사용하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>야외 행사, 체험학습 시 1회용 컵 대신 텀블러 사용하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>종이타월, 핸드드라이어 대신 개인 손수건을 사용한다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail12.jpg">
            <span>종이 타월은 생산 과정에서 상당량의 나무를 베어야 하며, 표백 처리 과정에서 나온 폐수는 환경을 오염시키는 주범이다.</span>
			<span class="effect">실천효과</span>
            <span class="effect-value">우리 학교 이산화탄소 감축량: 17t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>책상 및 사물함 등에 개인 손수건을 비치해 두고 사용하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>젖은 손수건을 말릴 수 있도록 책상 등에 걸고리 설치하기</span>
                </div>
               
            </div>
        </div>
    </div>
</div>




   <!-- 기업에서 detail -->
<div class="homeBoxDetail-container" id="enterpriseDetail" style="display: none;">
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>1회용품 줄이기 지침 운영하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail10.jpg" alt="승강기">
            <span>경제발전과 생활 편의성 추구로 인해 지속적으로 1회용품 사용량이 증가하고 있으며, 1회용품 제작 과정에서 자원 낭비, 폐기물 처리를 위한 과정에서 온실가스가 배출된다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 2t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>사내 1회용품 줄이기 지침 운영하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>회의·행사 운영 시 1회용품 사용 자제하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>다회용 컵·우산 빗물 제거기 등 이용 장려하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>인쇄 시 종이 사용 줄이기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail11.jpg">
            <span>일반 종이 1t 생산 시 나무가 24그루가 필요하며, 우리나라 한 해 종이 소비량은 990만t이다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 0.5t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>사무실에 이면지 정리함을 마련하고, 이면지 사용하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>인쇄 시 양면인쇄, 모아찍기, 흑백인쇄 등의 기능 설정하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>문서를 출력하면 잉크가 번져 글꼴의 구멍이 채워지는 에코폰트 사용하기</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>종이 없는 회의 활성화하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail12.jpg" alt="고효율 전자기기">
            <span>종이 없는 회의는 종이 절약, 문서 출력 시간 감소, 자료 보안·관리 유용 등의 효과가 있다.</span>
            <span class="effect">실천효과</span>
            <span class="effect-value">우리 기업 이산화탄소 감축량: 5t</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>회의자료를 전자문서로 배포하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>공용 전자기기(태블릿 등)를 비치하고, 관리하기</span>
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
            const plate1Path = "${pageContext.request.contextPath}/resources/image/bad_trash.png";
            const plate2Path = "${pageContext.request.contextPath}/resources/image/good_trash.png";

            if (plateImage.src.includes("bad_trash.png")) {
                plateImage.src = plate2Path;
            } else {
                plateImage.src = plate1Path;
            }
        }
    </script>
</body>
</html>
