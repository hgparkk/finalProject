<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>

<!-- 그래프 그리기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="container">
		<div>
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
		<div>
			<div>
				<div>
					<canvas id="myChart"></canvas>
				</div>
				<div>
					<div>
						<span>당신의 탄소배출량</span> <span>대충설명</span>
					</div>
					<div>
						<span>또설명</span>
					</div>
				</div>
			</div>
			<div>
				<div>
					<div>
						<div>
							<img src="">
						</div>
						<span>전기</span>
					</div>
					<div>
						<div>
							<canvas id="elecGraph"></canvas>
						</div>
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
    
    console.log()
    
    window.onload = function() {
    // sessionStorage에서 'resultTrfType' 값을 가져옵니다.
    let resTrfTypeValue = sessionStorage.getItem('resultTrfType');
    console.log(resTrfTypeValue);

    // 해당 값이 존재하면 input 태그에 설정합니다.
    if (resTrfTypeValue) {
        document.getElementById('resTrfType').value = resTrfTypeValue;  // id값이 정확해야 합니다.
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
} else if (v_resultTrfType == '승용차 없음') {
    v_fuelCo2 = 0;
}

        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['전기', '가스', '폐기물', '교통'],
                datasets: [{
                    data: [v_resultElec, v_resultGas, v_fuelCo2, v_resultGar]
                }]
            }
        });

        let ctx2 = document.getElementById('elecGraph');

        new Chart(ctx2, {
            type: 'bar', // bar = 막대그래프는 항목별 수량, 수치를 비교할 때 적합하다.
            data: {
                labels: ['내 건물', '다른 건물'],
                datasets: [{
                    data: [v_resultElec, 10]
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

</body>
</html>
