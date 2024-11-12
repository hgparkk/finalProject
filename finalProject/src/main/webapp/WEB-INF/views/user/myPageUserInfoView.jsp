<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.info-box {
	display: inline-block;
	width: 125px;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="d-flex">
		<jsp:include page="/WEB-INF/inc/myPageSide.jsp">
			<jsp:param value="aboutUser" name="selectedSpan" />
			<jsp:param value="userInfo" name="selectedItem" />
		</jsp:include>
		<div class="d-flex justify-content-center" style="width: 100%; min-width: 600px;">
			<div class="d-flex flex-column" style="height: 800px;">
				<div class="fs-1 text-center" style="margin-top: 100px;">회원 정보</div>
				<div style="margin-top: 150px; width: 600px;">
					<div class="mb-2">
						<span class="fs-4 info-box text-body-tertiary">이름</span>
						<span class="fs-4">${sessionScope.login.userName}</span>
					</div>
					<div class="mb-2">
						<span class="fs-4 info-box text-body-tertiary">이메일</span>
						<span class="fs-4">${sessionScope.login.userEmail}</span>
					</div>
					<div class="mt-5 mb-5"></div>
					<c:if test="${sessionScope.login.userProvider != null}">
						<div class="mb-5 fs-2 text-center">SNS 연동 정보</div>
						<div class="mb-2 d-flex align-items-center">
							<span class="fs-4 info-box text-body-tertiary">연동된 SNS</span>
							<c:if test="${sessionScope.login.userProvider == 'Naver'}">
								<img src="assets/naver_login_assets/btnG_아이콘사각.png" class="ms-3" style="width: 35px;">
								<span class="ms-3" style="color: #2DB400">NAVER</span>
							</c:if>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>