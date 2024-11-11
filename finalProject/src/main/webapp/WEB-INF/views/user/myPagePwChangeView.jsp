<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.menu_box {
	min-width: 173.267px;
	padding: 25px;
}

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
			<jsp:param value="pwChange" name="selectedItem" />
		</jsp:include>
		<div class="d-flex justify-content-center" style="width: 100%; min-width: 800px;">
			<div class="d-flex flex-column" style="height: 800px;">
				<div class="fs-1 text-center" style="margin-top: 100px;">비밀번호 변경</div>
				<div class="mt-3" style="width: 600px;">
					<div style="margin-top: 150px; margin-left: 150px; margin-right: 150px;">

						<!-- 비밀번호 변경 폼 -->
						<form id="pwChangeForm" action="<c:url value="/pwChangeDo" />" method="POST" class="needs-validation" novalidate>

							<!-- 현재 비밀번호 입력창 -->
							<div class="form-floating mb-3 input-div">
								<input class="form-control" id="nowPassword" type="password" name="nowPassword" placeholder="현재 비밀번호" />
								<label for="nowPassword">현재 비밀번호</label>
							</div>

							<!-- 새 비밀번호 입력창 -->
							<div class="form-floating mb-3 input-div">
								<input class="form-control" id="newPassword" type="password" name="newPassword" placeholder="새 비밀번호" required>
								<label for="newPassword">새 비밀번호</label>
								<div class="invalid-feedback">비밀번호는 영문 소문자가 포함된 숫자,영문,특수문자로만 이루어진 8글자 이상여야 합니다.</div>
							</div>

							<!-- 새 비밀번호 확인 입력창 -->
							<div class="form-floating mb-3 input-div">
								<input class="form-control" id="newPasswordCheck" type="password" placeholder="새 비밀번호 확인" required>
								<label for="newPasswordCheck">새 비밀번호 확인</label>
								<div class="invalid-feedback"></div>
							</div>

							<!-- 비밀번호 변경 버튼 -->
							<div class="d-flex justify-content-center mb-3">
								<button id="pwChangeBtn" class="btn btn-success btn-lg" type="button" disabled>비밀번호 변경</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
	// 가입버튼
	const pwChangeBtn = document.getElementById("pwChangeBtn")

	// 비밀번호 변경 버튼 활성화
	function pwChangeBtnSet() {
		if (newPassword.classList.contains("is-valid") && newPasswordCheck.classList.contains("is-valid")) {
			pwChangeBtn.disabled = false
		} else {
			pwChangeBtn.disabled = true
		}
	}
	
	// 비밀번호 변경
	pwChangeBtn.addEventListener("click",()=>{
		if(newPassword.classList.contains("is-valid") && newPasswordCheck.classList.contains("is-valid")){
			document.getElementById("pwChangeForm").submit()
		}else{
			alert("유효하지 않은 항목이 포함되어있습니다.\n항목을 확인하고 다시한번 시도하여 주세요.")
			return
		}
	})
	
	// 비밀번호 입력 창
    const newPassword = document.getElementById('newPassword')
    
    // 비밀번호 확인 입력 창
    const newPasswordCheck = document.getElementById('newPasswordCheck')
	    
	    // 항목을 입력할 때 마다 유효성 검사 진행
	document.addEventListener('DOMContentLoaded', function() {
		function validateUserPw(input){
			const userPwPattern = /^(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$/
			return userPwPattern.test(input.value)
		}

		function applyValidation(input, isValid) {
			input.classList.toggle('is-valid', isValid)
			input.classList.toggle('is-invalid', !isValid)
		}
		
		function checkPwValidation(){
			return (newPassword.value !="" && newPasswordCheck.value == newPassword.value)
		}
		
		newPassword.addEventListener("input",()=>{
			applyValidation(newPassword, validateUserPw(newPassword))
			applyValidation(newPasswordCheck, checkPwValidation())
			pwChangeBtnSet()
		})
		
		newPasswordCheck.addEventListener("input",()=>{
			applyValidation(newPasswordCheck, checkPwValidation())
			pwChangeBtnSet()
		})
	})
	</script>
</body>

</html>