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
    min-height: 750px;
    object-fit: cover;
    object-position: bottom;
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
    gap: 30px; 
    padding: 40px;
    max-width: 1200px;
    margin: 0 auto;
}



.platePart {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
}

.speech-bubble {
    position: static; 
    margin-left: 10px;
    background-color: #32cd32;
    color: #fff;
    padding: 10px 15px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    width: 280px;
}

.text-content {
    text-align: center;
    max-width: 500px;
    margin: 0 auto;
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



.speech-bubble:before, .speech-bubble:after {
    content: none !important;
}

.text-content {
    text-align: left;
    max-width: 500px;
    margin-left: 20px; 
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
         src="${pageContext.request.contextPath}/resources/image/ecoSinksMain.jpg">
      <div class="title-content">
         <span>탄소중립</span>
         <h1 class="mb-5">흡수원편</h1>

         <div class="paired-text">
            <span class="bracket bracket-left">[</span>
            <h2 class="fade-in-text text-info">숲을</h2>
            <span class="bracket bracket-right">]</span>
            <h2 class="text-info">아끼고</h2>

         </div>

         <div class="paired-text">
            <span class="bracket bracket-left">[</span>
            <h2 class="fade-in-text text-light-green">나무는</h2>
            <span class="bracket bracket-right">]</span>
            <h2 class="text-light-green">심고</h2>

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
            <video id="plateVideo" width="300" height="300" onclick="togglePlate()" style="border-radius: 10%; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); object-fit: cover;">
                <source type="video/mp4" src="https://firebasestorage.googleapis.com/v0/b/study-6b60a.appspot.com/o/eco-sinks.mp4?alt=media&token=c319c8fd-9ff6-4334-96b9-ba9f45dbdb8a">
            </video>
            <div class="speech-bubble">
                이미지를 클릭하여<br>흡수원 보호를 실천해 주세요!
            </div>
        </div>
    </div>

    <div class="text-content">
        <div class="main-title">
            조금 어려워도<br>
            지구를 위해<br>
            나무를 심은 적이 있나요?
        </div>

        <div class="tags">
            <span class="tag">#생활 속</span>
            <span class="tag">#흡수원 보호</span>
        </div>

        <div class="sub-title">
            생활 속에서 실천할 수 있는<br>
            흡수원 보호 방법은 무엇이 있을까요?
            <br><br>
산림은 이산화탄소를 흡수하고 산소를 내뿜어 대기질 개선에 도움을 줍니다.
하지만 최근 10년간 산림면적이 지속적으로 줄어들고 있는데요.
나무를 심거나 식물을 키우는 것만으로도 열섬 현상은 물론 대기오염까지 줄일 수 있습니다.
탄소중립의 사회 전환은 우리의 작은 생활습관의 변화로부터 시작합니다.        </div>
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
        <span>탄소흡수원의 중요성 알고 보호하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail13.jpg" alt="조명기구">
            <span>탄소흡수원은 산림지, 농경지, 초지, 습지, 정주지 및 바다숲 등에서 자연적이거나 인위적으로 탄소를 저장 및 흡수하는 입목, 고사유기물, 토양, 목제품 및 산림바이오매스 에너지 등을 지칭하며, 대기 중 온실가스를 줄이고 지구온난화를 억제하는 데 기여하고 있다.</span>
            <span class="rules-title">탄소흡수원 관련 기념일</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">습지의날(2월 2일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">식목일(4월 5일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">바다식목일 (5월 10일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">산의 날 (10월 18일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">토양의 날 (12월 5일)</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>나무심기 운동 참여하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/home_box_detail14.jpg" alt="세탁기">
            <span>최근 10년간 산림면적은 지속적으로 줄어들고 있어 생활 속에서 적극적인 나무심기를 실천할 필요가 있다.</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>정부, 지자체, 기업, 단체 등이 주최하는 식목행사에 관심을 가지고 참여하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>출생, 결혼, 승진, 창업 등 기념일에 나무를 심어 의미있는 기념일 만들기</span>
                </div>
            </div>
        </div>
    </div>



</div>




   <!-- 학교에서 detail -->
<div class="homeBoxDetail-container" id="schoolDetail" style="display: none;">

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>탄소흡수원의 중요성을 알고 보호한다</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail13.jpg">
            <span>탄소흡수원은 산림지, 농경지, 초지, 습지, 정주지 및 바다숲 등에서 자연적이거나 인위적으로 탄소를 저장 및 흡수하는 입목, 고사유기물, 토양, 목제품 및 산림바이오매스 에너지 등을 지칭하며, 대기 중 온실가스를 줄이고 지구온난화를 억제하는 데 기여하고 있다.</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>산불 예방, 삼림 훼손 방지로 산림 보호하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>탄소흡수원과 관련된 행사 동참하기</span>
                </div>
            </div>
        </div>
    </div>


    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>나무심기 운동에 참여한다.</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/school_box_detail14.jpg">
            <span>최근 10년간 산림면적은 지속적으로 줄어들고 있어 생활 속에서 적극적인 나무심기를 실천할 필요가 있다.</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">습지의날(2월 2일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">식목일(4월 5일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">바다식목일 (5월 10일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">산의 날 (10월 18일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">토양의 날 (12월 5일)</span>
                </div>
            </div>
        </div>
    </div>
</div>




   <!-- 기업에서 detail -->
<div class="homeBoxDetail-container" id="enterpriseDetail" style="display: none;">
    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>탄소흡수원의 중요성 알고 보호하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail13.jpg">
            <span>탄소흡수원은 산림지, 농경지, 초지, 습지, 정주지 및 바다숲 등에서 자연적이거나 인위적으로 탄소를 저장 및 흡수하는 입목, 고사유기물, 토양, 목제품 및 산림바이오매스 에너지 등을 지칭하며, 대기 중 온실가스를 줄이고 지구온난화를 억제하는 데 기여하고 있다.</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">습지의날(2월 2일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">식목일(4월 5일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">바다식목일 (5월 10일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">산의 날 (10월 18일)</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span style="color:gray;">토양의 날 (12월 5일)</span>
                </div>
            </div>
        </div>
    </div>

    <div class="homeBoxDetail-header" onclick="toggleDetail(this)">
        <span>ESG와 연계하여 탄소중립 숲 조성하기</span> <span class="toggle-icon">▲</span>
    </div>
    <div class="homeBoxDetail-content">
        <div class="homeBoxDetail">
            <img src="${pageContext.request.contextPath}/resources/image/practiceDetail/enterprise_box_detail14.jpg" >
            <span>산림은 ESG 중 환경(E)·사회(S) 부문에 기여할 수 있는 대표적인 수단으로서 최근 기업의 산림 분야 참여가 활발해지고 있다.</span>
            <span class="rules-title">실천수칙</span>
            <div class="rules">
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>기업, 민간 단체, 지자체 등 다양한 기관이 함께 협력하여 탄소중립 숲 조성하기</span>
                </div>
                <div class="rule-item">
                    <img src="${pageContext.request.contextPath}/resources/image/check_box.png" alt="체크">
                    <span>산불피해지 복원, 생물다양성 등 산림 분야 활동에 참여하기</span>
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
            const video = document.getElementById("plateVideo");

            
            if (video.paused || video.ended) {
                video.play();
            } else {
                video.pause();
            }

            
            video.onended = function() {
                video.pause();
                video.currentTime = 0; 
            };
        }
    </script>
</body>
</html>
