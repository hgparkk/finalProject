<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.suggestion-container {
	padding: 50px 20px;
	min-width: 800px;
	max-width: 800px;
	margin: 0 auto;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	flex-grow: 1;
	margin-bottom: 20px;
}

.suggestion-detail ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.suggestion-detail li {
	border-bottom: 1px solid #ddd;
	padding: 20px 15px;
	transition: background-color 0.3s, transform 0.2s;
	border-radius: 10px;
	margin-bottom: 10px;
}

.suggestion-detail li:hover {
	background-color: #d0f0c0;
	transform: translateY(-2px);
}

.suggestion-detail a {
	text-decoration: none;
	color: #333;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.suggestion-detail a:hover {
	color: #007bff;
}

.suggestion-detail span {
	font-size: 1rem;
}

.suggestion-detail .text-muted {
	font-size: 0.9rem;
	color: #666;
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
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="d-flex">
		<jsp:include page="/WEB-INF/inc/myPageSide.jsp">
			<jsp:param value="mySuggestions" name="selectedSpan" />
			<jsp:param value="none" name="selectedItem" />
		</jsp:include>
		<div class="d-flex justify-content-center" style="width: 100%; min-width: 600px;">
			<div class="d-flex flex-column" style="height: 800px;">
				<div class="fs-1 text-center" style="margin-top: 100px;">나의 건의사항</div>
				<div class="overflow-y-auto" style="margin-top: 150px; width: 810px;">
					<div class="suggestion-container">
						<div class="suggestion-detail">
							<ul>
								<c:forEach var="suggestion" items="${suggestionList}">
									<li><a href="${pageContext.request.contextPath}/">
											<span>${suggestion.sgTitle}</span>
											<span class="text-muted">
												<fmt:formatDate value="${suggestion.sgDate}" pattern="yyyy-MM-dd" />
											</span>
										</a></li>
								</c:forEach>
								<c:if test="${empty suggestionList}">
									<li class="text-center text-muted py-4">등록한 건의사항이 없습니다..</li>
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
									<li><a href="?page=${currentPage - 1}&size=${size}">이전</a></li>
								</c:if>

								<!-- 페이지 번호 -->
								<c:forEach var="i" begin="1" end="${totalPages}">
									<li><a href="?page=${i}&size=${size}" class="${i == currentPage ? 'active' : ''}">${i}</a></li>
								</c:forEach>

								<!-- 다음 버튼 -->
								<c:if test="${currentPage < totalPages}">
									<li><a href="?page=${currentPage + 1}&size=${size}">다음</a></li>
								</c:if>
							</ul>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>