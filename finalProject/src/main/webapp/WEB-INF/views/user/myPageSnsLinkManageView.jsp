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

.mention {
	margin-top: 50px;
	margin-bottom: 10px;
}

.social-login-btn {
	background-size: 110%;
	background-position: center center;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	overflow: hidden;
	cursor: pointer;
}

.btn-naver {
	position: relative;
	background-image: url("assets/naver_login_assets/btnW_아이콘사각.png");
	transition: background 0.3s ease;
}

.btn-naver::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-image: url("assets/naver_login_assets/btnG_아이콘사각.png");
	background-size: 110%;
	background-position: center center;
	opacity: 0;
	transition: opacity 0.3s ease;
}

.btn-naver:hover::before {
	opacity: 1;
}

.btn-kakao {
	background-image: url("assets/kakao_login_assets/kakao_logo.png");
	transition: background 0.3s ease;
	background-repeat: no-repeat;
	background-size: 60%;
	background-color: rgba(0, 0, 0, 0);
}

.btn-kakao:hover {
	background-color: rgb(255, 235, 0);
}

.btn-google {
	position: relative;
	background-image: url("assets/google_login_assets/Web (mobile + desktop)/png@2x/light/web_light_sq_na@2x.png");
	transition: background 0.3s ease;
}

.btn-google::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-image: url("assets/google_login_assets/Web (mobile + desktop)/png@2x/neutral/web_neutral_sq_na_border@2x.png");
	background-size: 110%;
	background-position: center center;
	opacity: 0;
	transition: opacity 0.3s ease;
}

.btn-google:hover::before {
	opacity: 1;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="d-flex">
		<jsp:include page="/WEB-INF/inc/myPageSide.jsp">
			<jsp:param value="aboutUser" name="selectedSpan" />
			<jsp:param value="snsLinkManage" name="selectedItem" />
		</jsp:include>
		<div class="d-flex justify-content-center" style="width: 100%; min-width: 600px;">
			<div class="d-flex flex-column" style="height: 800px;">
				<div class="fs-1 text-center" style="margin-top: 100px;">SNS 연동 관리</div>
				<div style="margin-top: 150px; width: 600px;">
					<c:if test="${sessionScope.login.userProvider != null}">
						<div class="mb-2 d-flex align-items-center">
							<span class="fs-4 info-box text-body-tertiary">연동된 SNS</span>
							<c:if test="${sessionScope.login.userProvider == 'Naver'}">
								<img src="assets/naver_login_assets/btnG_아이콘사각.png" class="ms-3" style="width: 35px;">
								<span class="ms-3" style="color: #2DB400">NAVER</span>
							</c:if>
							<c:if test="${sessionScope.login.userProvider == 'Kakao'}">
								<img src="assets/kakao_login_assets/kakaotalk_sharing_btn_small.png" class="ms-3" style="width: 35px;">
								<span class="ms-3" style="color: #3C1E1E">KAKAO</span>
							</c:if>
							<c:if test="${sessionScope.login.userProvider == 'Google'}">
								<img src="assets/google_login_assets/Web (mobile + desktop)/png@2x/light/web_light_rd_na_border@2x.png" class="ms-3" style="width: 35px;">
								<span class="ms-3" style="color: #f2f2f2">Google</span>
							</c:if>
						</div>
						<div class="mt-5 mb-5">
							<button id="deleteSnsLink" class="btn btn-success btn-lg" style="width: 100%;">SNS 연동 정보 삭제</button>
							<form id="deleteSnsLinkDo" action="<c:url value="/deleteSnsLinkDo" />" method="POST"></form>
						</div>
					</c:if>
					<c:if test="${sessionScope.login.userProvider == null}">
						<div class="d-none">
							<button id="deleteSnsLink" class="btn btn-success btn-lg" style="width: 100%;">SNS 연동 정보 삭제</button>
						</div>
						<div class="mb-5 d-flex justify-content-center">
							<span class="fs-4 text-body-tertiary">연동된 SNS가 없습니다</span>
						</div>
						<div class="d-flex justify-content-center mention min-width-set">
							<span>아래의 SNS로 연동하기</span>
						</div>
						<div class="d-flex justify-content-evenly min-width-set">
							<a href="${naverLinkUri}" class="social-login-btn btn-naver"></a>
							<a href="${kakaoLinkUri}"  class="social-login-btn btn-kakao"></a>
							<a href="${googleLinkUri}"  class="social-login-btn btn-google"></a>
						</div>
					</c:if>
					<form id="deleteSnsLinkForm" action="<c:url value="/deleteSnsLinkDo" />" method="POST"></form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
		document.getElementById("deleteSnsLink").addEventListener("click",()=>{
			if(confirm("소셜 계정 연동 정보를 삭제하시겠습니까?")){
				document.getElementById("deleteSnsLinkForm").submit();
			}
		})
	</script>
</body>

</html>