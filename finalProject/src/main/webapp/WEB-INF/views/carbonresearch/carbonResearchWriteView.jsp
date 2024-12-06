<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탄소저감 연구 동향</title>
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

.write-container {
	padding: 50px 20px;
	width: 800px;
	max-width: 800px;
	margin: 0 auto;
	background-color: #ffffff;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	flex-grow: 1;
	text-align: center;
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
	align-items: center;

}

.write-form input[type="text"]{
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
	margin-left: 0px;
}
 .write-form input[type="file"] {
	width: 700px;
	margin: 0;
	display: flex;
	
	
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
</head>
<body>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	
	<div class="title-box">
		<h1>탄소저감기술 연구 동향 작성</h1>
	</div>
	
	<!-- 글쓰기 폼 -->
	<div class="write-container">
		<form id="techWriteForm" action="${pageContext.request.contextPath}/techWriteDo" method="post" class="write-form">
			<!-- 제목 -->
			<div style="width: 90%;">
				<div class="form-floating mb-3"  >
					<input class="form-control"  type="text" id="techTitle" name="techTitle" placeholder="제목">
					<label for="techTitle">제목</label>
				</div>
	
				<!-- 내용 -->
				<div class="form-floating mb-3" >
					<input class="form-control" type="text" id="techUrl" name="techUrl" placeholder="url"></input>
					<label for="techUrl">url</label>
				</div>
			</div>

			<!-- 등록 버튼 -->
			<button id="techWriteBtn" type="submit">등록</button>
		</form>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>