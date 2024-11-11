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
	flex-wrap: wrap; max-width : 1300px;
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
	width: 20.5vw;
	height: 2.5vw;
	padding: 0.2vw;
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
								placeholder="숫자 입력..." style="text-align: right;"> <span>kwh/월</span>
						</div>
						<div class="outputCo2">
							<span class="span">CO₂ 발생량</span> <input class="input"
								disabled="disabled"> <span>kg/월</span>
						</div>
					</div>
					<div class="explain-box d-flex align-items-end justify-content-end">
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
								placeholder="숫자 입력..." style="text-align: right;"> <span>m³/월</span>
						</div>
						<div class="outputCo2">
							<span class="span">CO₂ 발생량</span> <input class="input"
								disabled="disabled"> <span>kg/월</span>
						</div>
					</div>
					<div class="explain-box d-flex align-items-end justify-content-end">
						<span>가스 CO₂ 발생량 | (가스 사용량 * 2.176)</span>
					</div>
				</div>
			</div>
			<div class="inputUsage-box">
				<div class="input-box">
					<div class="fuel-img">
						<img src="image/traffic.png">
					</div>
					<span>교통</span>
				</div>
				<div class="output-box">
					<div class="inAndOut-box justify-content-between">
						<div class="inputUsage">
							<span class="span">이동 거리</span> <input class="input"
								placeholder="숫자 입력..." style="text-align: right;"> <span>km/월</span>
						</div>
						<div class="outputCo2">
							<span class="span">CO₂ 발생량</span> <input class="input"
								disabled="disabled"> <span>kg/월</span>
						</div>
					</div>
					<div class="explain-box d-flex align-items-end justify-content-end">
					<div class="d-flex">
						<span>교통 CO₂ 발생량 | 휘발유 : (이동거리 / 16.04 * 2.097)</span> <span>
							경유 : (이동거리 / 15.35 * 2.582) LPG : (이동거리 / 11.06 * 1.868) </span>
					</div>
					</div>
				</div>
			</div>
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
								placeholder="숫자 입력..." style="text-align: right;"> <span>kg/월</span>
						</div>
						<div class="outputCo2">
							<span class="span">CO₂ 발생량</span> <input class="input"
								disabled="disabled"> <span>kg/월</span>
						</div>
					</div>
					<div class="explain-box d-flex align-items-end justify-content-end">
						<span>생활 폐기물 CO₂ 발생량 | (폐기물 사용량 * 0.5573)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
		const v_inputUsage = document.querySelector(".inputUsage");
		v_inputUsage.addEventListener('click',()=>{
			v_inputUsage.classList.toggle('clicked');
		});
	</script>
</body>
</html>