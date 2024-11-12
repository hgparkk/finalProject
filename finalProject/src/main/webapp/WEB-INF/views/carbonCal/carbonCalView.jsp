<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

<style type="text/css">
.carbonCal-container {
	width: 100%;
	max-width: 1300px;
	min-width: 500px;
	justify-content: center;
	margin: auto;
	padding-left: 2vw;
	padding-right: 2vw;
}

.title-box {
	display: flex;
	padding-left: 2vw;
	padding-right: 2vw;
}

.carbonCal-title {
	width: 100%;
	height: 10vh;
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

.ww {
	height: 3vw;
}

.co2-box {
	justify-content: space-between;
	flex-wrap: wrap;
	max-width: 1300px;
	min-width: 500px;
	max-width: 1300px;
}

.inputUsage-box {
	border: 1px solid #CCCCCC;
	border-radius: 0.5vw;
	width: 48%;
	height: 25vw;
	margin-bottom: 0.3vw;
	display: inline-block;
}

.inputUsage {
	display: flex;
	justify-content: space-between;
}

.outputCo2 {
	display: flex;
	justify-content: space-between;
}

.clicked {
	border-color: green;
	border-width: 0.2vw;
}

.input-box {
	display: flex;
	height: 3vw;
	padding: 0.5vw;
}

.fuel-img {
	display: flex;
	justify-content: start;
	align-items: center;
}

.fuel-img>img {
	width: 1.5vw;
	height: 1.5vw;
}

.input-box>span {
	font-size: 1.5vw;
	font-weight: bold;
	color: #6FADCF;
}

.output-box {
	border-top: 1px solid #CCCCCC;
	height: 22vw;
	padding: 1vw;
}

.inAndOut-box {
	height: 14vw;
	display: flex;
	flex-direction: column;
}

.span {
	padding-right: 2vw;
}

.input {
	width: 18vw;
	height: 2.5vw;
	padding: 0.4vw;
	text-align: right;
}

.input::placeholder {
	font-size: 1vw;
}

.inputUsage>span {
	font-size: 1vw;
}

.outputCo2>span {
	font-size: 1vw;
}

.explain-box {
	height: 5vw;
}

.explain-box>span {
	font-size: 0.8vw;
}

@media screen and (max-width:1340px) {
	.co2-box {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.inputUsage-box {
		width: 80%;
		height: 40vw;
		margin: 1vw auto;
	}
	.input-box {
		height: 3vw;
	}
	.output-box {
		height: 37vw;
		padding: 2vw;
	}
	.inAndOut-box {
		height: 26vw;
	}
	.explain-box {
		height: 7vw;
	}
	.usage-group {
		display: flex;
		flex-direction: column;
		min-width: 500px;
	}
}

.co2-usage {
	background-color: green;
	color: white;
	font-size: 15px;
	border-top-right-radius: 0.3vw;
	border-top-left-radius: 0.3vw;
	width: 220px;
	padding-top: 7px;
	padding-right: 7px;
	padding-left: 7px;
	height: 20%;
}

.car-container {
	height: 2.5vh;
	display: flex;
	justify-content: space-between;
}

.fuel-select-box {
	width: 70%;
}

.fuel-select {
	display: flex;
	justify-content: space-between;
}

.fuel {
	border: 1px solid #CCCCCC;
	width: 20%;
	font-size: 11px;
}

.result-container {
	height: 15vh;
	margin-bottom: 0.5vh;
}

}
.result-box {
	background-color: #E5F5EB;
	width: 100%;
	height: 50%;
	display: flex;
	padding: 0.5vw;
}

.submit {
	height: 30%;
}

#submitBtn {
	background-color: green;
	color: white;
	font-weight: bold;
	border-radius: 0.2vw;
	border: 0px;
	width: 8%;
}
</style>
</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="carbonCal-container">
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

		<div class="ww"></div>

		<div class="co2-box">
			<div class="usage-group">
				<div class="inputUsage-box">
					<div class="input-box">
						<div class="fuel-img">
							<img src="image/electric.png">
						</div>
						<span>전기</span>
					</div>
					<div class="output-box">
						<div class="inAndOut-box justify-content-between">
							<div class="inputUsage">
								<span class="span">전기 사용량</span> <input class="input"
									onchange="co2Emission()" type="number" id="inputElectric"
									placeholder="숫자 입력..."> <span>kwh/월</span>
							</div>
							<div class="outputCo2">
								<span class="span">CO₂ 발생량</span> <input class="input"
									id="outputElectric" disabled="disabled"> <span>kg/월</span>
							</div>
						</div>
						<div
							class="explain-box d-flex align-items-end justify-content-end">
							<span>전기 CO₂ 발생량 | (전기 사용량 * 0.4781)</span>
						</div>
					</div>
				</div>
				<div class="inputUsage-box">
					<div class="input-box">
						<div class="fuel-img">
							<img src="image/gas.jpg">
						</div>
						<span>가스</span>
					</div>
					<div class="output-box">
						<div class="inAndOut-box justify-content-between">
							<div class="inputUsage">
								<span class="span">가스 사용량</span> <input class="input"
									onchange="co2Emission()" type="number" id="inputGas"
									placeholder="숫자 입력..." style="text-align: right;"> <span>m³/월</span>
							</div>
							<div class="outputCo2">
								<span class="span">CO₂ 발생량</span> <input class="input"
									id="outputGas" disabled="disabled"> <span>kg/월</span>
							</div>
						</div>
						<div
							class="explain-box d-flex align-items-end justify-content-end">
							<span>가스 CO₂ 발생량 | (가스 사용량 * 2.176)</span>
						</div>
					</div>
				</div>
			</div>
			<div class="usage-group">
				<!-- 연료 종류에 따른 co2 발생량 -->
				<div class="inputUsage-box">
					<div class="input-box">
						<div class="fuel-img">
							<img src="image/traffic.png">
						</div>
						<span>교통</span>
					</div>
					<div class="output-box">
						<div class="inAndOut-box justify-content-between">
							<div class="car-container d-flex">
								<div class="car">
									<span class="span">승용차 종류</span>
								</div>
								<div class="fuel-select-box">
									<div class="fuel-select d-flex">
										<div class="fuel">
											<input type="radio" name="fuelType"> <label>휘발유</label>
										</div>
										<div class="fuel">
											<input type="radio" name="fuelType"> <label>경유</label>
										</div>
										<div class="fuel">
											<input type="radio" name="fuelType"> <label>LPG</label>
										</div>
										<div class="fuel">
											<input type="radio" name="fuelType"> <label>승용차
												없음</label>
										</div>

									</div>
								</div>
							</div>
							<div class="inputUsage">
								<span class="span">이동 거리</span> <input class="input"
									type="number" id="inputFuel" placeholder="숫자 입력..."
									onchange="co2Emission()" style="text-align: right;"> <span>km/월</span>
							</div>
							<div class="outputCo2">
								<span class="span">CO₂ 발생량</span> <input class="input"
									id="outputGas" disabled="disabled"> <span>kg/월</span>
							</div>
						</div>
						<div
							class="explain-box d-flex flex-column align-items-end justify-content-end">
							<span>교통 CO₂ 발생량 | 휘발유 : (이동거리 / 16.04 * 2.097)</span> <span>
								경유 : (이동거리 / 15.35 * 2.582) LPG : (이동거리 / 11.06 * 1.868) </span>
						</div>
					</div>
				</div>
				<!-- 폐기물 사용량 -->
				<div class="inputUsage-box">
					<div class="input-box">
						<div class="fuel-img">
							<img src="image/garbage.png">
						</div>
						<span>폐기물</span>
					</div>
					<div class="output-box">
						<div class="inAndOut-box justify-content-between">
							<div class="inputUsage">
								<span class="span">폐기물 사용량</span> <input class="input"
									onchange="co2Emission()" type="number" id="inputGarbage"
									placeholder="숫자 입력..." style="text-align: right;"> <span>kg/월</span>
							</div>
							<div class="outputCo2">
								<span class="span">CO₂ 발생량</span> <input class="input"
									id="outputGarbage" disabled="disabled"> <span>kg/월</span>
							</div>
						</div>
						<div
							class="explain-box d-flex flex-column align-items-end justify-content-end">
							<span style="visibility: hidden;">가 </span> <span>생활 폐기물
								CO₂ 발생량 | (폐기물 사용량 * 0.5573)</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- co2 발생량 합계 및 제출 -->
		<article class="result-container">
			<div class="co2-usage d-flex justify-content-center">
				<span>전체 에너지원 CO₂ 발생 합계</span>
			</div>
			<div class="result-box align-items-center">
				<div class="co2-usage-group">
					<span class="span">CO₂ 발생량</span> <input class="input"
						onchange="co2Emission()" id="allUsage" disabled="disabled">
					<span>kg/월</span>
				</div>
			</div>
			<!-- 계산한 결과를 세션에 저장 후 이동 -->
			<div class="submit d-flex justify-content-end align-items-end">
				<form id="submitForm"
					action="${pageContext.request.contextPath }/carbonCalResultView">
					<button id="submitBtn" type="button">제출하기</button>
				</form>
			</div>
		</article>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
		document.querySelectorAll('.inputUsage-box').forEach(box => {
		    box.addEventListener('click', () => {
		        // 이전에 클릭된 요소에서 'clicked' 클래스를 제거
		        document.querySelectorAll('.inputUsage-box').forEach(otherBox => {
		            otherBox.classList.remove('clicked');
		        });
		        
		        // 현재 클릭한 요소에 'clicked' 클래스 추가
		        box.classList.add('clicked');
		    });
		});
	
		function co2Emission()  {
			/* 전기 CO₂ 발생량 계산 */
			const v_inputElectric = document.getElementById('inputElectric').value;
			const resultElectricCo2 = v_inputElectric * 0.4781
			const result = Math.floor(resultElectricCo2 * 100000);
			const result2 = result / 100000;
			document.getElementById("outputElectric").value = result2;
			
			// 가스 CO₂ 발생량 계산
		    const v_inputGas = document.getElementById('inputGas').value;
	        const resultGasCo2 = v_inputGas * 2.176;
	        const roundedGasCo2 = Math.round(resultGasCo2 * 100000) / 100000;
	        document.getElementById("outputGas").value = roundedGasCo2;
	
		    // 교통 CO₂ 발생량 계산 (승용차 종류 선택에 따라)
		    const v_inputFuel = document.getElementById('inputFuel').value;
		    const selectedFuelType = document.querySelector('input[name="fuelType"]:checked');
		    let resultFuelCo2 = 0;
	
		    if (selectedFuelType && v_inputFuel) {
		        const fuelType = selectedFuelType.nextElementSibling.textContent.trim();
		        if (fuelType === '휘발유') {
		            resultFuelCo2 = (v_inputFuel / 16.04) * 2.097;
		        } else if (fuelType === '경유') {
		            resultFuelCo2 = (v_inputFuel / 15.35) * 2.582;
		        } else if (fuelType === 'LPG') {
		            resultFuelCo2 = (v_inputFuel / 11.06) * 1.868;
		        }
		        const roundedFuelCo2 = Math.round(resultFuelCo2 * 100000) / 100000;
		        document.getElementById("outputFuel").value = roundedFuelCo2;
		    }
	
		    // 폐기물 CO₂ 발생량 계산
		    const v_inputGarbage = document.getElementById('inputGarbage').value;
	        const resultGarbageCo2 = v_inputGarbage * 0.5573;
	        const roundedGarbageCo2 = Math.round(resultGarbageCo2 * 100000) / 100000;
	        document.getElementById("outputGarbage").value = roundedGarbageCo2;
	
		    // 전체 CO₂ 발생량 계산 (각 항목의 배출량 합산)
		    
			const totalCo2 = (parseFloat(document.getElementById("outputElectric").value) || 0) +
		                 (parseFloat(document.getElementById("outputGas").value) || 0) +
		                 /* (parseFloat(document.getElementById("outputFuel").value) || 0) + */
		                 (parseFloat(document.getElementById("outputGarbage").value) || 0);
		    
		    // 전체 CO₂ 발생량 출력
		    document.getElementById("allUsage").value = totalCo2
		}
	
		document.getElementById('submitBtn').addEventListener('click', ()=>{
			/* 사용자가 사용량을 입력하지 못하면 알람창을 띄우고 다시 돌아감 */
			if(document.getElementById("outputElectric").value == null || document.getElementById("outputElectric").value == 0){
				alert("전기 사용량을 입력해주세요.");
				return;
			}
			console.log(document.getElementById("outputElectric").value)
			console.log(document.getElementById("outputElectric"))
			if(document.getElementById("outputGas").value == null || document.getElementById("outputGas").value == 0){
				alert("가스 사용량을 입력해주세요.");
				return;
			}
			
			if(document.getElementById("outputGarbage").value == null || document.getElementById("outputGarbage").value == 0){
				alert("폐기물 사용량을 입력해주세요.");
				return;
			}
			
			if(confirm("결과창으로 이동하시겠습니까?")){
				/* 기존에 존재하던 아이템들 삭제 */
				sessionStorage.removeItem("resultE");
				sessionStorage.removeItem("resultGas");
				sessionStorage.removeItem("resultGar");
				
				/* 새롭게 사용자가 입력한 결과를 sessionStorage에 저장후 submit */
				sessionStorage.setItem("resultE", document.getElementById("outputElectric").value);
				sessionStorage.setItem("resultGas", document.getElementById("outputGas").value);
				sessionStorage.setItem("resultGar", document.getElementById("outputGarbage").value);
				console.log(document.getElementById("outputTraffic"))
				/* sessionStorage.setItem("resultT", document.getElementById("outputTraffic").value); */
				console.log(document.getElementById("submitForm"));
				document.getElementById("submitForm").submit();
			}
		});
	</script>
</body>
</html>