<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.css">

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
    .photoTitle {
        font-weight: bold;
        font-size: 28px;
        color: black;
        margin-top: 20px;
    }
    .subContents {
        font-size: 20px;
    }
    /* Carousel styling */
    .carousel-inner {
        text-align: center;
    }
    .photo-section-wrapper {
        background-color: #17a065;
        padding: 40px 5vw;
    }

    /* 카드 크기 50% 확대 */
    .photo-item {
        background-color: white;
        border-radius: 10px;
        overflow: hidden;
        text-align: center;
        width: 330px;
        height: 450px;
        padding: 15px;
        margin: auto;
    }

    .photo-item a {
        text-decoration: none;
        color: inherit;
        display: block;
    }

    .photo-item a:hover {
        cursor: pointer;
    }

    .photo-item img {
        width: 100%;
        height: 380px;
        object-fit: cover;
        border-radius: 10px;
        transition: transform 0.3s ease;
    }

    .photo-item a img:hover {
        transform: scale(1.05);
    }

    .photo-title {
        color: #333;
        font-weight: bold;
        margin-top: 10px;
        font-size: 20px;
    }

    /* Carousel Controls 위치 조정 및 크기 확대 */
    .carousel-control-prev, .carousel-control-next {
        width: 7%; /* 버튼 크기 증가 */
        height: 7%; /* 버튼 크기 증가 */
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
    }

    .carousel-control-prev {
        left: calc(50% - 280px); /* 카드 왼쪽에서 100px 간격 */
    }

    .carousel-control-next {
        right: calc(50% - 280px); /* 카드 오른쪽에서 100px 간격 */
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
    
    <!-- Carousel for 5 Cards with Green Background -->
    <div class="photo-section-wrapper">
        <div id="photoCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-inner">
                <!-- 에너지 절약 -->
                <div class="carousel-item active">
                    <div class="photo-item">
                        <a href="${pageContext.request.contextPath}/energyReduceView">
                            <img src="${pageContext.request.contextPath}/resources/image/box1.jpg" class="img-fluid rounded" alt="에너지 절약">
                            <p class="photo-title">에너지 절약</p>
                        </a>
                    </div>
                </div>
                <!-- 친환경 소비 -->
                <div class="carousel-item">
                    <div class="photo-item">
                        <a href="링크2을_여기에_넣으세요">
                            <img src="${pageContext.request.contextPath}/resources/image/box2.jpg" class="img-fluid rounded" alt="친환경 소비">
                            <p class="photo-title">친환경 소비</p>
                        </a>
                    </div>
                </div>
                <!-- 친환경 이동 -->
                <div class="carousel-item">
                    <div class="photo-item">
                        <a href="링크3을_여기에_넣으세요">
                            <img src="${pageContext.request.contextPath}/resources/image/box3.jpg" class="img-fluid rounded" alt="친환경 이동">
                            <p class="photo-title">친환경 이동</p>
                        </a>
                    </div>
                </div>
                <!-- 자원순환 -->
                <div class="carousel-item">
                    <div class="photo-item">
                        <a href="링크4를_여기에_넣으세요">
                            <img src="${pageContext.request.contextPath}/resources/image/box4.jpg" class="img-fluid rounded" alt="자원순환">
                            <p class="photo-title">자원순환</p>
                        </a>
                    </div>
                </div>
                <!-- 흡수원 보호 -->
                <div class="carousel-item">
                    <div class="photo-item">
                        <a href="링크5를_여기에_넣으세요">
                            <img src="${pageContext.request.contextPath}/resources/image/box5.jpg" class="img-fluid rounded" alt="흡수원 보호">
                            <p class="photo-title">흡수원 보호</p>
                        </a>
                    </div>
                </div>
            </div>
            <!-- Carousel Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#photoCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">이전</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#photoCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">다음</span>
            </button>
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
