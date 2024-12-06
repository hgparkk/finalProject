<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 목록</title>

<%@ include file="/WEB-INF/inc/header.jsp"%>

<style>
html, body {
	min-height: 100%;
	display: flex;
	flex-direction: column;
	margin: 0;
	padding: 0;
	background-color: #f4f7f6;
	font-family: 'Noto Sans KR', sans-serif;
}

.carbonCal-container {
	width: 100%;
	max-width: 1300px;
	min-width: 500px;
	justify-content: center;
	margin: auto;
	padding-left: 2vw;
	padding-right: 2vw;
}

.sg-container {
	padding: 50px 20px;
	width: 80%;
	min-width: 800px;
	margin: 0 auto;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	flex-grow: 1;
	margin-bottom: 20px;
	min-height: 1000px;
	margin: 0 auto;
}

.title-box {
	display: flex;
}

.carbonCal-title {
	width: 100%;
	height: 7.5vw;
}

.sg-search-box {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.sg-search-box form {
	display: flex;
	align-items: center;
}

.sg-search-box input[type="text"] {
	width: 300px;
	height: 40px;
	padding: 0 10px;
	border: 1px solid #ddd;
	border-radius: 5px 0 0 5px;
}

.sg-search-box button {
	height: 40px;
	padding: 0 20px;
	border: none;
	background-color: #28a745;
	color: white;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
	transition: background-color 0.3s;
}

.sg-search-box button:hover {
	background-color: #218838;
}

.write-button-container {
	display: flex;
	justify-content: flex-end;
	margin: 20px 0;
	margin-right: 350px;
}

.write-button {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s;
}

.write-button:hover {
	background-color: #0056b3;
}

.sgDetail ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.sgDetail li {
	border-bottom: 1px solid #ddd;
	padding: 20px 15px;
	transition: background-color 0.3s, transform 0.2s;
	border-radius: 10px;
	margin-bottom: 10px;
}

.sgDetail li:hover {
	background-color: #d0f0c0;
	transform: translateY(-2px);
}

.sgDetail a {
	text-decoration: none;
	color: #333;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.sgDetail a:hover {
	color: #007bff;
}

.sgDetail span {
	font-size: 1rem;
}

.sgDetail .text-muted {
	font-size: 0.9rem;
	color: #666;
}

.pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination ul {
	display: flex;
	list-style: none;
	padding: 0;
	margin: 0;
}

.pagination li {
	margin: 0 5px;
}

.pagination a {
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	color: #333;
	transition: background-color 0.3s, color 0.3s;
}

.pagination a:hover {
	background-color: #007bff;
	color: white;
}

.pagination a.active {
	background-color: #007bff;
	color: white;
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

.campaign-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 0.7vw;
	width: 100%;
	min-width: 800px;
	margin: auto;
}
</style>

</head>

<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="carbonCal-container">
		<div class="title-box">
			<div class="carbonCal-title w-50">
				<h1 style="color: green; font-weight: bold;">건의사항</h1>
			</div>
			<div class="w-50 d-flex align-items-center justify-content-end">
				<a class="home-go" href="${pageContext.request.contextPath }">
					<img src="${pageContext.request.contextPath}/resources/image/home.png">
					<span>홈으로 이동</span>
				</a>
			</div>
		</div>
	</div>

	<div style="width: 80%; margin: auto">
		<div class="campaign-info">
			<p>
				<c:if test="${sgList.size() != 0}">
					<span>전체</span>
					<b>${totalSg}건</b>
					<span>페이지</span>
					<b>${currentPage}</b>
					<span>/</span>
					<b>${totalPages}</b>
				</c:if>
			</p>
		</div>
	</div>
	<!-- 건의 리스트 컨테이너 -->
	<div class="sg-container">
		<!-- 건의사항 검색박스 -->

		<div class="sgDetail">
			<ul>
				<c:forEach var="suggestion" items="${sgList}">
					<li><a href="${pageContext.request.contextPath}/adminSuggestionsDetailView?sgNo=${suggestion.sgNo}">
							<span>${suggestion.sgTitle}</span>
							<span class="text-muted">
								<fmt:formatDate value="${suggestion.sgDate}" pattern="yyyy-MM-dd" />
							</span>
						</a></li>
				</c:forEach>
				<c:if test="${empty sgList}">
					<li class="text-center text-muted py-4">등록된 건의사항이 없습니다.</li>
				</c:if>
			</ul>
		</div>
	</div>

	<!-- 페이징 -->
	<div class="pagination mb-5">
		<c:if test="${totalPages > 0}">
			<ul>
				<!-- 이전 버튼 -->
				<c:if test="${currentPage > 1}">
					<li><a href="?page=${currentPage - 1}&size=${size}=${searchKeyword}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach var="i" begin="1" end="${totalPages}">
					<li><a href="?page=${i}&size=${size}=${searchKeyword}" class="${i == currentPage ? 'active' : ''}">${i}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<li><a href="?page=${currentPage + 1}&size=${size}=${searchKeyword}">다음</a></li>
				</c:if>
			</ul>
		</c:if>
	</div>



	<!-- Footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>