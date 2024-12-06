<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="sg-meta">작성일: ${suggestion.sgDate}</div>


		<!-- 버튼 컨테이너 -->
		<div class="button-container">
			<c:if test="${sessionScope.login.userIsmaster == 1}">
				<div class="back-button">
					<a href="adminSuggestionsView?page=${param.page}"> 목록으로 돌아가기 </a>
				</div>
			</c:if>
			<c:if test="${sessionScope.login.userIsmaster == 1 || sessionScope.login.userId == suggestion.userId}">
				<div style="display: flex;">
					<form id="sgDelForm" action="${pageContext.request.contextPath}/suggestionDeleteDo" method="post">
						<input type="hidden" value="${suggestion.sgNo}" name="sgNo">
						<input type="hidden" value="${suggestion.userId}" name="userId">
					</form>
					<c:if test="${empty replyList}">
						<button type="button" id="sgDelBtn" class="btn btn-secondary" style="margin-right: 10px;">삭제</button>
					</c:if>
					<c:if test="${not empty replyList}">
						<button id="sgDelBtn"></button>
					</c:if>
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

		<div class="comments-container" style="margin-top: 30px;">
			<c:if test="${not empty replyList}">
				<h4>답변 목록</h4>
				<ul class="comments-list" style="list-style: none; padding: 0;">
					<c:forEach var="reply" items="${replyList}">
						<li class="comment-item" style="margin-bottom: 15px; padding: 10px; background-color: #f9f9f9; border: 1px solid #ddd; border-radius: 5px; display: flex; justify-content: space-between; align-items: center;">
							<p style="margin: 0; font-size: 1rem; color: #333; flex-grow: 1;">
								<c:out value="${reply.replyContent}" />
							</p>
							<div class="comment-meta" style="font-size: 0.85rem; color: #666;">
								작성일:
								<c:out value="${reply.replyDate}" />
							</div> <c:if test="${sessionScope.login.userIsmaster == 1}">
								<form id="replyDeleteForm" action="delReplyDo" method="post" style="margin-left: 10px;">
									<input type="hidden" name="sgNo" value="${suggestion.sgNo}" />
									<input type="hidden" name="replyNo" value="${reply.replyNo}" />
									<button id="replyDeleteBtn" type="button" style="border: none; background: none; color: red; cursor: pointer;">삭제</button>
								</form>
							</c:if> <c:if test="${sessionScope.login.userIsmaster != 1 }">
								<button id="replyDeleteBtn" class="d-none"></button>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${sessionScope.login.userIsmaster != 1 }">
				<form class="d-none" id="replyDeleteForm" action="delReplyDo" method="post" style="margin-left: 10px;">
					<input type="hidden" name="sgNo" value="${suggestion.sgNo}" />
					<input type="hidden" name="replyNo" value="${reply.replyNo}" />
					<button id="replyDeleteBtn" class="d-none" type="button" style="border: none; background: none; color: red; cursor: pointer;">삭제</button>
				</form>
			</c:if>
		</div>


		<!-- 답변 작성 폼 -->
		<c:if test="${sessionScope.login.userIsmaster == 1}">
			<div class="reply-container" style="margin-top: 30px;">
				<h4>답변</h4>
				<form action="${pageContext.request.contextPath}/registReplyDo" method="post">
					<!-- 건의사항 번호 (숨겨진 필드) -->
					<input type="hidden" name="sgNo" value="${suggestion.sgNo}" />

					<!-- 답변 내용 -->
					<textarea name="replyContent" rows="5" placeholder="여기에 답변을 작성하세요." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;"></textarea>

					<!-- 버튼 -->
					<div class="button-container" style="margin-top: 15px;">
						<button id="registReply" type="submit" style="padding: 10px 20px; background-color: green; color: white; border: none; border-radius: 5px; cursor: pointer;">답변 저장</button>
					</div>
				</form>
			</div>
		</c:if>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
		document.getElementById("replyDeleteBtn").addEventListener("click",()=>{
			if (confirm("답변을 삭제하시겠습니까?")) {
				document.getElementById("replyDeleteForm").submit()
			}
		})

		document.getElementById("sgDelBtn").addEventListener("click",()=>{
			if (confirm('이 건의사항을 삭제하시겠습니까?')) {
				document.getElementById("sgDelForm").submit()
			}
		})
	</script>
</body>
</html>