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
			<div class="fs-1 text-center">아이디 찾기</div>
			<div class="mt-5 user-rounded-box rounded-5">
				<div style="margin-top: 150px; margin-left: 150px; margin-right: 150px;">

					<!-- 아이디 찾기 폼 -->
					<form id="idFindForm" action="<c:url value="/idFindDo" />" method="POST">

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
							<button id="idFindBtn" class="btn btn-success btn-lg" style="width: 100%;" type="button">아이디 찾기</button>
						</div>
					</form>

					<div id="idFindResultDiv" class="mt-5 mb-3 d-flex justify-content-center d-none">
						<span id="idFindResult" class="fs-4 fw-bold"></span>
					</div>

					<div class="d-flex justify-content-evenly" style="margin-top: 50px; margin-bottom: 50px;">
						<a class="text-black local-text-btn" href="<c:url value="/loginView" />">로그인 하러가기</a>
						<a class="text-black local-text-btn" href="<c:url value="/pwFindView" />">비밀번호 찾기</a>
						<a class="text-black local-text-btn" href="<c:url value="/registView" />">회원가입 하기</a>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="space"></div>
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script>
	let idFindForm = $("#idFindForm")
	let idFindFormUrl = idFindForm.attr("action")
	
	document.getElementById("idFindBtn").addEventListener("click",()=>{
		let idFindFormData = idFindForm.serialize();
		$.ajax({
			type:'POST',
			url: idFindFormUrl,
			data: idFindFormData,
			success: function(result){
				let v_result = ""
				if(result == "null"){
					v_result = "일치하는 아이디가 존재하지 않습니다."
					document.getElementById("idFindResult").innerHTML = "중복되는 아이디가 존재합니다."
				}else{
					v_result = '해당 아이디는 <span class="text-success">' + result.substring(0,result.length-2) + '**</span>' + ' 입니다.';
				}
				
				document.getElementById("idFindResultDiv").classList.remove("d-none");
				document.getElementById("idFindResult").innerHTML = v_result;
			}
		})
	})
	</script>
</body>

</html>