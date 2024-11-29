<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<style type="text/css">
.campaign-write-container {
	width: 500px;
	margin: auto;
	padding: 2vw;
	border: 1px solid black;
}

.campaign-write {
	
}

</style>
</head>

<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>
<body>


	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div style="height: 5vh;"></div>

	<div class="campaign-write-container">
		<form action="${pageContext.request.contextPath }/campaignWriteDo"
			method="POST" id="campaignRegistBtn">
			<div class="form-floating mb-3">
				<input class="form-control" id="inputTitle" type="text"
					name="campaignTitle" placeholder="제목" required>
				<label for="inputTitle">제목</label>
			</div>
			<div class="form-floating mb-3">
				<input class="form-control" id="inputUrl" type="text"
					name="campaignUrl" placeholder="url" required>
				<label for="inputUrl">url</label>
			</div>
			<div>
				<label for="formFile" class="form-label d-flex justify-content-center" style="text-align: left;">이미지
					파일첨부</label>
				<input class="form-control mb-3" name="boFile" type="file" id="formFile"
					accept="image/*" required>
			</div>
			<!-- 등록 버튼 -->
			<div class="d-flex justify-content-center">
				<button id="campaignWriteBtn" class="btn btn-secondary" type="button">캠페인 등록</button>
			</div>
		</form>
	</div>

	<div style="height: 5vh;"></div>

	<!-- footer 부분 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

<script type="text/javascript">
	document.getElementById("campaignWriteBtn").addEventListener('click', ()=>{
		if(confirm("해당 내용의 캠페인을 등록하시겠습니까?")){
			document.getElementById("campaignRegistBtn").submit();
		}
	});
</script>
</html>