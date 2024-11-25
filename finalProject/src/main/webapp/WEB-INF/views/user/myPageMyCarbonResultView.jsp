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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
																<span class="content-text fw-bold">교통 사용량</span>
															</div>
															<div class="content-line">
																<span class="content-text fw-bold">폐기물량</span>
															</div>
														</div>
														<div class="d-flex flex-column">
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
															<div class="content-line">
																<span class="content-text"></span>
															</div>
														</div>
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
    
    // 그래프 그리기
    let canvas = document.getElementsByClassName("myCalResult")
    for (let i = 0; i < canvas.length; i++){
    	let electricUsage = canvas[i].parentElement.children[0]
		let gasUsage = canvas[i].parentElement.children[1]
		let trafficKind = canvas[i].parentElement.children[2]
		let trafficValue = canvas[i].parentElement.children[3]
		let wasteWeight = canvas[i].parentElement.children[4]
    	
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
						electricCO2 = electricUsage.value * result[j].coefficientValue
					}
					if(result[j].coefficientName == "가스 CO2 발생량"){
						gasCO2 = gasUsage.value * result[j].coefficientValue
					}
					if(result[j].coefficientName == "경유 CO2 발생량" && trafficKind.value == "경유"){
						trafficCO2 = trafficValue.value * result[j].coefficientValue
					}
					if(result[j].coefficientName == "휘발유 CO2 발생량" && trafficKind.value == "휘발유"){
						trafficCO2 = trafficValue.value * result[j].coefficientValue
					}
					if(result[j].coefficientName == "LPG CO2 발생량" && trafficKind.value == "LPG"){
						trafficCO2 = trafficValue.value * result[j].coefficientValue
					}
					if(result[j].coefficientName == "폐기물 CO2 발생량"){
						wasteCO2 = wasteWeight.value * result[j].coefficientValue
					}
				}
				canvas[i].parentElement.parentElement.children[2].children[0].children[0].innerHTML = " : " +electricCO2
				canvas[i].parentElement.parentElement.children[2].children[1].children[0].innerHTML = " : " +gasCO2
				canvas[i].parentElement.parentElement.children[2].children[2].children[0].innerHTML = " : " +trafficCO2
				canvas[i].parentElement.parentElement.children[2].children[3].children[0].innerHTML = " : " +wasteCO2
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
	</script>
</body>

</html>