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
					<div class="mt-5 mb-5">
						<a id="pwChangeButton" href="<c:url value="/myPagePwChangeView" />" class="btn btn-success btn-lg" style="width: 100%;">비밀번호 변경</a>
					</div>
					<c:if test="${sessionScope.login.userProvider != null}">
						<div class="mb-2 fs-2 text-center">SNS 연동 정보</div>
						<div class="mb-2">
							<span class="fs-4 info-box text-body-tertiary">연동된 SNS</span>
							<span></span>
						</div>
						<div class="mb-2">
							<span class="fs-4 info-box text-body-tertiary">SNS 아이디</span>
							<span></span>
						</div>
						<div class="mt-5 mb-5">
							<button class="btn btn-success btn-lg" style="width: 100%;">SNS 연동 정보 변경</button>
						</div>
					</c:if>
					<c:if test="${sessionScope.login.userProvider == null}">
						<div class="mt-5 mb-5">
							<button class="btn btn-success btn-lg" style="width: 100%;">SNS 연동하기</button>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>