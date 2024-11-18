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
</style>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="radiation-container">
		<div class="d-flex">
			<div class="radiation-title w-50">
				<h1 style="color: green; font-weight: bold;">태양광 발전량 모의 예측</h1>
				<span style="font-size: 0.7vw;">건물의 건축 면적에 해당하는 태양광 패널을 설치한다면 얼마나 전기가 생산될까요?</span>
			</div>
			<div class="w-50 d-flex align-items-center justify-content-end">
				<a class="home-go" href="${pageContext.request.contextPath }">
					<img class="home-go-img" src="${pageContext.request.contextPath}/resources/image/home.png">
					<span>홈으로 이동</span>
				</a>
			</div>
		</div>
		<div class="d-flex flex-column justify-content-center align-items-center" style="margin-top: 30px; margin-bottom: 100px;">
			<div class="mt-3 mb-3 d-flex justify-content-start" style="width:100%">
				<input id="searchInput" class="form-control me-3" type="text" style="width:60%" placeholder="지번 주소나 도로명 주소 입력">
			</div>
			<div class="position-relative" style="width: 1200px; height: 600px;">
				<div class="position-absolute" id="map" style="width: 1200px; height: 600px; padding: 0, margin:0;"></div>
				<div id="solarRadiationResult" class="position-absolute bg-white overflow-hidden" style="z-index: 101; transition-duration: 0.4s; width: 0px; height: 600px; right: 0px;">
					<div class="bg-primary d-flex align-items-center" style="height: 50px; width: 300px;">
						<span class="fs-4 fw-bold text-white ms-2">태양광 발전량 모의 예측</span>
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
		</c:forEach>
		
		for(var i = 0, ii = data.length; i < ii; i++){
			let spot = data[i]
			let latlng = new naver.maps.LatLng(spot.buildingLatitude,spot.buildingLongitude)
			let marker = new naver.maps.Marker({
				position: latlng,
				drabbable: true
			})
			
			markers.push(marker)
			
			let infoWindow = new naver.maps.InfoWindow({
				content:'<div style="width:200px; text-align:center; padding:10px;"<b>'+ spot.buildingAddressRoad +'</b><br></div>'
			})
			
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
		
		function getClickHandler(seq){
			return function(e){
				let marker = markers[seq]
				let infoWindow = infoWindows[seq]
				
				if (infoWindow.getMap()){
					solarRadiationResult.style.width = "0px"
					infoWindow.close();
				}else{
					solarRadiationResult.style.width = "300px"
					map.panTo(marker.position)
					infoWindow.open(map,marker)
					$.ajax({
						type:'POST',
						url: "<c:url value='/getElectricUsage' />",
						data: { "buildingNo": data[seq].buildingNo},
						success: function(result){
							console.log(result)
						}
					})
				}
			}
		}
		
		for(let i = 0, ii = markers.length; i <ii; i++){
			naver.maps.Event.addListener(markers[i],"click",getClickHandler(i))
		}
		
		const v_searchInput = document.getElementById("searchInput")
		
		v_searchInput.addEventListener("input",()=>{
			
		})
	</script>
</body>

</html>