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

	<div class="pt-5">
		<div class="row justify-content-center">
			<div class="mt-5" style="width: 800px;">
				<div class="border border-success rounded bg-success" style="padding-top:100px; padding-bottom:15px; padding-left:15px; padding-right:15px;">
					<div class="mb-3 d-flex justify-content-center">
						<span class="fs-4 fw-bold text-white">회원님의 아이디는 ${findId} 입니다.</span>
					</div>

					<div class="mb-3 d-flex justify-content-evenly" style="margin-top: 150px;">
						<a class="text-white local-text-btn" href="<c:url value="/loginView" />">로그인 하러가기</a> <a class="text-white local-text-btn" href="<c:url value="/fwFindView" />">비밀번호 찾기</a>
					</div>
				</div>
			</div>
			<div style="height:50px;"></div>
		</div>
	</div>

	<div class="space"></div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>