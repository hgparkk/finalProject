<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.Year"%>
<%@ page import="java.time.Month"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>

<!-- 그래프 그리기 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

<%
java.time.YearMonth currentYearMonth = java.time.YearMonth.now();
int currentYear = currentYearMonth.getYear();
int currentMonth = currentYearMonth.getMonthValue(); // 1에서 12 사이의 값
request.setAttribute("currentYear", currentYear);
request.setAttribute("currentMonth", currentMonth);
%>

</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div>${currentYear}</div>
	<div>${currentMonth}</div>

	<div class="container">
		<div>
			<div class="d-flex align-items-center">
				<select id="year">
					<option value="${currentYear-2 }">${currentYear-2 }</option>
					<option value="${currentYear-1 }">${currentYear-1 }</option>
					<option value="${currentYear}">${currentYear}</option>
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
					value="33㎡ 이하" checked> <label for="resdentialArea1">~33㎡
					이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea2"
					value="33㎡ ~ 66㎡ 이하"> <label for="resdentialArea2">33㎡
					초과 ~ 66㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea3"
					value="66㎡ ~ 99㎡ 이하"> <label for="resdentialArea3">66㎡
					초과 ~ 99㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea4"
					value="99㎡ ~ 132㎡ 이하"> <label for="resdentialArea4">99㎡
					초과 ~ 132㎡ 이하</label>
			</div>
			<div class="resdential-area">
				<input type="radio" name="resdentialArea" id="resdentialArea5"
					value="132㎡ 이상~"> <label for="resdentialArea5">132㎡
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
				<input type="radio" name="livingMember" id="livingMember1" value="1"
					checked> <label for="livingMember1">1명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember2" value="2">
				<label for="livingMember2">2명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember3" value="3">
				<label for="livingMember3">3명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember4" value="4">
				<label for="livingMember4">4명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember5" value="5">
				<label for="livingMember5">5명</label>
			</div>
			<div class="house-member">
				<input type="radio" name="livingMember" id="livingMember6" value="6">
				<label for="livingMember6">6명 이상</label>
			</div>
		</div>
	</div>

	<div style="display: hidden;">
		<div id="type"></div>
		<div id="area"></div>
		<div id="member"></div>
	</div>

	<button type="button" id="resultBtn">결과 보기</button>

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
	v_year = document.getElementById("year")
	v_month = document.getElementById("month")
	
	monthOptions = v_month.querySelectorAll("option");
	console.log(monthOptions[0].innerHTML)
	
	v_year.addEventListener("change", ()=>{
		console.log(v_year.value)
		if(v_year.value == ${currentYear}){
			monthOptions.forEach(option =>{
				if(option.innerHTML >= ${currentMonth}){
					option.disabled = true;
				}else{
					option.disabled = false;
				}
			})
		}
	})
	
	/* v_month.addEventListener("change", ()=>{
		
	}) */
	
	const htRadioButtons = document.querySelectorAll('input[name="housing_type"]');
    const RaRadioButtons = document.querySelectorAll('input[name="resdentialArea"]');
    const HhRadioButtons = document.querySelectorAll('input[name="livingMember"]');
    
    htRadioButtons.forEach((node) => {
    	node.addEventListener("change",getHtac)
    })
    
    RaRadioButtons.forEach((node) => {
    	node.addEventListener("change",getHtac)
    })
    
    HhRadioButtons.forEach((node) => {
    	node.addEventListener("change",getHtac)
    })
    
    let houseType = ""
    let area = ""
    let household = 0
  	let householdString = ""
    getHtac()
    
    function getHtac(){
        htRadioButtons.forEach((node) => {
            if (node.checked) {
            	houseType = node.value
            }
        })
        
        RaRadioButtons.forEach((node) => {
            if (node.checked) {
            	area = node.value
            }
        })
        
        HhRadioButtons.forEach((node) => {
            if (node.checked) {
            	household = node.value
            }
        })
        
        householdString = household + "인"
        if(household == 6){
        	householdString += " 이상"
        }
    }
    
    document.getElementById("resultBtn").addEventListener('click', ()=>{
    	$.ajax({
    		type : 'POST',
    		url : '${pageContext.request.contextPath}/carbonGraphDo',
    		data : {"htacHouseType":houseType, "htacArea":area, "htacHousehold":household},
    		success : function(result1){
				console.log(result1)
				$.ajax({
    				type : 'POST',
    				url : '${pageContext.request.contextPath}/carbonEnergyDo',
    				data : {"hmeHouseholdMembers":householdString},
    				success : function(result2){
						console.log(result2)
						
						
					}
    			})
			}
    	})
    });
    
    </script>
</body>
</html>
