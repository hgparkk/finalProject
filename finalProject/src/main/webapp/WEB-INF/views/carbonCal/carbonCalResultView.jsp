<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>

<%
java.time.YearMonth currentYearMonth = java.time.YearMonth.now();
int currentYear = currentYearMonth.getYear();
int currentMonth = currentYearMonth.getMonthValue(); // 1에서 12 사이의 값
request.setAttribute("currentYear", currentYear);
request.setAttribute("currentMonth", currentMonth);
%>

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

	<div class="graph-container">
		<div class="title-box">
			<div class="carbonCal-title w-50">
				<h1 style="color: green; font-weight: bold;">탄소발자국 계산기</h1>
				<span style="font-size: 0.7vw;">내가 생활 속에서 배출하는 이산화탄소의 양은 얼마나
					될까요?</span>
			</div>
			<div class="w-50 d-flex align-items-center justify-content-end">
				<a class="home-go" href="${pageContext.request.contextPath }/"> <img
					src="${pageContext.request.contextPath}/resources/image/home.png">
					<span>홈으로 이동</span>
				</a>
			</div>
		</div>
		<div class="usage-result-box">
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
									<span>익명님 가정의 이산화탄소 배출량은 총</span> <span id="resultCO2"></span>
									<span>kg 입니다. 왼쪽의 그래프를 보면 어느 부분에서 이산화탄소가 가장 많이 발생하고 있는지
										확인하실 수 있습니다.</span>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="d-flex flex-column align-items-center">
					<div class="bar-graph-box justify-content-center">
						<div class="bar-graph">
							<canvas id="co2Graph"></canvas>
						</div>
					</div>
					<div class="d-flex" style="width: 70%;">
						<div class="select-date-box">
							<span>결과를 저장할 날짜를 선택해주세요</span> <select id="year">
								<option value="${currentYear-2 }">${currentYear-2 }</option>
								<option value="${currentYear-1 }">${currentYear-1 }</option>
								<option value="${currentYear}" selected>${currentYear}</option>
							</select> <select id="month">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</div>
						<div style="width: 15%;">
							<form id="registCheckForm"
								action="${pageContext.request.contextPath }/carbonCalRegistCheck"
								method="POST">
								<div class="d-none">
									<input type="hidden" value="${sessionScope.login.userId }"
										name="userId">
									<input type="hidden" id="dateYear1" name="year">
									<input type="hidden" id="dateMonth1" name="month">
									<input type="hidden" id="resElec1" name="electricUsage">
									<input type="hidden" id="resGas1" name="gasUsage">
									<input type="hidden" id="resGar1" name="wasteWeight">
									<input type="hidden" id="resTrfType1" name="trafficKind">
									<input type="hidden" id="resTrf1" name="trafficValue">
								</div>
								<button id="resRegistBtn" class="btn btn-secondary"
									type="button">저장하기</button>
							</form>
							<form id="registUpdateForm"
								action="${pageContext.request.contextPath }/carbonCalUpdateDo"
								method="POST">
								<div class="d-none">
									<input type="hidden" value="${sessionScope.login.userId }"
										name="userId">
									<input type="hidden" id="dateYear2" name="year">
									<input type="hidden" id="dateMonth2" name="month">
									<input type="hidden" id="resElec2" name="electricUsage">
									<input type="hidden" id="resGas2" name="gasUsage">
									<input type="hidden" id="resGar2" name="wasteWeight">
									<input type="hidden" id="resTrfType2" name="trafficKind">
									<input type="hidden" id="resTrf2" name="trafficValue">
								</div>
							</form>
							<form id="registRegistForm"
								action="${pageContext.request.contextPath }/carbonCalRegistDo"
								method="POST">
								<div class="d-none">
									<input type="hidden" value="${sessionScope.login.userId }"
										name="userId">
									<input type="hidden" id="dateYear3" name="year">
									<input type="hidden" id="dateMonth3" name="month">
									<input type="hidden" id="resElec3" name="electricUsage">
									<input type="hidden" id="resGas3" name="gasUsage">
									<input type="hidden" id="resGar3" name="wasteWeight">
									<input type="hidden" id="resTrfType3" name="trafficKind">
									<input type="hidden" id="resTrf3" name="trafficValue">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
		v_year = document.getElementById("year")
		v_month = document.getElementById("month")
		
		monthOptions = v_month.querySelectorAll("option");
		
		function monthSet(){
			if(v_year.value == ${currentYear}){
				monthOptions.forEach(option =>{
					if(option.innerHTML >= ${currentMonth}){
						option.disabled = true;
					}else{
						option.disabled = false;
					}
				})
			}else{
				monthOptions.forEach(option =>{
					option.disabled = false;
				})
			}
			document.getElementById("dateYear1").value = v_year.value
			document.getElementById("dateYear2").value = v_year.value
			document.getElementById("dateYear3").value = v_year.value
			document.getElementById("dateMonth1").value = v_month.value
			document.getElementById("dateMonth2").value = v_month.value
			document.getElementById("dateMonth3").value = v_month.value
		}
		monthSet()
		
		v_year.addEventListener("change", monthSet)
		
		v_month.addEventListener("change", ()=>{
			document.getElementById("dateYear1").value = v_year.value
			document.getElementById("dateYear2").value = v_year.value
			document.getElementById("dateYear3").value = v_year.value
			document.getElementById("dateMonth1").value = v_month.value
			document.getElementById("dateMonth2").value = v_month.value
			document.getElementById("dateMonth3").value = v_month.value
		})
		

