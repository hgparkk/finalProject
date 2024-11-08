<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
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
	<div class="space"></div>
	<div class="pt-5">
		<div class="row justify-content-center">
			<div class="mt-5" style="width: 500px;">

				<!-- 로그인 폼 -->
				<form action="<c:url value="/loginDo" />" method="POST">

					<!-- 로그인 요청을 한 URL -->
					<input type="hidden" value="${fromUrl}" name="fromUrl">

					<!-- 아이디 입력창 -->
					<div class="form-floating mb-3">
						<input class="form-control" id="inputId" type="text" name="userId" placeholder="아이디" />
						<label for="inputId">아이디</label>
					</div>

					<!-- 비밀번호 입력창 -->
					<div class="form-floating mb-3">
						<input class="form-control" id="inputPw" type="password" name="userPw" placeholder="비밀번호" />
						<label for="inputPw">비밀번호</label>
					</div>

					<!-- 로그인 실패 메시지 -->
					<div class="mb-3">
						<span class="text-danger">${failMsg}</span>
					</div>

					<!-- 로그인 버튼 -->
					<div class="d-flex justify-content-center mb-3 min-width-set">
						<button class="btn btn-success btn-lg" style="width: 100%;" type="submit">로그인</button>
					</div>
					<div class="d-flex justify-content-end min-width-set">
						<a class="text-black cursor-pointer local-text-btn" href="<c:url value="/idFindView" />">아이디 찾기</a>
						<span class="mx-1">|</span>
						<a class="text-black cursor-pointer local-text-btn" href="<c:url value="/pwFindView" />">비밀번호 찾기</a>
					</div>
				</form>
				<!-- SNS 계정으로 로그인하기 -->
				<div class="d-flex justify-content-center mention min-width-set">
					<span>SNS 계정으로 로그인하기</span>
				</div>
				<div class="d-flex justify-content-evenly min-width-set">
					<a class="social-login-btn btn-naver"></a> <a class="social-login-btn btn-kakao"></a> <a class="social-login-btn btn-google"></a>
				</div>
				<div class="d-flex justify-content-center mention min-width-set" style="margin-top: 100px;">아직 회원이 아니시라면?</div>

				<!-- 회원가입 버튼 -->
				<div class="d-flex justify-content-center mb-3 min-width-set">
					<a class="btn btn-lg btn-outline-success" style="width: 100%;" href="<c:url value="/registView" />">회원가입하기</a>
				</div>
			</div>
		</div>
	</div>
	<div class="space"></div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

</html>