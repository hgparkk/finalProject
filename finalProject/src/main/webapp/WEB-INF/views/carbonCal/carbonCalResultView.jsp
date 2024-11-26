<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>

<style type="text/css">
.graph-container {
	width: 100%;
	min-width: 500px;
}

.title-box {
	display: flex;
	padding-left: 2vw;
	padding-right: 2vw;
}

.carbonCal-title {
	width: 100%;
	height: 7.5vw;
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

.home-go>img {
	width: 1vw;
	height: 1vw;
}

.usage-result-box {
	max-width: 1340px;
	display: flex;
	margin: auto;
	justify-content: center;
	flex-wrap: wrap;
}

.select-date-box {
	width: 100%;
	height: 2vw;
}

.graph-box {
	width: 100%;
	padding: 5vw;
}

.circle-graph-box {
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.circle-graph {
	width: 30%;
}

.circle-graph-explain-box {
	width: 50%;
}

.bar-graph-box {
	width: 100%;
	display: flex;
	justify-content: space-between;
	margin-top: 2.5vw;
}

.allType-graph-box {
	width: 18%;
	height: 20vw;
	padding: 0.5vw;
	border: 1px solid #CCCCCC;
	border-radius: 0.5vw;
}

.bar-graph-title {
	display: flex;
	height: 10%;
}

.img-box>img {
	width: 1vw;
	height: 1vw;
}

.bar-graph {
	height: 90%;
}

#elecGraph {
	width: 100%;
	height: 100%;
}
</style>

<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div style="display: none;">
		<c:forEach items="${keyGetCoefficientValue}" var="getCoefficient">
			<c:if test="${getCoefficient.coefficientName == '전기 CO2 발생량'}">
				<div id="electricCoefficient">${getCoefficient.coefficientValue}</div>
			</c:if>
			<c:if test="${getCoefficient.coefficientName == '가스 CO2 발생량'}">
				<div id="gasCoefficient">${getCoefficient.coefficientValue}</div>
			</c:if>
			<c:if test="${getCoefficient.coefficientName == '휘발유 CO2 발생량'}">
				<div id="gasolineCoefficient">${getCoefficient.coefficientValue}</div>

			</c:if>
			<c:if test="${getCoefficient.coefficientName == '경유 CO2 발생량'}">
				<div id="dieselCoefficient">${getCoefficient.coefficientValue}</div>
			</c:if>
			<c:if test="${getCoefficient.coefficientName == 'LPG CO2 발생량'}">
				<div id="lpgCoefficient">${getCoefficient.coefficientValue}</div>
			</c:if>
			<c:if test="${getCoefficient.coefficientName == '폐기물 CO2 발생량'}">
				<div id="wasteCoefficient">${getCoefficient.coefficientValue}</div>
			</c:if>
		</c:forEach>
	</div>
	
	<b>주거형태별 에너지소비량</b>
	<div>${keyGetHte }</div>
	<br>
	<b>주거형태별 인구비율</b>
	<div>${keyGetHtr }</div>
	<br>
	<b>가구별 가구원수 및 비율</b>
	<div>${keyGetHmc }</div>
	<br>
	<b>사용면적별 에너지소비량</b>
	<div>${keyGetRae }</div>
	<br>
	<b>가구원별 에너지소비량</b>
	<div>${keyGetHme }</div>
	
	<!-- 주거형태별 탄소배출량 -->
	<div style="display:none;">
		<div id="cgDh">${keyGetHte[0]['hteConsumption'] }</div>
		<div id="cgApt">${keyGetHte[1]['hteConsumption'] }</div>
		<div id="cgMph">${keyGetHte[2]['hteConsumption'] }</div>
		<div id="cgElse">${keyGetHte[3]['hteConsumption'] }</div>
		<div id="eDh">${keyGetHte[4]['hteConsumption'] }</div>
		<div id="eApt">${keyGetHte[5]['hteConsumption'] }</div>
		<div id="eMph">${keyGetHte[6]['hteConsumption'] }</div>
		<div id="eElse">${keyGetHte[7]['hteConsumption'] }</div>
	</div>
	
	<!-- 주거형태 -->
	<div style="display:none;">
		<div id="cgDh">${keyGetHte[0]['hteConsumption'] }</div>
		<div id="cgApt">${keyGetHte[1]['hteConsumption'] }</div>
		<div id="cgMph">${keyGetHte[2]['hteConsumption'] }</div>
		<div id="cgElse">${keyGetHte[3]['hteConsumption'] }</div>
		<div id="eDh">${keyGetHte[4]['hteConsumption'] }</div>
		<div id="eApt">${keyGetHte[5]['hteConsumption'] }</div>
		<div id="eMph">${keyGetHte[6]['hteConsumption'] }</div>
		<div id="eElse">${keyGetHte[7]['hteConsumption'] }</div>
	</div>
	
	<!-- 가구원수 -->
	<div style="display:none;">
		<div id="cgDh">${keyGetHte[0]['hteConsumption'] }</div>
		<div id="cgApt">${keyGetHte[1]['hteConsumption'] }</div>
		<div id="cgMph">${keyGetHte[2]['hteConsumption'] }</div>
		<div id="cgElse">${keyGetHte[3]['hteConsumption'] }</div>
		<div id="eDh">${keyGetHte[4]['hteConsumption'] }</div>
		<div id="eApt">${keyGetHte[5]['hteConsumption'] }</div>
		<div id="eMph">${keyGetHte[6]['hteConsumption'] }</div>
		<div id="eElse">${keyGetHte[7]['hteConsumption'] }</div>
	</div>

	<div class="house">
		<span class="span">주거 형태</span>
	</div>
	<div class="house-type-select-box">
		<div class="house-type-select d-flex">
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type1"
					value="0" checked> <label for="housing_type1">아파트</label>
			</div>
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type2"
					value="1"> <label for="housing_type2">단독주택</label>
			</div>
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type3"
					value="2"> <label for="housing_type3">연립 및 다세대</label>
			</div>
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type4"
					value="3"> <label for="housing_type4">기타</label>
			</div>
		</div>
	</div>

	<div class="area">
		<span class="span">거주면적</span>
	</div>
	<div class="resdential-area-select-box">
		<div class="resdential-area-select d-flex">
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea1"
					value="0" checked> <label for="resdentialArea1">~33㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea2"
					value="1"> <label for="resdentialArea2">33㎡ 초과 ~ 66㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea3"
					value="2"> <label for="resdentialArea3">66㎡ 초과~99㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea4"
					value="3"> <label for="resdentialArea4">99㎡ 초과~132㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea5"
					value="4"> <label for="resdentialArea5">132㎡ 초과~</label>
			</div>
		</div>
	</div>
	
	<div class="member">
		<span class="span">거주인원</span>
	</div>
	<div class="house-member-select-box">
		<div class="house-member-select d-flex">
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember1"
					value="0" checked> <label for="livingMember1">1명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember2"
					value="1"> <label for="livingMember2">2명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember3"
					value="2"> <label for="livingMember3">3명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember4"
					value="3"> <label for="livingMember4">4명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember5"
					value="4"> <label for="livingMember5">5명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember6"
					value="5"> <label for="livingMember6">6명 이상</label>
			</div>
		</div>
	</div>

	<div class="graph-container">
		<div class="title-box">
			<div class="carbonCal-title w-50">
				<h1 style="color: green; font-weight: bold;">탄소발자국 계산기</h1>
				<span style="font-size: 0.7vw;">내가 생활 속에서 배출하는 이산화탄소의 양은 얼마나
					될까요?</span>
			</div>
			<div class="w-50 d-flex align-items-center justify-content-end">
				<a class="home-go" href="${pageContext.request.contextPath }"> <img
					src="${pageContext.request.contextPath}/resources/image/home.png">
					<span>홈으로 이동</span>
				</a>
			</div>
		</div>
		<div class="usage-result-box">
			<div class="select-date-box">
				<div>
					<select id="year">
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
					</select> <select id="month">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
			</div>
			<div class="graph-box">
				<div class="circle-graph-box">
					<div class="circle-graph">
						<canvas id="myChart"></canvas>
					</div>
					<div class="circle-graph-explain-box">
						<div>
							<h2>당신의 탄소배출량 결과</h2>
							<c:if test="${sessionScope.login.userId != null }">
								<p>${sessionScope.login.userName }님의이산화탄소(CO₂)발생량통계입니다.</p>
								<div>
									<span>${sessionScope.login.userName }님 가정의 이산화탄소 배출량은 총</span>
									<span id="resultCO2"></span> <span>kg 입니다. 왼쪽의 그래프를 보면
										어느 부분에서 이산화탄소가 가장 많이 발생하고 있는지 확인할 수 있습니다.</span>
								</div>
							</c:if>
							<c:if test="${sessionScope.login.userId == null }">
								<p>나의 이산화탄소(CO₂) 발생량 통계</p>
								<div>
									<span>고객님 가정의 이산화탄소 배출량은 총</span> <span id="resultCO2"></span>
									<span>kg 입니다. 왼쪽의 그래프를 보면 어느 부분에서 이산화탄소가 가장 많이 발생하고 있는지
										확인할 수 있습니다.</span>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="bar-graph-box">
					<!-- 전기 -->
					<div class="allType-graph-box">
						<div class="bar-graph-title">
							<div class="img-box">
								<img src="image/electric.png">
							</div>
							<span>전기</span>
						</div>
						<div class="bar-graph">
							<canvas id="elecGraph"></canvas>
						</div>
					</div>

					<!-- 가스 -->
					<div class="allType-graph-box">
						<div class="bar-graph-title">
							<div class="img-box">
								<img src="image/gas.jpg">
							</div>
							<span>가스</span>
						</div>
						<div class="bar-graph">
							<canvas id="gasGraph"></canvas>
						</div>
					</div>

					<!-- 교통 -->
					<div class="allType-graph-box">
						<div class="bar-graph-title">
							<div class="img-box">
								<img src="image/traffic.png">
							</div>
							<span>교통</span>
						</div>
						<div class="bar-graph">
							<canvas id="trafficGraph"></canvas>
						</div>
					</div>

					<!-- 폐기물 -->
					<div class="allType-graph-box">
						<div class="bar-graph-title">
							<div class="img-box">
								<img src="image/garbage.png">
							</div>
							<span>폐기물</span>
						</div>
						<div class="bar-graph">
							<canvas id="garbageGraph"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div>
				<form id="resRegistForm"
					action="${pageContext.request.contextPath }/carbonCalRegistDo"
					method="POST">
					<div class="d-none">
						<input type="hidden" value="${sessionScope.login.userId }"
							name="userId"> <input type="date" id="regDate"
							name="resultDate" value="${carbonCalculateDTO.resultDate}">
						<input type="hidden" id="resElec" name="electricUsage"> <input
							type="hidden" id="resGas" name="gasUsage"> <input
							type="hidden" id="resGar" name="wasteWeight"> <input
							type="hidden" id="resTrfType" name="trafficKind"> <input
							type="hidden" id="resTrf" name="trafficValue">
					</div>
					<button id="resRegistBtn" type="button">저장하기</button>
				</form>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
	let v_regDate = document.getElementById("regDate");
    const currentDate = new Date();
    const currentYear = currentDate.getFullYear();
    const currentMonth = currentDate.getMonth() + 1;
    const currentDay = currentDate.getDate();

	// Date 객체를 "yyyy-MM-dd" 형식으로 설정
	v_regDate.value = currentYear + '-' + (currentMonth < 10 ? '0' + currentMonth : currentMonth) + '-' + (currentDay < 10 ? '0' + currentDay : currentDay);

    const yearSelect = document.getElementById('year');
    const monthSelect = document.getElementById('month');

    // 연도 선택 박스에서 현재 연도를 설정
    yearSelect.value = currentYear;

    // 연도나 월이 변경될 때마다 달력을 업데이트
    function updateMonthOptions() {
		const selectedYear = parseInt(yearSelect.value);
		const selectedMonth = parseInt(monthSelect.value);

        // Date 객체를 생성할 때 day는 1로 설정 (1일로 설정)
        const selectedDate = new Date(selectedYear, selectedMonth - 1, 1); // month는 0부터 시작하므로 1을 빼줍니다.

        // Date 객체를 "yyyy-MM-dd" 형식으로 업데이트
        v_regDate.value = selectedDate.getFullYear() + "-" + (selectedDate.getMonth() + 1).toString().padStart(2, '0') + "-01"; // "YYYY-MM-DD" 형식으로 설정

        // 선택된 년도와 월을 console에 출력 (확인용)
        console.log("선택된 날짜 (년도-월): " + v_regDate.value);
    }

    // 연도 선택 시 업데이트
    yearSelect.addEventListener('change', function() {
        updateMonthOptions();
    });

    // 월 선택 시 월을 업데이트
    monthSelect.addEventListener('change', function() {
        updateMonthOptions();
    });

    // 초기화 시 달력을 설정 (현재 연도, 월 기준)
    updateMonthOptions();
    
    window.onload = function() {
    // sessionStorage에서 'resultTrfType' 값을 가져옵니다.
    let resTrfTypeValue = sessionStorage.getItem('resultTrfType');
    console.log(resTrfTypeValue);

    // 해당 값이 존재하면 input 태그에 설정합니다.
    if (resTrfTypeValue) {
        document.getElementById('resTrfType').value = resTrfTypeValue;
    }
};

// 결과 트래픽 타입을 sessionStorage에서 가져와서 추가적으로 처리할 부분
let v_resultTrfType = sessionStorage.getItem('resultTrfType');
let v_resultTrf = sessionStorage.getItem('resultTrf');
let v_fuelCo2 = 0;

let v_resultElec = sessionStorage.getItem('resultElec');
let v_resultGas = sessionStorage.getItem('resultGas');
let v_resultGar = sessionStorage.getItem('resultGar');

if(!v_resultElec){
	document.getElementById("resElec").value = 0
}else{
	document.getElementById("resElec").value = v_resultElec;
}

if(!v_resultGas){
	document.getElementById("resGas").value = 0
}else{
	document.getElementById("resGas").value = v_resultGas;
}

if(!v_resultGar){
	document.getElementById("resGar").value = 0
}else{
	document.getElementById("resGar").value = v_resultGar;
}

if(!v_resultTrfType){
	document.getElementById("resTrfType").value = 0
}else{
	document.getElementById("resTrfType").value = v_resultTrfType;
}

if(!v_resultTrf){
	document.getElementById("resTrf").value = 0
}else{
	document.getElementById("resTrf").value = v_resultTrf;
}

console.log(document.getElementById("resTrf").value);

document.getElementById("resRegistBtn").addEventListener('click', () => {
    // regDate가 빈값일 경우, 알림
    if (v_regDate.value.length <= 4) {
        alert("년도와 월을 선택해주세요");
        return;
    }

    // 등록 폼 제출
    document.getElementById("resRegistForm").submit();
});

v_resultElec = Math.round(v_resultElec * document.getElementById("electricCoefficient").innerHTML * 100000) / 100000;
v_resultGas = Math.round(v_resultGas * document.getElementById("gasCoefficient").innerHTML * 100000) / 100000;
v_resultGar = Math.round(v_resultGar * document.getElementById("wasteCoefficient").innerHTML * 100000) / 100000;

if (v_resultTrfType == '휘발유') {
    v_fuelCo2 = Math.round(v_resultTrf * document.getElementById("gasolineCoefficient").innerHTML * 100000) / 100000;
} else if (v_resultTrfType == '경유') {
    v_fuelCo2 = Math.round(v_resultTrf * document.getElementById("dieselCoefficient").innerHTML * 100000) / 100000;
} else if (v_resultTrfType == 'LPG') {
    v_fuelCo2 = Math.round(v_resultTrf * document.getElementById("lpgCoefficient").innerHTML * 100000) / 100000;
}

sessionStorage.removeItem("resultCo2");
let v_allCo2 = v_fuelCo2 + v_resultElec + v_resultGas + v_resultGar
console.log(v_allCo2)
sessionStorage.setItem("resultCo2", v_allCo2);
document.getElementById("resultCO2").innerHTML += v_allCo2;

		/* 배출량 원 그래프 */
		let ctx = document.getElementById('myChart');

        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['전기', '가스', '폐기물', '교통'],
                datasets: [{
                    data: [v_resultElec, v_resultGas, v_resultGar, v_fuelCo2]
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    datalabels: {
                        color: '#fff', // 데이터 글자 색상
                        font: {
                            size: 15, // 글자 크기
                        },
                        formatter: (value, context) => {
                        	if(value == 0) return ''
                            return value + "kg";
                        }
                    }
                }
            },
            plugins: [ChartDataLabels] // 플러그인 활성화
        });
        
        

        let electricCtx = document.getElementById('elecGraph');

        /* 전기 */
        new Chart(electricCtx, {
            type: 'bar', // bar = 막대그래프는 항목별 수량, 수치를 비교할 때 적합하다.
            data: {
                labels: ['내 건물', '다른 건물'],
                datasets: [{
                    data: [v_resultElec, 10],
					backgroundColor: "blue"
                }]
            },
            options: {
            	responsive: true, // 화면 크기에 따라 반응형 조정
                maintainAspectRatio: false, // 비율을 유지하지 않음
                plugins: {
                    legend: {
                        display: false // 범례 숨기기 (label 위쪽 부분)
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        
        /* 가스 */
        let gasCtx = document.getElementById('gasGraph');

        new Chart(gasCtx, {
            type: 'bar', // bar = 막대그래프는 항목별 수량, 수치를 비교할 때 적합하다.
            data: {
                labels: ['내 건물', '다른 건물'],
                datasets: [{
                    data: [v_resultGas, 10],
					backgroundColor: "red"
                }]
            },
            options: {
            	responsive: true, // 화면 크기에 따라 반응형 조정
                maintainAspectRatio: false, // 비율을 유지하지 않음
                plugins: {
                    legend: {
                        display: false // 범례 숨기기 (label 위쪽 부분)
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        
        /* 폐기물 */
        let garbageCtx = document.getElementById('garbageGraph');

        new Chart(garbageCtx, {
            type: 'bar', // bar = 막대그래프는 항목별 수량, 수치를 비교할 때 적합하다.
            data: {
                labels: ['내 건물', '다른 건물'],
                datasets: [{
                    data: [v_resultGar, 10],
					backgroundColor: "yellow"
                }]
            },
            options: {
            	responsive: true, // 화면 크기에 따라 반응형 조정
                maintainAspectRatio: false, // 비율을 유지하지 않음
                plugins: {
                    legend: {
                        display: false // 범례 숨기기 (label 위쪽 부분)
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        
        /* 교통 */
        let trafficCtx = document.getElementById('trafficGraph');

        new Chart(trafficCtx, {
            type: 'bar', // bar = 막대그래프는 항목별 수량, 수치를 비교할 때 적합하다.
            data: {
                labels: ['내 건물', '다른 건물'],
                datasets: [{
                    data: [v_resultTrf, 10],
					backgroundColor: "purple"
                }]
            },
            options: {
            	responsive: true, // 화면 크기에 따라 반응형 조정
                maintainAspectRatio: false, // 비율을 유지하지 않음
                plugins: {
                    legend: {
                        display: false // 범례 숨기기 (label 위쪽 부분)
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        
        // 
        radioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', function() {
                const selectedHousingType = document.querySelector('input[name="housing_type"]:checked');
            });
        });

        // 기본적으로 "아파트" 라디오 버튼이 체크된 상태로 설정
        const defaultHousingType = document.getElementById('housing_type1');
        if (defaultHousingType) {
        	defaultHousingType.checked = true;
        }
        
        // 사용자가 주거형태나 거주면적을 바꾸면 비교되는 그래프의 값이 바뀜
        function changeCo2(){
        	const selectedHousingType = document.querySelector('input[name="housing_type"]:checked');
        	
        	/* 원하는 상태 선택 */
		    if (selectedHousingType && v_inputFuel) {
		        const housingType = selectedHousingType.nextElementSibling.textContent.trim();
		        if (housingType === '아파트') {
		            resultFuelCo2 = v_inputFuel * document.getElementById("gasolineCoefficient").innerHTML;
		        } else if (housingType === '단독주택') {
		            resultFuelCo2 = v_inputFuel * document.getElementById("dieselCoefficient").innerHTML;
		        } else if (housingType === '연립 및 다세대') {
		            resultFuelCo2 = v_inputFuel * document.getElementById("lpgCoefficient").innerHTML;
		        } else if (housingType === '기타') {
		            resultFuelCo2 = v_inputFuel * document.getElementById("lpgCoefficient").innerHTML;
		        }
		    }
        }
    </script>


</body>
</html>