// 결과 트래픽 타입을 sessionStorage에서 가져와서 추가적으로 처리할 부분
let v_resultTrfType = sessionStorage.getItem('resultTrfType');
let v_resultTrf = sessionStorage.getItem('resultTrf');
let v_fuelCo2 = 0;

let v_resultElec = sessionStorage.getItem('resultElec');
let v_resultGas = sessionStorage.getItem('resultGas');
let v_resultGar = sessionStorage.getItem('resultGar');

if(!v_resultElec){
	document.getElementById("resElec1").value = 0
	document.getElementById("resElec2").value = 0
	document.getElementById("resElec3").value = 0
}else{
	document.getElementById("resElec1").value = v_resultElec;
	document.getElementById("resElec2").value = v_resultElec;
	document.getElementById("resElec3").value = v_resultElec;
}

if(!v_resultGas){
	document.getElementById("resGas1").value = 0
	document.getElementById("resGas2").value = 0
	document.getElementById("resGas3").value = 0
}else{
	document.getElementById("resGas1").value = v_resultGas;
	document.getElementById("resGas2").value = v_resultGas;
	document.getElementById("resGas3").value = v_resultGas;
}

if(!v_resultGar){
	document.getElementById("resGar1").value = 0
	document.getElementById("resGar2").value = 0
	document.getElementById("resGar3").value = 0
}else{
	document.getElementById("resGar1").value = v_resultGar;
	document.getElementById("resGar2").value = v_resultGar;
	document.getElementById("resGar3").value = v_resultGar;
}

if(!v_resultTrfType){
	document.getElementById("resTrfType1").value = 0
	document.getElementById("resTrfType2").value = 0
	document.getElementById("resTrfType3").value = 0
}else{
	document.getElementById("resTrfType1").value = v_resultTrfType;
	document.getElementById("resTrfType2").value = v_resultTrfType;
	document.getElementById("resTrfType3").value = v_resultTrfType;
}

if(!v_resultTrf){
	document.getElementById("resTrf1").value = 0
	document.getElementById("resTrf2").value = 0
	document.getElementById("resTrf3").value = 0
}else{
	document.getElementById("resTrf1").value = v_resultTrf;
	document.getElementById("resTrf2").value = v_resultTrf;
	document.getElementById("resTrf3").value = v_resultTrf;
}

let registCheckForm = document.getElementById("registCheckForm")

document.getElementById("resRegistBtn").addEventListener('click', () => {
	let registCheckForm = $('#registCheckForm')
	let v_url = registCheckForm.attr("action")
	let formdata = registCheckForm.serialize()
	
    $.ajax({
		type : 'POST',
		url : v_url,
		data : formdata,
		success : function(result1){
			if(result1 == "login"){
				location.href = "${pageContext.request.contextPath}" + "/loginView"
			}else if(result1 == "exist"){
				if(confirm("저장할려는 날짜와 같은 날짜가 이미 존재합니다 덮어쓰시겠습니까?")){
					document.getElementById("registUpdateForm").submit();
				}
			}else{
				document.getElementById("registRegistForm").submit();
			}
		}
	})
})

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
v_allCo2 = Math.round(v_allCo2 * 100000) / 100000
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
        
        let co2Ctx = document.getElementById('co2Graph');

        new Chart(co2Ctx, {
            type: 'bar', // bar = 막대그래프는 항목별 수량, 수치를 비교할 때 적합하다.
            data: {
                labels: ['우리 집', '다른 집'],
                datasets: [{
                    data: [v_allCo2, ${avgCo2Emisison}],
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
        
        const htRadioButtons = document.querySelectorAll('input[name="housing_type"]');
        const RaRadioButtons = document.querySelectorAll('input[name="resdentialArea"]');
        const HhRadioButtons = document.querySelectorAll('input[name="livingMember"]');
        
        // 주거형태 선택
        htRadioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', function() {
                const selectedHousingType = document.querySelector('input[name="housing_type"]:checked');
                if(selectedHousingType == '아파트'){
	                console.log("변화")
                }
                console.log(selectedHousingType.nextElementSibling.textContent.trim())
            });
        });
        
     	// 거주면적 선택
        RaRadioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', function() {
                const selectedResidentialArea = document.querySelector('input[name="resdentialArea"]:checked');
                console.log(selectedResidentialArea.nextElementSibling.textContent.trim())
            });
        });
        
     	// 가구원수 선택
        HhRadioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', function() {
                const selectedHousehold = document.querySelector('input[name="livingMember"]:checked');
                console.log(selectedHousehold.nextElementSibling.textContent.trim())
            });
        });
        
        // 사용자가 주거형태나 거주면적을 바꾸면 비교되는 그래프의 값이 바뀜
        function changeCo2(){
        	const selectedHousingType = document.querySelector('input[name="housing_type"]:checked');
        	console.log(selectedHousingType)
        	
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