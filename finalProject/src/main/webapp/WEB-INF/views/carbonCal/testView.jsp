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
	
	<div>${keyGetHtac[1] }</div>
	<div>${keyGetHtac[0]['htacHouseType'] }</div>
	<div>${keyGetHtac.size() }</div>
	
	<div>${sessionStorage.getItem("selectMember") }</div>
	<div>${sessionStorage.getItem("selectArea") }</div>
	<div>${sessionStorage.getItem("selectType") }</div>
	
	<div id="key">
	
	</div>

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
	</div>

	<!-- 주거 형태 -->
	<div class="house">
		<span class="span">주거 형태</span>
	</div>
	<div class="house-type-select-box">
		<div class="house-type-select d-flex">
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type1"
					value="아파트" checked> <label for="housing_type1">아파트</label>
			</div>
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type2"
					value="단독주택"> <label for="housing_type2">단독주택</label>
			</div>
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type3"
					value="연립 및 다세대주택"> <label for="housing_type3">연립 및
					다세대</label>
			</div>
			<div class="house-type">
				<input type="radio" name="housing_type" id="housing_type4"
					value="기타"> <label for="housing_type4">기타</label>
			</div>
		</div>
	</div>
	
	<!-- 거주 면적 -->
	<div class="area">
		<span class="span">거주면적</span>
	</div>
	<div class="resdential-area-select-box">
		<div class="resdential-area-select d-flex">
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea1"
					value="~33㎡ 이하" checked> <label for="resdentialArea1">~33㎡
					이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea2"
					value="33㎡ 초과 ~ 66㎡ 이하"> <label for="resdentialArea2">33㎡
					초과 ~ 66㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea3"
					value="66㎡ 초과 ~ 99㎡ 이하"> <label for="resdentialArea3">66㎡
					초과 ~ 99㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea4"
					value="99㎡ 초과 ~ 132㎡ 이하"> <label for="resdentialArea4">99㎡
					초과 ~ 132㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea5"
					value="132㎡ 초과~"> <label for="resdentialArea5">132㎡
					초과~</label>
			</div>
		</div>
	</div>

	<!-- 가구원 수 -->
	<div class="member">
		<span class="span">거주인원</span>
	</div>
	<div class="house-member-select-box">
		<div class="house-member-select d-flex">
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember1"
					value="1명" checked> <label for="livingMember1">1명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember2"
					value="2명"> <label for="livingMember2">2명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember3"
					value="3명"> <label for="livingMember3">3명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember4"
					value="4명"> <label for="livingMember4">4명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember5"
					value="5명"> <label for="livingMember5">5명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember6"
					value="6명 이상"> <label for="livingMember6">6명 이상</label>
			</div>
		</div>
	</div>
	
	<div style="display:hidden;">
		<div id="type"></div>
		<div id="area"></div>
		<div id="member"></div>
	</div>
	
	<button type="button" id="resultBtn">결과 보기</button>

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
	const htRadioButtons = document.querySelectorAll('input[name="housing_type"]');
    const RaRadioButtons = document.querySelectorAll('input[name="resdentialArea"]');
    const HhRadioButtons = document.querySelectorAll('input[name="livingMember"]');
    
    // 주거형태 선택
    htRadioButtons.forEach(radioButton => {
        radioButton.addEventListener('change', function() {
            const selectedHousingType = document.querySelector('input[name="housing_type"]:checked');
            console.log(selectedHousingType.nextElementSibling.textContent.trim())
            document.getElementById("type").textContent = selectedHousingType.nextElementSibling.textContent.trim()
        });
    });
    
 	// 거주면적 선택
    RaRadioButtons.forEach(radioButton => {
        radioButton.addEventListener('change', function() {
            const selectedResidentialArea = document.querySelector('input[name="resdentialArea"]:checked');
            console.log(selectedResidentialArea.nextElementSibling.textContent.trim())
            document.getElementById("area").textContent = selectedResidentialArea.nextElementSibling.textContent.trim()
        });
    });
    
 	// 가구원수 선택
    HhRadioButtons.forEach(radioButton => {
        radioButton.addEventListener('change', function() {
            const selectedHousehold = document.querySelector('input[name="livingMember"]:checked');
            console.log(selectedHousehold.nextElementSibling.textContent.trim())
            document.getElementById("member").textContent = selectedHousehold.nextElementSibling.textContent.trim()
        });
    });
 	
    document.querySelectorAll('input[name="housing_type"]').forEach(radio => {
    	  radio.addEventListener('change', function() {
    	    if (this.value === '아파트') {
    	      document.getElementById('result').textContent = '${keyGetHtac[0]}';
    	    }
    	  });
    	});
    
    document.getElementById("resultBtn").addEventListener('click', ()=>{
    	sessionStorage.removeItem("selectType");
		sessionStorage.removeItem("selectArea");
		sessionStorage.removeItem("selectMember");
		
		sessionStorage.setItem("selectType", document.getElementById("type").textContent);
		sessionStorage.setItem("selectArea", document.getElementById("area").textContent);
		sessionStorage.setItem("selectMember", document.getElementById("member").textContent);
		
    })
    
	for(let i = 0; i < ${keyGetHtac.size()}; i++ ){
		document.getElementById("id").textContent = ${keyGetHtac[i]}
	};
    
    </script>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
