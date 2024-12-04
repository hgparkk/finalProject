<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.radiation-container {
	width: 100%;
	max-width: 1300px;
	min-width: 500px;
	justify-content: center;
	margin: auto;
	padding-left: 2vw;
	padding-right: 2vw;
}

.radiation-title {
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

.home-go-img {
	width: 1vw;
	height: 1vw;
}

.searchedResult {
	position: absolute;
	z-index: 100;
	width: 57%;
	overflow-y: auto;
	max-height: 200px;
}

.searchedResultShow {
	border: 1px solid gray;
	background-color: white;
}

.selectDiv {
	cursor: pointer;
}

.selectDiv:hover {
	background-color: #f0f0f0;
}

.result-text {
	height: 28px;
	line-height: 28px;
}

.result-text-2 {
	height: 56px;
	line-height: 56px;
}

.result-input {
	width: 150px;
	height: 28px;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="radiation-container">
		<div class="d-flex">
			<div class="radiation-title w-75">
				<h1 style="color: green; font-weight: bold;">대전 광역시 태양광 발전량 모의 예측</h1>
				<span style="font-size: 0.7vw;">대전 광역시의 건물의 건축 면적에 해당하는 태양광 패널을 설치한다면 얼마나 전기가 생산될까요?</span>
			</div>
			<div class="w-25 d-flex align-items-center justify-content-end">
				<a class="home-go" href="${pageContext.request.contextPath }">
					<img class="home-go-img" src="${pageContext.request.contextPath}/resources/image/home.png">
					<span>홈으로 이동</span>
				</a>
			</div>
		</div>
		<div class="d-flex flex-column justify-content-center align-items-center" style="margin-top: 30px; margin-bottom: 100px;">
			<div class="mt-3 mb-3 d-flex justify-content-start" style="width: 100%">
				<div style="width: 60%">
					<input id="searchInput" class="form-control me-3" type="text" placeholder="지번 주소나 도로명 주소 입력">
					<div id="autocomplete" class="searchedResult"></div>
				</div>
			</div>
			<div class="position-relative" style="width: 1200px; height: 600px;">
				<div class="position-absolute" id="map" style="width: 1200px; height: 600px; padding: 0, margin:0;"></div>
				<div id="solarRadiationResult" class="position-absolute bg-white overflow-x-hidden overflow-y-scroll" style="z-index: 101; transition-duration: 0.4s; width: 0px; height: 600px; right: 0px;">
					<div class="bg-primary d-flex align-items-center" style="height: 50px; width: 400px;">
						<span class="fs-4 fw-bold text-white ms-2">태양광 발전량 모의 예측</span>
					</div>
					<div class="d-flex" style="width: 400px;">
						<div class="d-flex flex-column">
							<span class="ms-4 mt-3 result-text">건축 면적</span>
							<span class="ms-4 mt-3 result-text">전기 사용량</span>
							<span class="ms-4 mt-3 result-text">단위 면적당</span>
							<span class="ms-4 result-text">전기 사용량</span>
							<span class="ms-4 mt-3 result-text">
								CO<sub>2</sub> 배출량
							</span>
						</div>
						<div class="d-flex flex-column">
							<span class="ms-4 mt-3 result-text">&nbsp;‏‎</span>
							<span class="ms-4 mt-3 result-text">약</span>
							<span class="ms-4 mt-3 result-text">약</span>
							<span class="ms-4 result-text"></span>
							<span class="ms-4 mt-3 result-text">약</span>
						</div>
						<div class="d-flex flex-column">
							<span class="mt-3 ms-1 result-text">
								<input id="buildingAreaInput" class="result-input" readonly>
							</span>
							<span class="mt-3 ms-1 result-text">
								<input id="buildingElectricUsage" class="result-input" readonly>
							</span>
							<span class="mt-3 ms-1 result-text">
								<input id="areaElectricUsage" class="result-input" readonly>
							</span>
							<span class="ms-1 result-text"> </span>
							<span class="mt-3 ms-1 result-text">
								<input id="buildingCO2Emission" class="result-input" readonly>
							</span>
						</div>
						<div class="d-flex flex-column">
							<span class="mt-3 ms-1 result-text">㎡</span>
							<span class="mt-3 ms-1 result-text">kWh</span>
							<span class="mt-3 ms-1 result-text">kWh</span>
							<span class="ms-1 result-text"></span>
							<span class="mt-3 ms-1 result-text">kgCO2eq</span>
						</div>
					</div>
					<div style="margin-top: 50px; width: 400px;">
						<span class="ms-4 mb-3">이 건물에서 배출된 이상화탄소 배출량은</span>
						<img src="assets/car.png" style="width: 380px;">
						<span class="ms-4 mt-3">
							승용차 1대가
							<span id="carCarbonEmission"></span>
							km 이동 할 때 배출하는 이산화 탄소 배출량과 동일합니다.
						</span>
					</div>
					<div class="d-flex" style="margin-top: 25px; width: 400px;">
						<div class="d-flex flex-column">
							<span class="ms-4 mt-3 result-text">연 합계 전천 일사량</span>
						</div>
						<div class="d-flex flex-column">
							<span class="mt-3 ms-1 result-text">
								<input id="totalSolarRadiation" class="result-input" readonly>
							</span>
						</div>
						<div class="d-flex flex-column">
							<span class="mt-3 ms-1 result-text">kWh/㎡</span>
						</div>
					</div>
					<div class="d-flex" style="margin-top: 25px; width: 400px;">
						<div class="d-flex flex-column">
							<span class="ms-5 mt-3 result-text">태양광 패널 효율에 따른 전력 발전량</span>
						</div>
					</div>
					<div class="accordion accordion-flush" id="generationAccordion" style="margin-top: 25px; margin-bottom: 25px; width: 400px;">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">18%</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#generationAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">19%</button>
							</h2>
							<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#generationAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">20%</button>
							</h2>
							<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#generationAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">21%</button>
							</h2>
							<div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#generationAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">22%</button>
							</h2>
							<div id="flush-collapseFive" class="accordion-collapse collapse" data-bs-parent="#generationAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
		var map = new naver.maps.Map("map", {
			zoom : 12,
			center : new naver.maps.LatLng(36.3504119, 127.3845475),
			zommControl: true,
			zoomControlOptions: {
				position: naver.maps.Position.TOP_LEFT,
				style: naver.maps.ZoomControlStyle.SMALL
			}
		});
		
		const solarRadiationResult = document.getElementById("solarRadiationResult")

		var markers = []
		var infoWindows = []

		let data = []
		
		let dataList = []

		<c:forEach items="${buildingList}" var="building">
		recentData = {
			"buildingNo" : ${building.buildingNo} ,
			"buildingAddressLot" : "${building.buildingAddressLot}" ,
			"buildingAddressRoad" : "${building.buildingAddressRoad}" ,
			"buildingArea" : ${building.buildingArea} ,
			"buildingLatitude" : ${building.buildingLatitude} ,
			"buildingLongitude" : ${building.buildingLongitude}
		}
		
		data.push(recentData)
		dataList.push(recentData.buildingAddressLot)
		dataList.push(recentData.buildingAddressRoad)
		</c:forEach>
		
		for(var i = 0, ii = data.length; i < ii; i++){
			let spot = data[i]
			let latlng = new naver.maps.LatLng(spot.buildingLatitude,spot.buildingLongitude)
			let marker = new naver.maps.Marker({
				position: latlng,
				drabbable: true
			})
			
			markers.push(marker)
			
			let infoWindow
			if(spot.buildingAddressRoad != " "){
				infoWindow = new naver.maps.InfoWindow({
					content:'<div style="width:200px; text-align:center; padding:10px;"><b>'+ spot.buildingAddressRoad +'</b><br></div>'
				})
			}else{
				infoWindow = new naver.maps.InfoWindow({
					content:'<div style="width:200px; text-align:center; padding:10px;"><b>'+ spot.buildingAddressLot +'</b><br></div>'
				})
			}
			
			infoWindows.push(infoWindow)
		}

		var htmlMarker1 = {
			content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/image/mapIcons/cluster-marker-1.png);background-size:contain;"></div>',
			size : N.Size(40, 40),
			anchor : N.Point(20, 20)
		}, htmlMarker2 = {
			content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/image/mapIcons/cluster-marker-2.png);background-size:contain;"></div>',
			size : N.Size(40, 40),
			anchor : N.Point(20, 20)
		}, htmlMarker3 = {
			content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/image/mapIcons/cluster-marker-3.png);background-size:contain;"></div>',
			size : N.Size(40, 40),
			anchor : N.Point(20, 20)
		}, htmlMarker4 = {
			content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/image/mapIcons/cluster-marker-4.png);background-size:contain;"></div>',
			size : N.Size(40, 40),
			anchor : N.Point(20, 20)
		}, htmlMarker5 = {
			content : '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/image/mapIcons/cluster-marker-5.png);background-size:contain;"></div>',
			size : N.Size(40, 40),
			anchor : N.Point(20, 20)
		};

		var markerClustering = new MarkerClustering({
			minClusterSize : 2,
			maxZoom : 20,
			map : map,
			markers : markers,
			disableClickZoom : false,
			gridSize : 120,
			icons : [ htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4,
					htmlMarker5 ],
			indexGenerator : [ 10, 100, 200, 500, 1000 ],
			stylingFunction : function(clusterMarker, count) {
				$(clusterMarker.getElement()).find('div:first-child').text(
						count)
			}
		})
		
		// 마커를 클릭했을 때 이벤트
		function getClickHandler(seq){
			return function(e){
				let marker = markers[seq]
				let infoWindow = infoWindows[seq]
				
				if (infoWindow.getMap()){
					solarRadiationResult.style.width = "0px"
					infoWindow.close();
				}else{
					solarRadiationResult.style.width = "400px"
					map.panTo(marker.position)
					infoWindow.open(map,marker)
					$.ajax({
						type:'POST',
						url: "<c:url value='/getElectricUsage' />",
						data: { "buildingNo": data[seq].buildingNo},
						success: function(result1){
							document.getElementById("buildingAreaInput").value = data[seq].buildingArea
							let sum = 0
							for (let i = 0; i <result1.length; i ++){
								sum += result1[i].beuElectric
							}
							document.getElementById("buildingElectricUsage").value = Math.round(((sum / result1.length) * 12) * 10000) / 10000
							if(data[seq].buildingArea!=0){
								document.getElementById("areaElectricUsage").value = Math.round((((sum / result1.length) * 12)/data[seq].buildingArea)*10000)/10000
							}else{
								document.getElementById("areaElectricUsage").value = 0
							}
							$.ajax({
								type:'POST',
								url: "<c:url value='/getEmission' />",
								data: { "coefficientName": "전기 CO2 발생량"},
								success: function(result2){
									document.getElementById("buildingCO2Emission").value = Math.round((document.getElementById("buildingElectricUsage").value * result2.coefficientValue) * 10000) / 10000
									$.ajax({
										type:'POST',
										url: "<c:url value='/getEmission' />",
										data: { "coefficientName": "자동차 거리당 CO2 발생량"},
										success: function(result){
											document.getElementById("carCarbonEmission").innerHTML = Math.round((document.getElementById("buildingCO2Emission").value * result.coefficientValue) * 10000) / 10000
										}
									})
									$.ajax({
										type:'POST',
										url: "http://192.168.0.49:5000/getSolarRadiationPred",
										data: JSON.stringify({ "year": "2024"}),
										contentType: "application/json",
										success: function(result3){
											srRadiation = []
											let sum = 0
											for (let i = 0; i < result3.length; i++){
												sum += result3[i].srRadiation
												srRadiation.push(result3[i].srRadiation)
											}
											document.getElementById("totalSolarRadiation").value = Math.round(sum * 10000) / 10000
											let accordions = ["flush-collapseOne","flush-collapseTwo","flush-collapseThree","flush-collapseFour","flush-collapseFive"]
											let efficiencys = [18,19,20,21,22]
											for(let i = 0 ; i<accordions.length; i++){
												const canvasDiv = document.createElement("div")
												const canvas = document.createElement("canvas")
												canvas.style.width = "360px"
												drawGraph(canvas,srRadiation,data[seq].buildingArea,efficiencys[i])
												document.getElementById(accordions[i]).children[0].innerHTML = ""
												canvasDiv.appendChild(canvas)
												document.getElementById(accordions[i]).children[0].appendChild(canvasDiv)
												sumRadiation = 0
												for(let j = 0; j<srRadiation.length; j++){
													sumRadiation += srRadiation[j]*data[seq].buildingArea*(efficiencys[i]/100)
												}
												let infoDiv = document.createElement("div")
												infoDiv.classList.add("d-flex")
												let reduce = document.getElementById("buildingCO2Emission").value - Math.round((sumRadiation * result2.coefficientValue) * 10000) / 10000
												if(reduce < 0){
													reduce = 0
												}
												infoDiv.innerHTML += '<div class="d-flex flex-column">'
												+	'<span class="mt-3 result-text">총 예상 발전량</span>'
												+	'<span class="mt-3 result-text">탄소 배출 저감량</span>'
												+	'<span class="mt-3 result-text">최종 탄소 배출량</span>'
												+	'</div>'
												+	'<div class="d-flex flex-column">'
												+	'<span class="mt-3 ms-1 result-text">'
												+	'<input class="result-input" value="'
												+ 	Math.round(sumRadiation * 10000) / 10000
												+	'" readonly>'
												+	'</span>'
												+	'<span class="mt-3 ms-1 result-text">'
												+	'<input class="result-input" value="'
												+	Math.round((sumRadiation * result2.coefficientValue) * 10000) / 10000
												+	'" readonly>'
												+	'</span>'
												+	'<span class="mt-3 ms-1 result-text">'
												+	'<input class="result-input" value="'
												+	Math.round(reduce * 10000) / 10000
												+	'" readonly>'
												+	'</span>'
												+	'</div>'
												+	'<div class="d-flex flex-column">'
												+	'<span class="mt-3 ms-1 result-text">kWh</span>'
												+	'<span class="mt-3 ms-1 result-text">kgCO2eq</span>'
												+	'<span class="mt-3 ms-1 result-text">kgCO2eq</span>'
												+	'</div>'
												document.getElementById(accordions[i]).children[0].appendChild(infoDiv)
												$.ajax({
													type:'POST',
													url: "<c:url value='/getEmission' />",
													data: { "coefficientName": "톤당 편백나무 그루수"},
													success: function(result4){
														treeDiv = document.createElement("div")
														treeDiv.classList.add("mt-3")
														treeDiv.classList.add("d-flex")
														treeDiv.innerHTML += '<img src="assets/cypress.png" style="width: 50px;">'
														treeDiv.innerHTML += '<div class="d-flex align-items-center">편백나무 '
														+ Math.round((result4.coefficientValue * (Math.round(sumRadiation * result2.coefficientValue) / 10000))*10000)/10000
														+ ' 그루를 심은 것과 같은 효과입니다.</div>'
														document.getElementById(accordions[i]).children[0].appendChild(treeDiv)
													}
												})
											}
										}
									})
								}
							})
						}
					})
				}
			}
		}
		
 		function drawGraph(canvas,solarRadiation,area,efficiency){
			let result = []
			for(let i = 0; i<solarRadiation.length; i++){
				result.push(solarRadiation[i]*area*(efficiency/100))
			}
			const lineExampleChart = new Chart(canvas,{
				type: 'line',
				data: {
					labels:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					datasets:[{
						label: '예상 월별 태양광 발전량',
						data: result,
						fill: false
					}]
				}
			})
		}
		
		for(let i = 0, ii = markers.length; i <ii; i++){
			naver.maps.Event.addListener(markers[i],"click",getClickHandler(i))
		}
		
		const v_searchInput = document.getElementById("searchInput")

		// 자동완성 결과 요소 
		const autocomplete = document.getElementById("autocomplete")

		// 입력 이벤트 리스너
		v_searchInput.addEventListener("change", ()=> {
  			const value = v_searchInput.value.trim()
  			const valueArray = value.split(/\s+/)
  			const matchedItems = dataList.filter(item => valueArray.every(valueIndex => item.toLowerCase().includes(valueIndex))
  			)
  
  			displayResults(matchedItems)
		})

		// 결과 표시 함수
		function displayResults(results) {
			let content = ""
	  		for(let i = 0; i < results.length; i++){
	  			content += '<div class="selectDiv" onclick="gotoSearchList(\''+results[i]+'\')">'+results[i]+'</div>'
	  		}
			if(results.length != 0){
				autocomplete.classList.add("searchedResultShow")
			}else{
				autocomplete.classList.remove("searchedResultShow")
			}
	  		autocomplete.innerHTML = content
		}

		// 검색 결과로 이동
		function gotoSearchList(searchWord){
			let seq = -1
			
			for(let i=0; i<data.length; i++){
				if(searchWord == data[i].buildingAddressRoad || searchWord == data[i].buildingAddressLot){
					seq = i
					break
				}
			}
			v_searchInput.value=""
			displayResults("")
			map.setZoom(20)
			setTimeout(()=>{
				naver.maps.Event.trigger(markers[seq],"click")
			},100)
		}
	</script>
</body>

</html>