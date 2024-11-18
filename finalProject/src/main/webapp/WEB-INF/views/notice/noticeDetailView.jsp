<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo - 공지사항 상세</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
html, body {
    margin: 0;
    padding: 0;
    overflow-x: hidden;
    background-color: #f4f7f6;
    font-family: 'Noto Sans KR', sans-serif;
}

.title-box {
    display: flex;
    padding: 20px;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    text-align: center;
    margin-bottom: 20px;
}

.carbonCal-title h1 {
    font-weight: bold;
    color: green;
}

.carbonCal-title span {
    font-size: 0.9rem;
    color: #555;
}

.container {
    padding: 50px 20px;
    max-width: 800px;
    margin: 0 auto;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.notice-title {
    font-size: 2rem;
    font-weight: bold;
    color: #007bff;
    margin-bottom: 20px;
    border-bottom: 2px solid #d0f0c0;
    padding-bottom: 10px;
    text-align: center;
}

.notice-content {
    font-size: 1rem;
    line-height: 1.6;
    color: #333;
    margin-bottom: 30px;
}

.notice-meta {
    font-size: 0.9rem;
    color: #666;
    text-align: right;
    margin-top: 15px;
    border-top: 1px solid #ddd;
    padding-top: 10px;
}

.back-button {
    display: block;
    text-align: center;
    margin-top: 30px;
}

.back-button a {
    text-decoration: none;
    color: white;
    background-color: #007bff;
    padding: 10px 20px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.back-button a:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <!-- Header -->
    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <!-- Title -->
    <div class="title-box">
        <div class="carbonCal-title">
            <h1>공지사항</h1>
            <span>Coding Bamboo Notice</span>
        </div>
    </div>

    <!-- 공지사항 상세 내용 -->
    <div class="container">
        <div class="notice-title">${notice.noticeTitle}</div>

        <div class="notice-content">
            ${notice.noticeContent}
        </div>

        <div class="notice-meta">
            작성일: <fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" />
        </div>

        <div class="back-button">
            <a href="noticeView">목록으로 돌아가기</a>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/inc/footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
