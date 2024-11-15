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

.bar-graph{
	height: 90%;
}

#elecGraph{
	width: 100%;
	height: 100%;
}
</style>

<!-- 그래프 그리기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

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
							<p>${sessionScope.login.userId }님의 이번 달 이산화탄소(CO₂)발생량통계입니다.</p>
						</div>
						<div>
							<span>${sessionScope.login.userId }님의 이산화탄소 배출량은 총</span> <span id="resultCO2"></span> <span>kg
								입니다. 왼쪽의 그래프를 보면 어느 부분에서 이산화탄소가 가장 많이 발생하고 있는지 확인할 수 있습니다.</span>
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
					<button id="resRegistBtn" type="button">수정하기</button>
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
    const currentMonth = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해야 실제 월이 됩니다.
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

document.getElementById("resElec").value += v_resultElec;
document.getElementById("resGas").value += v_resultGas;
document.getElementById("resGar").value += v_resultGar;
document.getElementById("resTrfType").value += v_resultTrfType;
document.getElementById("resTrf").value += v_resultTrf;

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

v_resultElec = Math.round(v_resultElec * 0.4781 * 100000) / 100000;
v_resultGas = Math.round(v_resultGas * 2.176 * 100000) / 100000;
v_resultGar = Math.round(v_resultGar * 0.5573 * 100000) / 100000;

if (v_resultTrfType == '휘발유') {
    v_fuelCo2 = Math.round((v_resultTrf / 16.04) * 2.097 * 100000) / 100000;
} else if (v_resultTrfType == '경유') {
    v_fuelCo2 = Math.round((v_resultTrf / 15.35) * 2.582 * 100000) / 100000;
} else if (v_resultTrfType == 'LPG') {
    v_fuelCo2 = Math.round((v_resultTrf / 11.06) * 1.868 * 100000) / 100000;
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
                    data: [v_resultElec, v_resultGas, v_fuelCo2, v_resultGar]
                }]
            }
        });
    </script>


</body>
</html>