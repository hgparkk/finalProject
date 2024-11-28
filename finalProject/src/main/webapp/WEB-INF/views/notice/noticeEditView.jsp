<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo - 공지사항 수정</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<!-- 네이버스마트에디터 js -->
<script src="${pageContext.request.contextPath}/nse/js/HuskyEZCreator.js"></script>
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

.edit-container {
	padding: 50px 20px;
	width: 800px;
	max-width: 800px;
	margin: 0 auto;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	flex-grow: 1;
}

.title-box {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	margin-bottom: 20px;
	text-align: center;
}

.title-box h1 {
	color: green;
	font-weight: bold;
}

.edit-form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.edit-form input[type="text"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
}

.edit-form textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
	resize: none;
	height: 300px;
}

.edit-form button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	font-size: 1rem;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.edit-form button:hover {
	background-color: #0056b3;
}
</style>
<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="title-box">
		<h1>공지사항 수정</h1>
		<span style="font-size: 0.7vw;">Coding Bamboo Notice</span>
	</div>

	<!-- 수정 폼 -->
	<div class="edit-container">
		<form id="noticeWriteForm" action="noticeEditDo" method="post" class="edit-form"
			enctype="multipart/form-data">
			<!-- 공지사항 번호 (숨겨진 필드) -->
			<input type="hidden" name="noticeNo" value="${notice.noticeNo}" />

			<!-- 제목 -->
			<div>
				<label for="noticeTitle" style="font-weight: bold;">제목</label> <input
					type="text" id="noticeTitle" name="noticeTitle"
					value="${notice.noticeTitle}" placeholder="제목을 입력하세요" required>
			</div>

			<!-- 내용 -->
			<div>
				<label for="noticeContent" style="font-weight: bold;">내용</label>
				<textarea id="noticeContent" name="noticeContent" required>${notice.noticeContent}</textarea>
			</div>

			<!-- 기존 첨부파일 정보 (숨겨진 필드) -->
			<div>
				<label style="font-weight: bold;">첨부파일</label>
				<ul>
					<c:forEach var="attach" items="${attachList}">
						<li>${attach.attachOriginalName} (${attach.attachFancySize})
							<!-- 첨부파일 정보 숨겨진 필드로 유지 --> <input type="hidden"
							name="existingFiles" value="${attach.attachNo}" />
						</li>
					</c:forEach>
				</ul>
			</div>



			<!-- 수정 버튼 -->
			<button id="noticeWriteBtn" type="button">수정</button>
		</form>
	</div>
	<script>
	var oEditors = [];

	nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "noticeContent",
				sSkinURI : "${pageContext.request.contextPath}/nse/SmartEditor2Skin.html",
			});
		const v_title = document.getElementById("noticeTitle")
		const v_content = document.getElementById("noticeContent")
	document.getElementById('noticeWriteBtn').addEventListener('click', ()=>{
		oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
		
		v_titleValue = v_title.value
		v_contentValue = v_content.value
		
		v_contentValue = v_contentValue.replaceAll("&nbsp;"," ")
		
		v_title.value = v_titleValue.trim()
		v_content.value = v_contentValue.trim()
		
		if(!v_title.value || !v_content.value){
			alert("입력된 내용이 없습니다")
			return
		}
		
		document.getElementById('noticeWriteForm').submit();
	});
	</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
