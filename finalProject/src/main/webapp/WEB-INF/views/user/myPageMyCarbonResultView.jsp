<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.Year"%>

<%
request.setAttribute("currentYear", Year.now().getValue());
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.custom-select-trigger {
	display: inline-block;
	padding: 8px 16px;
	cursor: pointer;
}

.custom-select-wrapper {
	position: relative;
	display: inline-block;
}

.custom-select-dropdown {
	background-color:white;
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	border: 1px solid #ccc;
	z-index: 100;
	max-height: 200px;
	overflow-y: auto;
}

.custom-select-dropdown div {
	padding: 8px 16px;
	cursor: pointer;
}

.custom-select-dropdown div:hover {
	background-color: #f0f0f0;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="d-flex">
		<jsp:include page="/WEB-INF/inc/myPageSide.jsp">
			<jsp:param value="myCarbonResult" name="selectedSpan" />
			<jsp:param value="none" name="selectedItem" />
		</jsp:include>
		<div class="d-flex justify-content-center" style="width: 100%; min-width: 600px;">
			<div class="d-flex flex-column align-items-center" style="width: 100%;">
				<div class="fs-1 text-center" style="margin-top: 100px;">나의 탄소 발자국</div>
				<div style="margin-top: 100px; width: 90%;">
					<div class="d-flex justify-content-center" style="margin-bottom: 50px;">
						<div class="d-flex align-items-center">
							<c:if test="${year != 2000}">
								<a href="<c:url value="/myPageMyCarbonResultView?year=${year-1}" />" class="fs-1 me-3 text-black link-underline link-underline-opacity-0">&laquo;</a>
								<a href="<c:url value="/myPageMyCarbonResultView?year=${year-1}" />" class="fs-3 me-3 text-secondary text-center local-text-btn">${year-1}</a>
							</c:if>
							<div class="custom-select-wrapper">
								<span class="custom-select-trigger fs-1">${year}</span>
								<select class="custom-select d-none">
									<c:forEach var="year" begin="2000" end="${currentYear}" step="1">
										<option value="<c:url value="/myPageMyCarbonResultView?year=${2000 + currentYear - year}"/>">${2000 + currentYear - year}</option>
									</c:forEach>
								</select>
								<div class="custom-select-dropdown">
									<c:forEach var="year" begin="2000" end="${currentYear}" step="1">
										<div data-value="<c:url value="/myPageMyCarbonResultView?year=${2000 + currentYear - year}"/>">${2000 + currentYear - year}</div>
									</c:forEach>
								</div>
							</div>
							<c:if test="${year != currentYear}">
								<a href="<c:url value="/myPageMyCarbonResultView?year=${year+1}" />" class="fs-3 ms-3 text-secondary text-center local-text-btn">${year+1}</a>
								<a href="<c:url value="/myPageMyCarbonResultView?year=${year+1}" />" class="fs-1 ms-3 text-black link-underline link-underline-opacity-0">&raquo;</a>
							</c:if>
							<input type="hidden" value="${year}">
						</div>
					</div>
					<div class="accordion accordion-flush" id="myCalbonCalAccordion">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">1월</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">2월</button>
							</h2>
							<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">3월</button>
							</h2>
							<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">4월</button>
							</h2>
							<div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">5월</button>
							</h2>
							<div id="flush-collapseFive" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">6월</button>
							</h2>
							<div id="flush-collapseSix" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">7월</button>
							</h2>
							<div id="flush-collapseSeven" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">8월</button>
							</h2>
							<div id="flush-collapseEight" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">9월</button>
							</h2>
							<div id="flush-collapseNine" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTen" aria-expanded="false" aria-controls="flush-collapseTen">10월</button>
							</h2>
							<div id="flush-collapseTen" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEleven" aria-expanded="false" aria-controls="flush-collapseEleven">11월</button>
							</h2>
							<div id="flush-collapseEleven" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body">
									<c:forEach items="${myCalList}" var="myCal">
										<c:if test="${myCal.year == year && myCal.month == 11}">
											<div>${myCal.electricUsage}</div>
											<div>${myCal.gasUsage}</div>
											<div>${myCal.trafficKind}</div>
											<div>${myCal.trafficValue}</div>
											<div>${myCal.wasteWeight}</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwelve" aria-expanded="false" aria-controls="flush-collapseTwelve">12월</button>
							</h2>
							<div id="flush-collapseTwelve" class="accordion-collapse collapse" data-bs-parent="#myCalbonCalAccordion">
								<div class="accordion-body"></div>
							</div>
						</div>
						<div style="height: 100px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
	document.querySelector('.custom-select-trigger').addEventListener('click', function() {
        const dropdown = document.querySelector('.custom-select-dropdown');
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
    });

    // 드롭다운 옵션 클릭 시 선택 처리
    const options = document.querySelectorAll('.custom-select-dropdown div');
    options.forEach(option => {
        option.addEventListener('click', function() {
            const selectedValue = option.getAttribute('data-value');
            const selectElement = document.querySelector('.custom-select');
            selectElement.value = selectedValue; // <select> 태그의 값을 업데이트
            location.href=selectElement.value
            document.querySelector('.custom-select-trigger').textContent = option.textContent; // <span> 텍스트 업데이트
            document.querySelector('.custom-select-dropdown').style.display = 'none'; // 드롭다운 닫기
        });
    });

    // 외부 클릭 시 드롭다운 닫기
    window.addEventListener('click', function(event) {
        if (!event.target.closest('.custom-select-wrapper')) {
            document.querySelector('.custom-select-dropdown').style.display = 'none';
        }
    });
	</script>
</body>

</html>