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
	background-color: white;
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

.content-line {
	margin-top: 24px;
	margin-bottom: 24px;
	margin-right: 10px;
}

.content-text {
	font-size: 20px;
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
					<c:if test="${not empty myCalList}">
						<div>
							<div class="d-flex">
								<div>
									<div class="fw-bold fs-3 text-center">연 합계 탄소 배출량</div>
									<canvas id="yearCalResultGraph"></canvas>
								</div>
								<div class="d-flex">
									<div class="d-flex flex-column">
										<div class="content-line">
											<span class="content-text fw-bold">월 평균 전기 탄소 배출량</span>
										</div>
										<div class="content-line">
											<span class="content-text fw-bold">월 평균 가스 탄소 배출량</span>
										</div>
										<div class="content-line">
											<span class="content-text fw-bold">월 평균 교통 탄소 배출량</span>
										</div>
										<div class="content-line">
											<span class="content-text fw-bold">월 평균 폐기물 탄소 배출량</span>
										</div>
									</div>
									<div id="yearCalResultAvgValue" class="d-flex flex-column">
										<div class="content-line d-flex justify-content-end">
											<span class="content-text"></span>
										</div>
										<div class="content-line d-flex justify-content-end">
											<span class="content-text"></span>
										</div>
										<div class="content-line d-flex justify-content-end">
											<span class="content-text"></span>
										</div>
										<div class="content-line d-flex justify-content-end">
											<span class="content-text"></span>
										</div>
									</div>
									<div class="d-flex flex-column">
										<div class="content-line">
											<span class="content-text fw-bold">kg</span>
										</div>
										<div class="content-line">
											<span class="content-text fw-bold">kg</span>
										</div>
										<div class="content-line">
											<span class="content-text fw-bold">kg</span>
										</div>
										<div class="content-line">
											<span class="content-text fw-bold">kg</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<div class="accordion accordion-flush" id="myCarbonCalAccordion">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">1월</button>
							</h2>
							<div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 1}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(1)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">2월</button>
							</h2>
							<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 2}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(2)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">3월</button>
							</h2>
							<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 3}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(3)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">4월</button>
							</h2>
							<div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 4}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(4)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">5월</button>
							</h2>
							<div id="flush-collapseFive" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 5}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(5)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">6월</button>
							</h2>
							<div id="flush-collapseSix" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 6}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(6)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">7월</button>
							</h2>
							<div id="flush-collapseSeven" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 7}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(7)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">8월</button>
							</h2>
							<div id="flush-collapseEight" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 8}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(8)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">9월</button>
							</h2>
							<div id="flush-collapseNine" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 9}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(9)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTen" aria-expanded="false" aria-controls="flush-collapseTen">10월</button>
							</h2>
							<div id="flush-collapseTen" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 10}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(10)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEleven" aria-expanded="false" aria-controls="flush-collapseEleven">11월</button>
							</h2>
							<div id="flush-collapseEleven" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 11}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(11)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwelve" aria-expanded="false" aria-controls="flush-collapseTwelve">12월</button>
							</h2>
							<div id="flush-collapseTwelve" class="accordion-collapse collapse" data-bs-parent="#myCarbonCalAccordion">
								<div class="accordion-body">
									<c:choose>
										<c:when test="${not empty myCalList}">
											<c:set var="found" value="false" />
											<c:forEach items="${myCalList}" var="myCal">
												<c:if test="${myCal.year == year && myCal.month == 12}">
													<c:set var="found" value="true" />
													<div class="d-flex">
														<div>
															<div class="fw-bold fs-3 text-center">총 탄소 배출량</div>
															<input value="${myCal.electricUsage}" type="hidden">
															<input value="${myCal.gasUsage}" type="hidden">
															<input value="${myCal.trafficKind}" type="hidden">
															<input value="${myCal.trafficValue}" type="hidden">
															<input value="${myCal.wasteWeight}" type="hidden">
															<canvas class="myCalResult"></canvas>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">전기 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">가스 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 종류</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.electricUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.gasUsage}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficKind}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.trafficValue}</span>
															</div>
															<div class="content-line">
																<span class="content-text d-flex justify-content-end">${myCal.wasteWeight}</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text fw-bold">kWh</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">m³</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">&nbsp;</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">km</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">kg</span>
															</div>
														</div>
													</div>
													<div class="d-flex justify-content-end">
														<button class="btn btn-secondary" onclick="deleteCalResult(12)">삭제</button>
													</div>
												</c:if>
											</c:forEach>
											<c:if test="${not found}">
												<div>저장된 결과가 없습니다.</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<div>저장된 결과가 없습니다.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div style="height: 100px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="carbonCalDeleteForm" action="<c:url value="/carbonCalDeleteDo" />" method="POST">
		<input type="hidden" name="userId" value="${sessionScope.login.userId}">
		<input type="hidden" name="resultYear" value="${year}">
		<input id="resultMonth" type="hidden" name="resultMonth">
	</form>
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
    
    let charts = [];
    
    let sumElec = 0
    let sumGas = 0
    let sumTraffic = 0
    let sumWaste = 0
    
    let sumElecCO2 = 0
    let sumGasCO2 = 0
    let sumTrafficCO2 = 0
    let sumWasteCO2 = 0
    
    function deleteCalResult(month){
    	document.getElementById("resultMonth").value = month
    	if(confirm("탄소 발자국 결과를 삭제하시겠습니까?")){
    		document.getElementById("carbonCalDeleteForm").submit();
    	}
    	}
    // 그래프 그리기
    let canvas = document.getElementsByClassName("myCalResult")
    for (let i = 0; i < canvas.length; i++){
    	let electricUsage = canvas[i].parentElement.children[1]
		let gasUsage = canvas[i].parentElement.children[2]
		let trafficKind = canvas[i].parentElement.children[3]
		let trafficValue = canvas[i].parentElement.children[4]
		let wasteWeight = canvas[i].parentElement.children[5]
    	
    	sumElec += parseInt(electricUsage.value)
        sumGas += parseInt(gasUsage.value)
        sumTraffic += parseInt(trafficValue.value)
        sumWaste += parseInt(wasteWeight.value)
    	
    	$.ajax({
			type:'POST',
			url: "<c:url value='/getEmissionList' />",
			success: function(result){
				let electricCO2
				let gasCO2
				let trafficCO2
				let wasteCO2
				for(let j = 0; j < result.length; j++){
					if(result[j].coefficientName == "전기 CO2 발생량"){
						electricCO2 = Math.round((electricUsage.value * result[j].coefficientValue) *10000)/10000
					}
					if(result[j].coefficientName == "가스 CO2 발생량"){
						gasCO2 = Math.round((gasUsage.value * result[j].coefficientValue) *10000)/10000
					}
					if(result[j].coefficientName == "경유 CO2 발생량" && trafficKind.value == "경유"){
						trafficCO2 = Math.round((trafficValue.value * result[j].coefficientValue) *10000)/10000
					}
					if(result[j].coefficientName == "휘발유 CO2 발생량" && trafficKind.value == "휘발유"){
						trafficCO2 = Math.round((trafficValue.value * result[j].coefficientValue) *10000)/10000
					}
					if(result[j].coefficientName == "LPG CO2 발생량" && trafficKind.value == "LPG"){
						trafficCO2 = Math.round((trafficValue.value * result[j].coefficientValue) *10000)/10000
					}
					if(trafficKind.value == "승용차 없음"){
						trafficCO2 = 0
					}
					if(result[j].coefficientName == "폐기물 CO2 발생량"){
						wasteCO2 = Math.round((wasteWeight.value * result[j].coefficientValue) *10000)/10000
					}
				}
				sumElecCO2 += electricCO2
			    sumGasCO2 += gasCO2
			    sumTrafficCO2 += trafficCO2
			    sumWasteCO2 += wasteCO2
				charts[i] = new Chart(canvas[i], {
		            type: 'pie',
		            data: {
		                labels: ['전기', '가스', '폐기물', '교통'],
		                datasets: [{
		                    data: [electricCO2, gasCO2, wasteCO2, trafficCO2]
		                }]
		            },
		            options: {
		                responsive: false,
		                plugins: {
		                    legend: {
		                        position: 'top',
		                    },
		                    datalabels: {
		                        color: '#fff', // 데이터 글자 색상
		                        font: {
		                            size: 15, // 글자 크기
		                        },
		                        formatter: (value, context) => {
		                        	if(value == 0) return ''
		                            return value + "kg";
		                        }
		                    }
		                }
		            },
		            plugins: [ChartDataLabels] // 플러그인 활성화
		        })
			}
		})
    }
    
    sumGraph = document.getElementById("yearCalResultGraph")
    setTimeout(()=>{
    	new Chart(sumGraph, {
            type: 'pie',
            data: {
                labels: ['전기', '가스', '폐기물', '교통'],
                datasets: [{
                    data: [sumElecCO2, sumGasCO2, sumWasteCO2, sumTrafficCO2]
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    datalabels: {
                        color: '#fff', // 데이터 글자 색상
                        font: {
                            size: 15, // 글자 크기
                        },
                        formatter: (value, context) => {
                        	if(value == 0) return ''
                            return value + "kg";
                        }
                    }
                }
            },
            plugins: [ChartDataLabels] // 플러그인 활성화
        })
    	
    	let resultCount = 0
    	<c:forEach items="${myCalList}" var="myCal">
    		resultCount+=1
    	</c:forEach>
    	
    	document.getElementById("yearCalResultAvgValue").children[0].children[0].innerHTML = Math.round(sumElecCO2/resultCount *10000)/10000
    	document.getElementById("yearCalResultAvgValue").children[1].children[0].innerHTML = Math.round(sumGasCO2/resultCount *10000)/10000
    	document.getElementById("yearCalResultAvgValue").children[2].children[0].innerHTML = Math.round(sumTrafficCO2/resultCount *10000)/10000
    	document.getElementById("yearCalResultAvgValue").children[3].children[0].innerHTML = Math.round(sumWasteCO2/resultCount *10000)/10000
    }, 200);
	</script>
</body>

</html>