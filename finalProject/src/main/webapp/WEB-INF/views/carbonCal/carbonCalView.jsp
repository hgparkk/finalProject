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
	max-width: 1340px;
	min-width: 500px;
}

.usage-group{
	display: flex;
	justify-content: space-between;
}

.inputUsage-box {
	border: 1px solid #CCCCCC;
	border-radius: 0.5vw;
	width: 49.5%;
	height: 25vw;
	margin-bottom: 3vh;
	display: inline-block;
}

.inputUsage {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.outputCo2 {
	display: flex;
	justify-content: space-between;
	align-items: center;
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
	width: 6vw;
}

.input {
	width: 16vw;
	height: 2.5vw;
	padding: 0.2vw;
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
	padding: 5px;
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

.result-box {
	background-color: #E5F5EB;
	width: 100%;
	height: 45%;
	display: flex;
	padding: 0.5vw;
}

.empty2{
	height: 5%
}

#submitForm{
	width: 100%;
	text-align: right;
	height: 3vh;
}

#submitBtn {
	background-color: green;
	color: white;
	font-weight: bold;
	border-radius: 0.2vw;
	border: 0px;
	width: 8%;
	height: 100%;
}
</style>
</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div>${keyCoefficientList }</div>
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
											<input type="radio" name="fuelType" id="gasoline" value="0"
												checked> <label for="gasoline">휘발유</label>
										</div>
										<div class="fuel">
											<input type="radio" name="fuelType" id="diesel" value="1">
											<label for="diesel">경유</label>
										</div>
										<div class="fuel">
											<input type="radio" name="fuelType" id="lpg" value="2">
											<label for="lpg">LPG</label>
										</div>
										<div class="fuel">
											<input type="radio" name="fuelType" id="noCar" value="3">
											<label for="noCar">승용차 없음</label>
										</div>

									</div>
								</div>
							</div>
							<div class="inputUsage">
								<span class="span">이동 거리</span> <span id="selectedFuel"></span>
								<input class="input" type="number" id="inputFuel"
									placeholder="숫자 입력..." onchange="co2Emission()"
									style="text-align: right;"> <span>km/월</span>
							</div>
							<div class="outputCo2">
								<span class="span">CO₂ 발생량</span> <input class="input"
									id="outputFuel" disabled="disabled"> <span>kg/월</span>
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
			<div class="empty2"></div>
			<div>
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
	
	/* 페이지가 로드되자마자 실행되는 함수 */
	document.addEventListener("DOMContentLoaded", function() {
        const inputFuelField = document.getElementById('inputFuel');
        const radioButtons = document.querySelectorAll('input[name="fuelType"]');
        
        // 페이지가 로드될 때, '승용차 없음'이 선택된 경우 inputFuel을 비활성화
        const selectedFuelType = document.querySelector('input[name="fuelType"]:checked');
        
        if (selectedFuelType && selectedFuelType.id === 'noCar') {
            inputFuelField.disabled = true;
            inputFuelField.value = '';  // '승용차 없음'일 때 값도 초기화
        } else {
            inputFuelField.disabled = false;
        }

        // 라디오 버튼 변경 시마다 inputFuel 활성화/비활성화 및 CO₂ 발생량 계산
        radioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', function() {
                const selectedFuelType = document.querySelector('input[name="fuelType"]:checked');
                if (selectedFuelType && selectedFuelType.id === 'noCar') {
                    // '승용차 없음' 선택 시 inputFuel 필드를 비활성화
                    inputFuelField.disabled = true;
                    inputFuelField.value = 0;  // 값도 초기화
                } else {
                    // 다른 연료 선택 시 inputFuel 필드를 활성화
                    inputFuelField.disabled = false;
                }
                co2Emission();  // CO₂ 발생량 계산
            });
        });

        // 기본적으로 "휘발유" 라디오 버튼이 체크된 상태로 설정
        const defaultFuelType = document.getElementById('gasoline');
        if (defaultFuelType) {
            defaultFuelType.checked = true;
        }
    });
	
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
		    let v_inputFuel = document.getElementById('inputFuel').value;
		    const selectedFuelType = document.querySelector('input[name="fuelType"]:checked');
		    let resultFuelCo2 = 0;
		    
		    /* 원하는 연료 선택 */
		    if (selectedFuelType && v_inputFuel) {
		        const fuelType = selectedFuelType.nextElementSibling.textContent.trim();
		        if (fuelType === '휘발유') {
		            resultFuelCo2 = (v_inputFuel / 16.04) * 2.097;
		        } else if (fuelType === '경유') {
		            resultFuelCo2 = (v_inputFuel / 15.35) * 2.582;
		        } else if (fuelType === 'LPG') {
		            resultFuelCo2 = (v_inputFuel / 11.06) * 1.868;
		        }
		    }
		    
		    const roundedFuelCo2 = Math.round(resultFuelCo2 * 100000) / 100000;
	        document.getElementById("outputFuel").value = roundedFuelCo2;
		    
		    /* 승용차 없음 선택하면 outputFuel 비움 */
		    if(selectedFuelType.nextElementSibling.textContent.trim() == '승용차 없음'){
		    	document.getElementById("outputFuel").value = 0;
	        }
		    
		    // 폐기물 CO₂ 발생량 계산
		    const v_inputGarbage = document.getElementById('inputGarbage').value;
	        const resultGarbageCo2 = v_inputGarbage * 0.5573;
	        const roundedGarbageCo2 = Math.round(resultGarbageCo2 * 100000) / 100000;
	        document.getElementById("outputGarbage").value = roundedGarbageCo2;
	        
		    // 전체 CO₂ 발생량 계산 (각 항목의 배출량 합산)
			const totalCo2 = (parseFloat(document.getElementById("outputElectric").value) || 0) +
		                 (parseFloat(document.getElementById("outputGas").value) || 0) +
		                 (parseFloat(document.getElementById("outputFuel").value) || 0) +
		                 (parseFloat(document.getElementById("outputGarbage").value) || 0);
		    
		    // 전체 CO₂ 발생량 출력
		    document.getElementById("allUsage").value = totalCo2
		}
	
		document.getElementById('submitBtn').addEventListener('click', ()=>{
			const selectedFuelType = document.querySelector('input[name="fuelType"]:checked');
			let v_inputFuel = document.getElementById('inputFuel').value
			
			if(selectedFuelType.nextElementSibling.textContent.trim() != '승용차 없음'){
				if(document.getElementById("outputElectric").value == 0 && document.getElementById("outputGas").value == 0 && document.getElementById("outputGarbage").value == 0){
					alert("사용량을 입력해주세요.");
					return;
				}
				if(v_inputFuel == 0){
					alert("이동거리를 입력해주세요")
					return;
				}
			}else{
				if(document.getElementById("outputElectric").value == 0 && document.getElementById("outputGas").value == 0 && document.getElementById("outputGarbage").value == 0){
					alert("사용량을 입력해주세요.");
					return;
				}
				v_inputFuel = 0;
			}
			
			
			if(confirm("결과창으로 이동하시겠습니까?")){
				/* 기존에 존재하던 아이템들 삭제 */
				sessionStorage.removeItem("resultElec");
				sessionStorage.removeItem("resultGas");
				sessionStorage.removeItem("resultGar");
				sessionStorage.removeItem("resultTrf");
				sessionStorage.removeItem("resultTrfType");
				
				/* 새롭게 사용자가 입력한 결과를 sessionStorage에 저장후 submit */
				sessionStorage.setItem("resultElec", document.getElementById("inputElectric").value);
				sessionStorage.setItem("resultGas", document.getElementById("inputGas").value);
				sessionStorage.setItem("resultGar", document.getElementById("inputGarbage").value);
				sessionStorage.setItem("resultTrf", v_inputFuel);
				sessionStorage.setItem("resultTrfType", document.querySelector('input[name="fuelType"]:checked').nextElementSibling.textContent.trim());
				document.getElementById("submitForm").submit();
			}
		});
	</script>
</body>
</html>