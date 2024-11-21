<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo - 공지사항</title>
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

.notice-container {
	padding: 50px 20px;
	min-width: 1200px;
	max-width: 800px;
	margin: 0 auto;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	flex-grow: 1;
	margin-bottom: 20px;
	min-height: 1000px;
}

.title-box {
	display: flex;
	padding-left: 2vw;
	padding-right: 2vw;
	margin-left: 130px;
}

.carbonCal-title {
	width: 100%;
	height: 7.5vw;
}

.notice-search-box {
	display: flex;
	justify-content: center;
	margin-bottom: 20px;
}

.notice-search-box form {
	display: flex;
	align-items: center;
}

.notice-search-box input[type="text"] {
	width: 300px;
	height: 40px;
	padding: 0 10px;
	border: 1px solid #ddd;
	border-radius: 5px 0 0 5px;
}

.notice-search-box button {
	height: 40px;
	padding: 0 20px;
	border: none;
	background-color: #28a745;
	color: white;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
	transition: background-color 0.3s;
}

.notice-search-box button:hover {
	background-color: #218838;
}

.write-button-container {
	display: flex;
	justify-content: center;
	margin: 20px 0;
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

.noticeDetail ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.noticeDetail li {
	border-bottom: 1px solid #ddd;
	padding: 20px 15px;
	transition: background-color 0.3s, transform 0.2s;
	border-radius: 10px;
	margin-bottom: 10px;
}

.noticeDetail li:hover {
	background-color: #d0f0c0;
	transform: translateY(-2px);
}

.noticeDetail a {
	text-decoration: none;
	color: #333;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.noticeDetail a:hover {
	color: #007bff;
}

.noticeDetail span {
	font-size: 1rem;
}

.noticeDetail .text-muted {
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
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="title-box">
		<div class="carbonCal-title w-50">
			<h1 style="color: green; font-weight: bold;">공지사항</h1>
		</div>
	</div>

	<!-- 공지사항 검색박스 -->
	<div class="notice-search-box">
		<form action="noticeView" method="get">
			<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요"
				value="${param.searchKeyword}">
			<button type="submit">검색</button>
		</form>
	</div>

	<!-- 글쓰기 버튼 -->
	<c:if test="${sessionScope.login.userIsmaster == 1}">
		<div class="write-button-container">
			<a href="noticeWriteView" class="write-button">글쓰기</a>
		</div>
	</c:if>

	<!-- 공지사항 리스트 컨테이너 -->
	<div class="notice-container">
		<div class="noticeDetail">
			<ul>
				<c:forEach var="notice" items="${noticeList}">
					<li><a href="noticeDetailView?noticeNo=${notice.noticeNo}">
							<span>${notice.noticeTitle}</span> <span class="text-muted">
								<fmt:formatDate value="${notice.noticeDate}"
									pattern="yyyy-MM-dd" />
						</span>
					</a></li>
				</c:forEach>
				<c:if test="${empty noticeList}">
					<li class="text-center text-muted py-4">등록된 공지사항이 없습니다.</li>
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
					<li><a
						href="?page=${currentPage - 1}&size=${size}&searchKeyword=${searchKeyword}">이전</a>
					</li>
				</c:if>

				<!-- 페이지 번호 -->
				<c:forEach var="i" begin="1" end="${totalPages}">
					<li><a
						href="?page=${i}&size=${size}&searchKeyword=${searchKeyword}"
						class="${i == currentPage ? 'active' : ''}">${i}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:if test="${currentPage < totalPages}">
					<li><a
						href="?page=${currentPage + 1}&size=${size}&searchKeyword=${searchKeyword}">다음</a>
					</li>
				</c:if>
			</ul>
		</c:if>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
