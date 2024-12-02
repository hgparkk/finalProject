<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<style type="text/css">
.campaign-write-container {
	width: 500px;
	margin: auto;
	padding: 2vw;
	border: 1px solid black;
	position: relative;
}

.spinner-container {
    position: absolute;
    transform: translate(660%, 125%);
    z-index: 9999;
    display: none;
}

.spinner-border {
    width: 7vw !important;
    height: 7vw !important;
    border-width: 0.3em;
}
</style>
<script
	src="https://www.gstatic.com/firebasejs/10.12.5/firebase-app-compat.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/10.12.5/firebase-storage-compat.js"></script>
<script src="js/firebaseconfig.js"></script>
</head>

<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<div style="height: 5vh;"></div>

	<div class="spinner-container"
		style="display: none; text-align: center;">
		<div class="spinner-border" role="status">
			<span class="visually-hidden">Loading...</span>
		</div>
	</div>

	<div class="campaign-write-container">
		<form action="${pageContext.request.contextPath }/campaignWriteDo"
			method="POST" id="campaignRegistBtn">
			<div class="form-floating mb-3">
				<input class="form-control" id="inputTitle" type="text"
					name="campaignTitle" placeholder="제목" required>
				<label for="inputTitle">제목</label>
			</div>
			<div class="form-floating mb-3">
				<input class="form-control" id="inputUrl" type="text"
					name="campaignUrl" placeholder="url" required>
				<label for="inputUrl">url</label>
			</div>
			<input id="imgUrl" name="campaignImg" type="hidden" type="text">
		</form>
		<div>
			<label for="formFile"
				class="form-label d-flex justify-content-center"
				style="text-align: left;">이미지 파일첨부</label>
			<input class="form-control mb-3" name="boFile" type="file"
				id="formFile" accept="image/*" required>
		</div>
		<!-- 등록 버튼 -->
		<div class="d-flex justify-content-center">
			<button id="campaignWriteBtn" class="btn btn-secondary" type="button">캠페인
				등록</button>
		</div>
	</div>

	<div style="height: 5vh;"></div>

	<!-- footer 부분 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>

<script type="text/javascript">
const storage = firebase.storage();

	document.getElementById("campaignWriteBtn").addEventListener('click', ()=>{
		if(confirm("해당 내용의 캠페인을 등록하시겠습니까?")){
			if(document.getElementById("inputTitle").value.trim() == ""){
				alert("제목을 입력해주세요")
				return
			}else if(document.getElementById("inputUrl").value.trim() ==""){
				alert("url을 입력해주세요")
				return
			}else if(document.getElementById("formFile").value ==""){
				alert("img를 첨부해주세요")
				return
			}
			
			// 첨부된 이미지 파일
			let v_inputFile = document.getElementById("formFile").files[0]
			
			if(!v_inputFile['type'].startsWith('image/')){
				alert("img파일을 첨부해주세요")
				return
			}
			
			// 스피너 보이기
	        document.querySelector(".spinner-container").style.display = "block";

			// 첨부될 이미지 파일의 이름
			let v_imgName = makeUniqueId() + v_inputFile['type'].replace('image/', '.');
			console.log(v_imgName)

			// Storage 내 폴더의 경로까지 파일명에 추가해줌
			let v_imgPath = "profile/" + v_imgName; // Storage에 profile 폴더가 생성되면서 이미지가 저장됨

			let storageRef = storage.ref();
			let path = storageRef.child(v_imgPath);
			let upload = path.put(v_inputFile); // 실제 저장될 이미지 파일 넣기 (실제 firebase Storage에 요청)

			// upload 객체의 상태변화를 감지하여 콜백함수 지정
			upload.on('state_changed',
				() => {
					// 첫번째 익명함수는 업로드 진행중 동작하는 함수
					console.log('업로드 중...')
					
				},
				(err) => {
					// 두번째 익명함수는 업로드 실패시 동작하는 함수
					console.log('업로드 에러 발생', err)
				},
				() => {
					// 세번째 익명함수는 업로드 성공시(끝난 후) 동작하는 함수
					
					// Storage에 업로드된 이미지 파일에 대한 URL 링크 가져옴
					upload.snapshot.ref.getDownloadURL()
						.then((url) => {
							document.getElementById("imgUrl").value = url
							// 업로드 완료 후 스피너 숨기기
		                   	document.querySelector(".spinner-container").style.display = "none";
							document.getElementById("campaignRegistBtn").submit();
						})
				})
		}
	});
</script>
</html>