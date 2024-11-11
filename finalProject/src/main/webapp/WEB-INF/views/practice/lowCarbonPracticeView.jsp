<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Noto Sans KR 폰트 임포트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<!-- 헤더 인클루드 파일 -->
<%@ include file="/WEB-INF/inc/header.jsp"%>

<!-- Locomotive Scroll CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.css">

<style>
    html, body {
        overflow-y: scroll;
        overflow-x: hidden;
        background-color: #f4f7f6;
        font-family: 'Noto Sans KR', sans-serif;
    }
    [data-scroll-container] {
        overflow: visible;
    }
    .container {
        padding: 50px;
    }
    .title h1 {
        font-size: 60px;
        color: rgb(23, 160, 101);
        line-height: 1.2;
        font-weight: 700;
    }
    .subStart {
        font-size: 28px;
        color: green;
        font-weight: 700;
        margin-left: 10px;
    }
    .carbon-leaf-img {
        width: 30px;
        margin-bottom: 5px;
    }
    .textStress {
        color: green;
        text-decoration-line: underline;
        font-weight: bold;
    }
    .photo-section-wrapper {
        background-color: #17a065;
        width: 100vw;
        margin-left: calc(-50vw + 50%);
        padding: 40px 0;
        position: relative;
    }
    .photo-item {
        background-color: white;
        border-radius: 10px;
        overflow: hidden;
        padding: 20px;
        text-align: center;
        margin: 15px; /* 각 상자 사이의 간격 추가 */
    }
    .photo-item img {
        width: 100%;
        height: 220px;
        object-fit: cover;
        border-radius: 10px;
        transition: transform 0.3s ease;
    }
    .photo-item img:hover {
        transform: scale(1.05);
    }
    .photo-title {
        color: #333;
        font-weight: bold;
        margin-top: 15px;
        font-size: 18px;
    }
    .photoTitle {
        font-weight: bold;
        font-size: 28px;
        color: black;
    }
    .subContents{
    	font-size: 20px;
    }
</style>
</head>
<body data-scroll-container>
    <!-- 탑 인클루드 파일 -->
    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <div class="container text-center" data-scroll>
        <!-- 제목 -->
        <div class="title mb-5">
            <h1 style="color: black;">탄소중립</h1>
            <h1>생활 실천하기</h1>
        </div>

        <!-- 서브 제목 -->
        <div class="d-flex align-items-center justify-content-center mb-3 mt-5" data-scroll>
            <img src="${pageContext.request.contextPath}/resources/image/carbon_leaf.png" class="carbon-leaf-img">
            <h1 class="subStart">탄소중립,</h1>
        </div>

        <!-- 서브 텍스트 -->
        <div class="subContents mb-5 mt-5" data-scroll>
            <p>이미 많이 알고 계시지만 선뜻 실천하기 어려웠던 순간들이 많으셨죠?</p>
            <p>탄소중립 실천포털에서는 실생활에서 적극적으로 실천할 수 있도록</p>
            <p class="textStress">에너지, 소비, 수송, 자원순환, 흡수원 5대 분야별로 분류해</p>
            <p>구체적인 방안을 소개하고 있어요. 이제 일상 속에서 쉽게 탄소중립 생활을 실천해보세요!</p>
        </div>
		
		<div style="padding-top:10px"></div>
		
		<div class="photoTitle">
		<span>탄소중립 생활 실천</span>
		<span style="color: green;">5대 분야</span>
		</div>

    </div>
    
    <!-- 5개 섹션 사진 -->
    <div class="photo-section-wrapper" data-scroll>
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-md-4 col-lg-2 photo-item d-flex flex-column align-items-center justify-content-center">
                    <img src="${pageContext.request.contextPath}/resources/image/box1.jpg" class="img-fluid rounded">
                    <p class="photo-title">에너지 절약</p>
                </div>
                <div class="col-md-4 col-lg-2 photo-item d-flex flex-column align-items-center justify-content-center">
                    <img src="${pageContext.request.contextPath}/resources/image/box2.jpg" class="img-fluid rounded">
                    <p class="photo-title">친환경 소비</p>
                </div>
                <div class="col-md-4 col-lg-2 photo-item d-flex flex-column align-items-center justify-content-center">
                    <img src="${pageContext.request.contextPath}/resources/image/box3.jpg" class="img-fluid rounded">
                    <p class="photo-title">친환경 이동</p>
                </div>
                <div class="col-md-4 col-lg-2 photo-item d-flex flex-column align-items-center justify-content-center">
                    <img src="${pageContext.request.contextPath}/resources/image/box4.jpg" class="img-fluid rounded">
                    <p class="photo-title">자원순환</p>
                </div>
                <div class="col-md-4 col-lg-2 photo-item d-flex flex-column align-items-center justify-content-center">
                    <img src="${pageContext.request.contextPath}/resources/image/box5.jpg" class="img-fluid rounded">
                    <p class="photo-title">흡수원 보호</p>
                </div>
            </div>
        </div>
    </div>

    <!-- footer 인클루드 파일 -->
    <%@ include file="/WEB-INF/inc/footer.jsp"%>

    <!-- Locomotive Scroll 및 Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.js"></script>
    <script>
        const scroll = new LocomotiveScroll({
            el: document.querySelector('[data-scroll-container]'),
            smooth: true,
            inertia: 0.75
        });
    </script>
</body>
</html>
