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
	<div class="pt-5">
		<div class="row justify-content-center">
			<div class="mt-5 user-rounded-box rounded-5">
				<div style="margin: 150px;">
					<!-- 회원가입 폼 -->
					<form id="registForm" action="<c:url value="/registDo" />" method="POST" class="needs-validation" novalidate>

						<!-- 아이디 입력창 -->
						<div class="d-flex">
							<div class="form-floating mb-3 input-div">
								<input class="form-control" id="inputId" type="text" name="userId" placeholder="아이디" required>
								<label for="inputId">아이디</label>
								<div id="idFeedback" class="invalid-feedback">아이디는 소문자로 시작하는 영문, 숫자로만 이루어진 6글자 이상이어야 합니다.</div>
							</div>
							<div class="d-flex align-items-center btn-div-doc-div mb-3">
								<button type="button" id="idDupCheckBtn" class="btn btn-secondary" disabled>중복확인</button>
							</div>
						</div>

						<!-- 아이디 중복체크 -->
						<div id="idDupCheckDiv">
							<span id="idDupCheck"></span>
						</div>

						<!-- 비밀번호 입력창 -->
						<div class="form-floating mb-3 input-div">
							<input class="form-control" id="inputPw" type="password" name="userPw" placeholder="비밀번호" required>
							<label for="inputPw">비밀번호</label>
							<div class="invalid-feedback">비밀번호는 영문 소문자가 포함된 숫자,영문,특수문자로만 이루어진 8글자 이상여야 합니다.</div>
						</div>

						<!-- 비밀번호 확인 입력창 -->
						<div class="form-floating mb-3 input-div">
							<input class="form-control" id="inputCheckPw" type="password" placeholder="비밀번호확인">
							<label for="inputCheckPw">비밀번호확인</label>
						</div>

						<!-- 이름 입력창 -->
						<div class="form-floating mb-3 input-div">
							<input class="form-control" id="inputName" type="text" name="userName" placeholder="이름" required>
							<label for="inputName">이름</label>
							<div class="invalid-feedback">이름은 숫자, 특수문자를 포함하지 않습니다</div>
						</div>

						<!-- 이메일 입력창 -->
						<div class="d-flex">
							<div class="form-floating mb-3 input-div">
								<input class="form-control" id="inputEmail" type="text" name="userEmail" placeholder="이메일" required>
								<label for="inputEmail">이메일</label>
								<div id="emailFeedback" class="invalid-feedback">올바르지 않은 이메일 형식입니다</div>
							</div>
							<div class="d-flex align-items-center btn-div-doc-div mb-3">
								<button type="button" id="sendAuthEmail" class="btn btn-secondary" disabled>인증메일 발송</button>
							</div>
						</div>

						<!-- 이메일 인증코드 확인창 -->
						<div id="emailAuthDiv" class="d-none">
							<div class="mb-3">
								<span class="ms-2 text-success">인증 메일이 발송되었습니다.</span>
							</div>
							<div class="form-floating mb-3 input-div">
								<input class="form-control" id="inputEmailAuth" type="text" placeholder="인증번호" required>
								<label for="inputEmailAuth">인증번호</label>
								<div class="invalid-feedback"></div>
							</div>
						</div>

						<!-- 회원가입 버튼 -->
						<div class="d-flex justify-content-center">
							<button id="registBtn" class="btn btn-success btn-lg" type="button" disabled>회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="space"></div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
	
	// 가입버튼
	const v_registBtn = document.getElementById("registBtn")
	
	// 회원 가입 버튼 활성화
	function registerBtnSet(){
		if(userIdInput.classList.contains("is-valid") && userPwInput.classList.contains("is-valid") && userCheckPwInput.classList.contains("is-valid") && userNameInput.classList.contains("is-valid") && userEmailInput.classList.contains("is-valid") && userEmailAuthInput.classList.contains("is-valid")){
			v_registBtn.disabled = false
		}else{
			v_registBtn.disabled = true
		}
	}
	
	// 회원 가입
	v_registBtn.addEventListener("click",()=>{
		if(userIdInput.classList.contains("is-valid") && userPwInput.classList.contains("is-valid") && userCheckPwInput.classList.contains("is-valid") && userNameInput.classList.contains("is-valid") && userEmailInput.classList.contains("is-valid") && userEmailAuthInput.classList.contains("is-valid")){
			document.getElementById("registForm").submit()
		}else{
			alert("유효하지 않은 항목이 포함되어있습니다.\n항목을 확인하고 다시한번 시도하여 주세요.")
			return
		}
	})
	
	// 아이디 입력 창
	const userIdInput = document.getElementById('inputId')
	
	// 비밀번호 입력 창
    const userPwInput = document.getElementById('inputPw')
    
    // 비밀번호 확인 입력 창
    const userCheckPwInput = document.getElementById('inputCheckPw')
    
    // 이름 입력 창
    const userNameInput = document.getElementById('inputName')
    
    // 이메일 입력 창
    const userEmailInput = document.getElementById('inputEmail')
    
    // 이메일 인증코드 일치 여부
    const userEmailAuthInput = document.getElementById("inputEmailAuth")
    let v_emailAuth = ""
    userEmailAuthInput.addEventListener("input",()=>{
    	if(v_emailAuth != null && v_emailAuth == userEmailAuthInput.value){
    		userEmailAuthInput.classList.add("is-valid")
    	}else{
    		userEmailAuthInput.classList.remove("is-valid")
    	}
    	registerBtnSet()
    })
	
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
			return (userPwInput.value !="" && userCheckPwInput.value == userPwInput.value)
		}
		
		userIdInput.addEventListener("input",()=>{
			userIdInput.classList.remove("is-valid")
			if(!validateUserId(userIdInput)){
				userIdInput.classList.add("is-invalid")
				document.getElementById("dupCheckBtn").disabled = true
			}else{
				userIdInput.classList.remove("is-invalid")
				document.getElementById("idDupCheckBtn").disabled = false
			}
			document.getElementById("idDupCheckDiv").classList.remove("mb-3")
			document.getElementById("idDupCheck").classList.remove("text-success")
			document.getElementById("idDupCheck").classList.remove("ms-2")
			document.getElementById("idDupCheck").innerHTML = ""
		})
		
		// id 체크 쿼리 Url
		const v_idDupChecklUrl = "<c:url value='/idDupCheck' />"
		
		// ID 중복 체크 확인 함수
		document.getElementById("idDupCheckBtn").addEventListener("click",()=>{
			$.ajax({
				type:'POST',
				url: v_idDupChecklUrl,
				data: { "inputId": userIdInput.value},
				success: function(result){
					if(result){
						document.getElementById("idFeedback").innerHTML = "중복되는 아이디가 존재합니다."
						applyValidation(userIdInput, false)
						registerBtnSet()
					}else{
						document.getElementById("idDupCheckDiv").classList.add("mb-3")
						document.getElementById("idDupCheck").classList.add("text-success")
						document.getElementById("idDupCheck").classList.add("ms-2")
						document.getElementById("idDupCheck").innerHTML = "사용 가능한 아이디 입니다."
						applyValidation(userIdInput, true)
						registerBtnSet()
					}
				}
			})
		})
		
		userPwInput.addEventListener("input",()=>{
			applyValidation(userPwInput, validateUserPw(userPwInput))
			applyValidation(userCheckPwInput, checkPwValidation())
			registerBtnSet()
		})
		
		userCheckPwInput.addEventListener("input",()=>{
			applyValidation(userCheckPwInput, checkPwValidation())
			registerBtnSet()
		})
		
		userNameInput.addEventListener("input",()=>{
			applyValidation(userNameInput, validateUserName(userNameInput))
			registerBtnSet()
		})
		
		userEmailInput.addEventListener("input",()=>{
			userEmailInput.classList.remove("is-valid")
			document.getElementById("emailAuthDiv").classList.add("d-none")
			userEmailAuthInput.value = ""
			if(!validateUserEmail(userEmailInput)){
				userEmailInput.classList.add("is-invalid")
				document.getElementById("sendAuthEmail").disabled = true
			}else{
				userEmailInput.classList.remove("is-invalid")
				document.getElementById("sendAuthEmail").disabled = false
			}
		})
		
		// eamil 체크 쿼리 Url
		const v_emailDupChecklUrl = "<c:url value='/emailDupCheck' />"
		
		// eamil 인증 메일 쿼리 Url
		const v_authEmailSendUrl = "<c:url value='/authEmailSend' />"
		
		document.getElementById("sendAuthEmail").addEventListener("click",()=>{
			$.ajax({
				type:'POST',
				url: v_emailDupChecklUrl,
				data: { "inputEmail": userEmailInput.value},
				success: function(result){
					if(result){
						document.getElementById("emailFeedback").innerHTML = "이미 등록된 이메일입니다. 다른 메일주소를 사용하여 주세요."
						applyValidation(userEmailInput, false)
						registerBtnSet()
					}else{
						$.ajax({
							type:'POST',
							url: v_authEmailSendUrl,
							data: { "inputEmail": userEmailInput.value},
							success: function(result){
								if(result != "fail"){
									v_emailAuth = result;
									applyValidation(userEmailInput, true)
									document.getElementById("emailAuthDiv").classList.remove("d-none")
								}else{
									applyValidation(userEmailInput, false)
									document.getElementById("emailFeedback").innerHTML = "인증 메일을 보내는데 실패하였습니다. 메일을 다시한번 확인하여 주세요."
								}
							}
						})
						registerBtnSet()
					}
				}
			})
		})
	})
    </script>
</body>

</html>