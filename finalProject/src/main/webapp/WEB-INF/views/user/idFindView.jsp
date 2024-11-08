<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="space"></div>
	<div class="space"></div>
	<div class="pt-5">
		<div class="row justify-content-center">
			<div class="mt-5" style="width: 500px;">

				<!-- 아이디 찾기 폼 -->
				<form id="idFindFrom" action="<c:url value="/idFindDo" />" method="POST">

					<!-- 이름 입력창 -->
					<div class="form-floating mb-3">
						<input class="form-control" id="inputName" type="text" name="userName" placeholder="이름" />
						<label for="inputName">이름</label>
					</div>

					<!-- 이메일 입력창 -->
					<div class="form-floating mb-3">
						<input class="form-control" id="inputEmail" type="email" name="userEmail" placeholder="이메일">
						<label for="inputEmail">이메일</label>
					</div>

					<!-- 아이디 찾기 버튼 -->
					<div class="d-flex justify-content-center mb-3">
						<button id="pwFindBtn" class="btn btn-success btn-lg" style="width: 100%;" type="submit">아이디 찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="space"></div>
	<div class="space"></div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>