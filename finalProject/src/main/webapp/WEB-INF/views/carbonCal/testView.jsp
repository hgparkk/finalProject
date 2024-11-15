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
				</select> 
				<select id="month">
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
	</div>

	<div class="graph-container">
		<div class="usage-result-box">
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
							<span>${sessionScope.login.userId }님의 이산화탄소 배출량은 총</span> 
							<span id="resultCO2"></span> <span>kg입니다. 왼쪽의 그래프를 보면 어느 부분에서 이산화탄소가 가장 많이 발생하고 있는지 확인할 수 있습니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
	// 연도와 월 선택 시 데이터 요청
	function fetchCarbonData(year, month) {
	    // AJAX 요청 보내기
	    fetch(`/carbonCal/getCarbonData?year=${year}&month=${month}`, {
	        method: 'GET'
	    })
	    .then(response => response.json())
	    .then(data => {
	        // 서버에서 받은 데이터를 사용해 페이지 업데이트
	        updateCarbonGraph(data);
	        updateCarbonDetails(data);
	    })
	    .catch(error => {
	        console.error('데이터를 가져오는 데 실패했습니다:', error);
	    });
	}

	// 연도와 월 선택 시 이벤트 리스너 추가
	const yearSelect = document.getElementById('year');
	const monthSelect = document.getElementById('month');

	yearSelect.addEventListener('change', function() {
	    const selectedYear = yearSelect.value;
	    const selectedMonth = monthSelect.value;
	    fetchCarbonData(selectedYear, selectedMonth);  // 데이터 요청
	});

	monthSelect.addEventListener('change', function() {
	    const selectedYear = yearSelect.value;
	    const selectedMonth = monthSelect.value;
	    fetchCarbonData(selectedYear, selectedMonth);  // 데이터 요청
	});
	
	// 그래프와 세부 정보를 업데이트하는 함수
	function updateCarbonGraph(data) {
	    // 기존의 그래프를 업데이트
	    const ctx = document.getElementById('myChart').getContext('2d');
	    const myChart = new Chart(ctx, {
	        type: 'pie',
	        data: {
	            labels: ['전기', '가스', '폐기물', '교통'],
	            datasets: [{
	                data: [data.electric, data.gas, data.traffic, data.waste],
	                backgroundColor: ['#FF0000', '#00FF00', '#0000FF', '#FFFF00']
	            }]
	        }
	    });
	}

	function updateCarbonDetails(data) {
	    // 배출량 결과 텍스트 업데이트
	    document.getElementById('resultCO2').innerText = '${data.totalCo2} kg';
	}

	</script>

</body>
</html>