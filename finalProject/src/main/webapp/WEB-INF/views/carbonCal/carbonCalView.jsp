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
	display: inline;
}

.inputUsage {
	border: 1px solid #CCCCCC;
	border-radius: 0.5vw;
	width: 40vw;
	height: 25vw;
}

.clicked {
	border-color: green;
	border-width: 0.2vw;
}

.input-box {
	display: flex;
	height: 3vw;
}

.fuel-img {
	display: flex;
	justify-content: start;
	align-items: center;
}

.fuel-img>img {
	width: 2vw;
	height: 2vw;
}

.input-box>span {
	font-size: 2vw;
	font-weight: bold;
	color: #6FADCF;
}

.output-box {
	border-top: 1px solid #CCCCCC;
	height: 22vw;
	padding: 2vw;
}

.in&out-box{
	height: 15vw;
}

.span {
	padding-right: 2vw;
}

.input {
	width: 20vw;
	height: 2.5vw;
	padding: 0.2vw;
}

.inputElectric>span {
	font-size: 1.2vw;
}

.outputCo2>span {
	font-size: 1.2vw;
}

.explain-box{
	height: 7vw;
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
			<div class="inputUsage">
				<div class="input-box">
					<div class="fuel-img">
						<img src="image/electric.png">
					</div>
					<span>전기</span>
				</div>
				<div class="output-box">
					<div class="in&out-box">
						<div class="inputElectric">
							<span class="span">전기 사용량</span> <input class="input"
								placeholder="숫자 입력..." style="text-align: right;"> <span>kwh/월</span>
						</div>
						<div class="outputCo2">
							<span class="span">CO2 발생량</span> <input class="input"
								disabled="disabled"> <span>kg/월</span>
						</div>
					</div>
					<div class="explain-box d-flex align-items-end justify-content-end">
						<span>전기 CO₂ 발생량 | (전기 사용량 * 0.4781)</span>
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