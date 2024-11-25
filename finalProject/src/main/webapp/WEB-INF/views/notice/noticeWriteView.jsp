<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo - 공지사항 작성</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>

<!-- 네이버스마트에디터 js -->
<script
	src="${pageContext.request.contextPath }/nse/js/HuskyEZCreator.js"></script>

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

.write-container {
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

.write-form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.write-form input[type="text"], .write-form input[type="file"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
}

.write-form textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
	resize: none;
	height: 300px;
}

.write-form button {
	width: 100%;
	padding: 10px;
	background-color: #28a745;
	color: white;
	font-size: 1rem;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.write-form button:hover {
	background-color: #218838;
}
</style>
<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div class="title-box">
		<h1>공지사항 작성</h1>
		<span style="font-size: 0.7vw;">Coding Bamboo Notice</span>
	</div>

	<!-- 글쓰기 폼 -->
	<div class="write-container">
		<form action="${pageContext.request.contextPath}/noticeWriteDo"
			method="post" class="write-form" enctype="multipart/form-data">
			<!-- 제목 -->
			<div style="width: 80%;">
				<input type="text" id="noticeTitle" name="noticeTitle"
					placeholder="제목을 입력하세요" required>
			</div>

			<!-- 내용 -->
			<div>
				<textarea id="noticeContent" name="noticeContent"></textarea>
			</div>

			<!-- 첨부파일 -->
			<div>
				<label for="formFileMultiple" class="form-label">파일첨부</label>
				<input class="form-control" name="boFile" type="file" id="formFileMultiple" multiple>
			</div>
			<!-- 등록 버튼 -->
			<button type="submit">등록</button>
		</form>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script type="text/javascript">
		var oEditors = [];

		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "noticeContent",
					sSkinURI : "${pageContext.request.contextPath}/nse/SmartEditor2Skin.html"
				});
	</script>


</body>
</html>
