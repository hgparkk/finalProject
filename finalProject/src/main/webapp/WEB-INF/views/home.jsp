<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Coding Bamboo</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <%@ include file="/WEB-INF/inc/header.jsp"%>

    <!-- Locomotive Scroll CSS 추가 -->
    <link rel="stylesheet" href="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.css">

    <style>
        /* Locomotive Scroll 적용을 위한 스타일 */
        html, body {
            overflow: hidden; /* Locomotive Scroll이 적용되면 브라우저 기본 스크롤 비활성화 */
        }

        /* 페이지 전체 스크롤 부드럽게 설정 */
        .image-container {
            position: relative;
            width: 100vw;
            height: 500px;
            overflow: hidden;
        }

        .image-container img {
            width: 100vw;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.75);
        }

        .text-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            padding: 1rem;
            background: rgba(0, 0, 0, 0.4);
            border-radius: 0.5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
        }

        .feature-section {
            padding: 50px 0;
            background-color: #f8f9fa;
        }

        .feature-box {
            position: relative;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
            text-align: center;
            background-color: white;
        }

        .feature-box:hover .hover-image-container img {
            transform: scale(1.1);
        }

        .hover-image-container {
            position: relative;
            height: 250px;
            overflow: hidden;
        }

        .hover-image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .content-overlay {
            padding: 20px;
        }

        .service-link {
            display: block;
            text-align: center;
            background-color: #fff;
            padding: 2rem;
            border-radius: .5rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, color 0.3s;
            color: #333;
            text-decoration: none;
            position: relative;
        }

        .service-link:hover {
            background-color: #007bff;
            color: white;
        }

        .service-link img {
            position: absolute;
            right: 20px;
            bottom: 20px;
        }

        .not_slide ul {
            list-style: none;
            padding: 0;
        }

        .not_slide li {
            display: flex;
            justify-content: space-between;
            padding: .75rem 1rem;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s;
        }

        .not_slide li:hover {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body class="bg-light" data-scroll-container>

    <div data-scroll-section>
        <!-- 메인이미지 파트 -->
        <div class="image-container" data-scroll>
            <img src="${pageContext.request.contextPath}/resources/image/main_1.jpg" alt="메인 이미지">
            <div class="text-overlay">
                <p>대전 지역 탄소 및 태양광 발전 예측</p>
                <p>미래를 위한 스마트 에너지 솔루션</p>
                <p>Coding Bamboo</p>
            </div>
        </div>

        <!-- 캠페인 미리보기 파트 -->
        <div class="container my-5">
            <h2 class="text-center">캠페인 미리보기 파트</h2>
            <p class="text-center">이곳에 캠페인 내용을 간략하게 소개(더보기 누르면 이동)</p>
        </div>

        <!-- 계산기 및 태양열 지도 파트 -->
        <section class="feature-section">
            <div class="container">
                <div class="row text-center d-flex align-items-stretch">
                    <div class="col-md-6 mb-4 d-flex">
                        <div class="feature-box flex-fill">
                            <div class="hover-image-container">
                                <img src="${pageContext.request.contextPath}/resources/image/sub_2.jpg" alt="탄소 발자국 계산기 이미지">
                            </div>
                            <div class="content-overlay">
                                <h4>탄소 발자국 계산기</h4>
                                <p>당신의 생활에서 발생하는 탄소 배출량을 계산하고 줄이는 방법을 알아보세요.</p>
                                <a href="#" class="btn btn-primary mt-3">계산기 사용하기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4 d-flex">
                        <div class="feature-box flex-fill">
                            <div class="hover-image-container">
                                <img src="${pageContext.request.contextPath}/resources/image/sub_1.jpg" alt="태양열 발전 예측 지도 이미지">
                            </div>
                            <div class="content-overlay">
                                <h4>태양열 발전 예측 지도</h4>
                                <p>당신의 지역에서 태양열 발전량을 예측하고 환경에 미치는 영향을 확인해보세요.</p>
                                <a href="#" class="btn btn-primary mt-3">예측 하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 추가 콘텐츠: 오시는 길, 고객 문의, 공지사항 -->
        <div class="container py-5">
            <div class="row g-3 mb-5">
                <div class="col-md-6">
                    <a href="http://example.com/location" class="service-link">
                        <h3>탄소 중립 생활 실천</h3>
                        <p>탄소 중립 생활 실천 방법을<br>안내해 드립니다.</p>
                        <img src="path/to/arrow.png" alt="">
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="http://example.com/inquiry" class="service-link">
                        <h3>건의 사항</h3>
                        <p>언제나 고객의 건의에<br>귀 기울이겠습니다.</p>
                        <img src="path/to/arrow.png" alt="">
                    </a>
                </div>
            </div>

            <!-- 공지사항 섹션 -->
            <div class="mb-4">
                <h2 class="text-center fw-bold">공지사항</h2>
                <div class="not_slide">
                    <ul class="list-unstyled">
                        <li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
                                <span>공지사항1</span> <span class="text-muted">2000.00.00</span>
                        </a></li>
                        <li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
                                <span>공지사항2</span> <span class="text-muted">2000.00.00</span>
                        </a></li>
                        <li><a href="" class="d-flex justify-content-between text-decoration-none text-dark w-100">
                                <span>공지사항3</span> <span class="text-muted">2000.00.00</span>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Locomotive Scroll JS 추가 -->
    <script src="https://unpkg.com/locomotive-scroll/dist/locomotive-scroll.min.js"></script>
    <script>
        const scroll = new LocomotiveScroll({
            el: document.querySelector('[data-scroll-container]'),
            smooth: true,
            smoothMobile: true,
            inertia: 0.75  // 0에 가까울수록 스크롤이 부드럽습니다
        });
    </script>
</body>
</html>
``
