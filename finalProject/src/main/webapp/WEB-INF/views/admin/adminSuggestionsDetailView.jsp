<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
html, body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
	background-color: #f4f7f6;
	font-family: 'Noto Sans KR', sans-serif;
}

.sg-container {
	padding: 50px 20px;
	max-width: 800px;
	margin: 0 auto;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	min-height: 600px;
}

.sg-title {
	font-size: 2rem;
	font-weight: bold;
	color: green;
	margin-bottom: 20px;
	border-bottom: 2px solid #d0f0c0;
	padding-bottom: 10px;
	text-align: center;
}

.sg-content {
	font-size: 1rem;
	line-height: 1.6;
	color: #333;
	margin-bottom: 30px;
	min-height: 300px;
}

.sg-meta {
	font-size: 0.9rem;
	color: #666;
	text-align: right;
	margin-top: 15px;
	border-top: 1px solid #ddd;
	padding-top: 10px;
}

.attach-files {
	margin-top: 30px;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.attach-files h4 {
	font-size: 1.2rem;
	margin-bottom: 15px;
	color: #333;
	font-weight: bold;
}

.attach-files ul {
	list-style: none;
	padding: 0;
}

.attach-files li {
	margin-bottom: 10px;
	font-size: 1rem;
}

.attach-files a {
	text-decoration: none;
	color: #007bff;
	transition: color 0.3s;
}

.attach-files a:hover {
	color: #0056b3;
}

.button-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 20px;
}

.back-button a, .delete-button a, .edit-button a {
	text-decoration: none;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	background-color: #6c757d;
	transition: background-color 0.3s;
}

.back-button a:hover, .delete-button a:hover, .edit-button a:hover {
	background-color: #5a6268;
}
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<!-- 건의사항 상세 내용 -->
	<div class="sg-container">
		<!-- 제목 -->
		<div class="sg-title">
			<c:out value="${suggestion.sgTitle}" />
		</div>

		<!-- 내용 -->
		<div class="sg-content">${suggestion.sgContent}</div>

		<!-- 작성일 -->
		<div class="sg-meta">
			작성일:
			<fmt:formatDate value="${suggestion.sgDate}" pattern="yyyy-MM-dd" />
		</div>


		<!-- 버튼 컨테이너 -->
		<div class="button-container">
			<div class="back-button">
				<a href="adminSuggestionsView?page=${param.page}"> 목록으로 돌아가기 </a>
			</div>
			<c:if test="${sessionScope.login.userIsmaster == 1}">
				<div style="display: flex;">
					<div class="delete-button" style="margin-right: 10px;">
						<a href="suggestionDeleteDo?sgNo=${suggestion.sgNo}" onclick="return confirm('이 건의사항을 삭제하시겠습니까?');"> 삭제 </a>
					</div>
					<div class="edit-button">
						<a href="suggestionEditView?sgNo=${suggestion.sgNo}"> 수정 </a>
					</div>
				</div>
			</c:if>
		</div>
		
		<!-- 첨부파일 -->
		<c:if test="${not empty attachList}">
			<div class="attach-files">
				<h4>첨부파일</h4>
				<ul>
					<!-- 첨부파일 목록 반복 -->
					<c:forEach var="attach" items="${attachList}">
						<li>
							<!-- 파일 다운로드 링크 생성 --> <a href="${pageContext.request.contextPath}/filedownload?attachName=${attach.attachName}&attachOriginalName=${attach.attachOriginalName}" target="_blank"> ${attach.attachOriginalName} (${attach.attachFancySize}) </a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>





	</div>
		<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>