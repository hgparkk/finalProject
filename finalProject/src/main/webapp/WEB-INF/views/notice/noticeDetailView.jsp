<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo - 공지사항 상세</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
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

.notice-container {
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
    color: green;
    margin-bottom: 20px;
    border-bottom: 2px solid #d0f0c0;
    padding-bottom: 10px;
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

.back-button, .delete-button {
    display: inline-block;
    text-align: center;
    margin-top: 30px;
    margin-right: 10px;
}

.back-button a, .delete-button a {
    text-decoration: none;
    color: white;
    background-color: green;
    padding: 10px 20px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.back-button a:hover, .delete-button a:hover {
    background-color: #006400;
}

.delete-button a {
    background-color: red;
}

.delete-button a:hover {
    background-color: #8B0000;
}
</style>
</head>
<body>
    <!-- Header -->
    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <!-- 공지사항 상세 내용 -->
    <div class="notice-container">
        <div class="notice-title">${notice.noticeTitle}</div>

        <!-- HTML 콘텐츠를 렌더링 -->
        <div class="notice-content ql-editor">
            <c:out value="${notice.noticeContent}" escapeXml="false" />
        </div>

        <div class="notice-meta">
            작성일:
            <fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" />
        </div>

        <div class="back-button">
            <a href="noticeView">목록으로 돌아가기</a>
        </div>

        <!-- 삭제 버튼 (관리자 권한이 있을 때만 표시) -->
        <c:if test="${sessionScope.login.userIsmaster == 1}">
            <div class="delete-button">
                <a href="noticeDeleteDo?noticeNo=${notice.noticeNo}" 
                   onclick="return confirm('이 공지사항을 삭제하시겠습니까?');">
                    삭제
                </a>
            </div>
        </c:if>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/inc/footer.jsp"%>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
