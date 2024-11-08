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

				<!-- 비밀번호 찾기 폼 -->
				<form id="pwFindFrom" action="<c:url value="/pwFindDo" />" method="POST" class="needs-validation" novalidate>

					<!-- 이름 입력창 -->
					<div class="form-floating mb-3 input-div">
						<input class="form-control" id="inputName" type="text" name="userName" placeholder="이름" />
						<label for="inputName">이름</label>
					</div>

					<!-- 아이디 입력창 -->
					<div class="form-floating mb-3 input-div">
						<input class="form-control" id="inputId" type="text" name="userId" placeholder="이름" />
						<label for="inputId">아이디</label>
					</div>

					<!-- 이메일 입력창 -->
					<div class="d-flex">
						<div class="form-floating mb-3 input-div">
							<input class="form-control" id="inputEmail" type="email" name="userEmail" placeholder="이메일" required>
							<label for="inputEmail">이메일</label>
							<div id="emailFeedback" class="invalid-feedback">올바르지 않은 이메일 형식입니다</div>
						</div>
						<div class="d-flex align-items-center btn-div-doc-div mb-3">
							<button type="button" id="sendAuthEmail" class="btn btn-secondary">인증메일 발송</button>
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

					<!-- 비밀번호 찾기 버튼 -->
					<div class="d-flex justify-content-center mb-3">
						<button id="pwFindBtn" class="btn btn-success btn-lg" type="submit" disabled>비밀번호 찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="space"></div>
	<div class="space"></div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
	// 비밀번호찾기 버튼
	const v_pwFindBtn = document.getElementById("pwFindBtn")
	
	// 회원 가입 버튼 활성화
	function pwFindBtnSet(){
		if(userEmailInput.classList.contains("is-valid") && userEmailAuthInput.classList.contains("is-valid")){
			v_pwFindBtn.disabled = false
		}else{
			v_pwFindBtn.disabled = true
		}
	}
	
	// 회원 가입
	v_pwFindBtn.addEventListener("click",()=>{
		if(userEmailInput.classList.contains("is-valid") && userEmailAuthInput.classList.contains("is-valid")){
			document.getElementById("registForm").submit()
		}else{
			alert("유효하지 않은 항목이 포함되어있습니다.\n항목을 확인하고 다시한번 시도하여 주세요.")
			return
		}
	})
	
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
    	pwFindBtnSet()
    })
    
    // 항목을 입력할 때 마다 유효성 검사 진행
	document.addEventListener('DOMContentLoaded', function() {
		function validateUserEmail(input){
			const userEmailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
			return userEmailPattern.test(input.value)
		}
		
		function applyValidation(input, isValid) {
			input.classList.toggle('is-valid', isValid)
			input.classList.toggle('is-invalid', !isValid)
		}
		
		userEmailInput.addEventListener("input",()=>{
			userEmailInput.classList.remove("is-valid")
			document.getElementById("emailAuthDiv").classList.add("d-none")
			userEmailAuthInput.value = ""
		})
		
		// eamil 인증 메일 쿼리 Url
		const v_authEmailSendUrl = "<c:url value='/authEmailSend' />"
		
		document.getElementById("sendAuthEmail").addEventListener("click",()=>{
			if(!validateUserEmail(userEmailInput)){
				applyValidation(userEmailInput, false)
				pwFindBtnSet()
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
				pwFindBtnSet()
			}
		})
	})
	</script>
</body>

</html>