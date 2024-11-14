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
<!-- <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script> -->

<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="container">
		<div>
			<div class="date">
				<select>2024
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
					<div>${sessionScope.login.userId }</div>
					<div id="resElec"></div>
					<div id="resGas"></div>
					<div id="resGar"></div>
					<div id="resTrfType"></div>
					<div id="resTrf"></div>
				</div>
				<button id="resRegistBtn" type="button">저장하기</button>
			</form>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script type="text/javascript">
		let ctx = document.getElementById('myChart');
	
		let v_resultTrfType = sessionStorage.getItem('resultTrfType');
		let v_resultTrf = sessionStorage.getItem('resultTrf');
		let v_fuelCo2 = 0;
		
		let v_resultElec = sessionStorage.getItem('resultElec')
		let v_resultGas = sessionStorage.getItem('resultGas')
		let v_resultGar = sessionStorage.getItem('resultGar')
		
		document.getElementById("resElec").innerHTML += v_resultElec
		document.getElementById("resGas").innerHTML += v_resultGas
		document.getElementById("resGar").innerHTML += v_resultGar
		document.getElementById("resTrfType").innerHTML += v_resultTrfType
		document.getElementById("resTrf").innerHTML += v_resultTrf
		
		document.getElementById("resRegistBtn").addEventListener('click', ()=>{
			document.getElementById("resRegistForm").submit();
		});
		
		v_resultElec = Math.round(v_resultElec * 0.4781 * 100000) / 100000;
		v_resultGas = Math.round(v_resultGas * 2.176 * 100000) / 100000;
		v_resultGar = Math.round(v_resultGar * 0.5573 * 100000) / 100000;
		
		if(v_resultTrfType == '휘발유'){
			v_fuelCo2 = Math.round((v_resultTrf / 16.04) * 2.097 * 100000) / 100000;
        } else if (v_resultTrfType == '경유') {
        	v_fuelCo2 = Math.round((v_resultTrf / 15.35) * 2.582 * 100000) / 100000;
        } else if (v_resultTrfType == 'LPG') {
        	v_fuelCo2 = Math.round((v_resultTrf / 11.06) * 1.868 * 100000) / 100000;
        } else if(v_resultTrfType == '승용차 없음'){
        	v_fuelCo2 = 0;
        }
		
		
		new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ '전기', '가스', '폐기물', '교통' ],
				datasets : [ {
					data : [ v_resultElec, v_resultGas,
							v_fuelCo2, v_resultGar ]
				} ]
			}
		});

		let ctx2 = document.getElementById('elecGraph');

		new Chart(ctx2, {
			type : 'bar', // bar = 막대그래프는 항목별 수량, 수치를 비교할 때 적합하다.
			data : {
				labels : [ '내 건물', '다른 건물' ],
				datasets : [ {
					data : [ v_resultElec, 10 ]
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});
	</script>


</body>
</html>