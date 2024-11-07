<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.btn-div-doc-div {
	height: 58px;
	display: flex;
	align-items: center;
	margin-left: 15px;
}
</style>
</head>

<body>
	<div class="pt-5">
		<div class="row justify-content-center">
			<div class="mt-5" style="width: 500px;">
				<!-- 회원가입 폼 -->
				<form id="registForm" action="<c:url value="/registDo" />" method="POST" class="needs-validation" novalidate>

					<div class="d-flex">
						<div style="width: 333px;">
							<!-- ID 입력창 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="inputId" type="text" name="userId" placeholder="아이디" required>
								<label for="inputId">아이디</label>
								<div id="idFeedback" class="invalid-feedback">아이디는 소문자로 시작하는 영문, 숫자로만 이루어진 6글자 이상이어야 합니다.</div>
							</div>

							<!-- 아이디 중복체크 -->
							<div class="mb-3">
								<span id="dupCheck"></span>
							</div>

							<!-- PW 입력창 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="inputPw" type="password" name="userPw" placeholder="비밀번호" required>
								<label for="inputPw">비밀번호</label>
								<div class="invalid-feedback">비밀번호는 영문 소문자가 포함된 숫자,영문,특수문자로만 이루어진 8글자 이상여야 합니다.</div>
							</div>

							<!-- PW확인 입력창 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="inputCheckPw" type="password" placeholder="비밀번호확인">
								<label for="inputCheckPw">비밀번호확인</label>
							</div>

							<!-- Name 입력창 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="inputName" type="text" name="userName" placeholder="이름" required>
								<label for="inputName">이름</label>
								<div class="invalid-feedback">이름은 숫자, 특수문자를 포함하지 않습니다</div>
							</div>

							<!-- email 입력창 -->
							<div class="form-floating mb-3">
								<input class="form-control" id="inputEmail" type="email" name="userEmail" placeholder="이메일" required>
								<label for="inputEmail">이메일</label>
								<div class="invalid-feedback">올바르지 않은 이메일 형식입니다</div>
							</div>
						</div>

						<div style="width: 143px;">
							<div class="d-flex align-items-center btn-div-doc-div mb-3">
								<button type="button" id="dupChecKBtn" class="btn btn-secondary">중복확인</button>
							</div>
							<div class="btn-div-doc-div mb-3"></div>
							<div class="btn-div-doc-div mb-3"></div>
							<div class="btn-div-doc-div mb-3"></div>
							<div class="d-flex align-items-center btn-div-doc-div mb-3">
								<button type="button" id="sendAuthEmail" class="btn btn-secondary">인증메일 발송</button>
							</div>
						</div>
					</div>

					<!-- 회원가입 버튼 -->
					<div class="d-flex justify-content-center">
						<button id="registBtn" class="btn btn-primary btn-lg" type="button" disabled>회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	
	// 가입버튼
	const v_registBtn = document.getElementById("registBtn")
	
	// ID 중복 여부
	let v_dupCheck = false
	
	// ID 중복 여부 결과
	const v_dupCheckSpan = document.getElementById("dupCheck")
	
	// ID 체크 쿼리 Url
	const v_dupCheckUrl = "<c:url value='/idDupCheck' />"
	
	// 회원 가입 버튼 활성화
	function registerButtonSet(){
		if(userIdInput.classList.contains("is-valid") && userPwInput.classList.contains("is-valid") && userCheckPwInput.classList.contains("is-valid") && userNameInput.classList.contains("is-valid") && userEmailInput.classList.contains("is-valid")){
			v_registBtn.disabled = false
		}else{
			v_registBtn.disabled = true
		}
	}
	
	// 회원 가입
	v_registBtn.addEventListener("click",()=>{
		if(userIdInput.classList.contains("is-valid") && userPwInput.classList.contains("is-valid") && userCheckPwInput.classList.contains("is-valid") && userNameInput.classList.contains("is-valid") && userEmailInput.classList.contains("is-valid")){
			document.getElementById("registForm").submit()
		}else{
			alert("유효하지 않은 항목이 포함되어있습니다.\n항목을 확인하고 다시한번 시도하여 주세요.")
			return
		}
	})
	
	// 아이디 입력 창
	const userIdInput = document.getElementById('inputId')
	
	userIdInput.addEventListener("input",()=>{
		userIdInput.classList.remove("is-valid")
		document.getElementById("dupCheck").classList.remove("text-success")
		document.getElementById("dupCheck").classList.remove("ms-2")
		document.getElementById("dupCheck").innerHTML = ""
	})
	
	// 비밀번호 입력 창
    const userPwInput = document.getElementById('inputPw')
    
    // 비밀번호 확인 입력 창
    const userCheckPwInput = document.getElementById('inputCheckPw')
    
    // 이름 입력 창
    const userNameInput = document.getElementById('inputName')
    
    // 이메일 입력 창
    const userEmailInput = document.getElementById('inputEmail')
	
	// 항목을 입력할 때 마다 유효성 검사 진행
	document.addEventListener('DOMContentLoaded', function() {
		function validateUserId(input){
			const userIdPattern = /^[a-z][a-zA-Z0-9]{5,}$/
			return userIdPattern.test(input.value)
		}
		
		function validateUserPw(input){
			const userPwPattern = /^(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$/
			return userPwPattern.test(input.value)
		}
		
		function validateUserName(input){
			const userNamePattern = /^[가-힣a-zA-Z]*$/
			return userNamePattern.test(input.value)
		}
		
		function validateUserEmail(input){
			const userEmailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
			return userEmailPattern.test(input.value)
		}
		
		function applyValidation(input, isValid) {
			input.classList.toggle('is-valid', isValid)
			input.classList.toggle('is-invalid', !isValid)
		}
		
		function checkPwValidation(){
			return userCheckPwInput.value == userPwInput.value
		}
		
		// ID 중복 체크 확인 함수
		document.getElementById("dupChecKBtn").addEventListener("click",()=>{
			if(validateUserId(userIdInput)){
				$.ajax({
					type:'POST',
					url: v_dupCheckUrl,
					data: { "inputId": userIdInput.value},
					success: function(result){
						if(result){
							idFeedback.innerHTML = "중복되는 아이디가 존재합니다."
							applyValidation(userIdInput, false)
							registerButtonSet()
						}else{
							document.getElementById("dupCheck").classList.add("text-success")
							document.getElementById("dupCheck").classList.add("ms-2")
							document.getElementById("dupCheck").innerHTML = "사용 가능한 아이디 입니다."
							applyValidation(userIdInput, true)
							registerButtonSet()
						}
					}
				})
			}else{
				applyValidation(userIdInput, validateUserId(userIdInput))
			}
			registerButtonSet()
		})
		
		userPwInput.addEventListener("input",()=>{
			applyValidation(userPwInput, validateUserPw(userPwInput))
			applyValidation(userCheckPwInput, checkPwValidation())
			registerButtonSet()
		})
		
		userCheckPwInput.addEventListener("input",()=>{
			applyValidation(userCheckPwInput, checkPwValidation())
			registerButtonSet()
		})
		
		userNameInput.addEventListener("input",()=>{
			applyValidation(userNameInput, validateUserName(userNameInput))
			registerButtonSet()
		})
		
		document.getElementById("sendAuthEmail").addEventListener("click",()=>{
			applyValidation(userEmailInput, validateUserEmail(userEmailInput))
			registerButtonSet()
		})
	});
    </script>
</body>

</html>