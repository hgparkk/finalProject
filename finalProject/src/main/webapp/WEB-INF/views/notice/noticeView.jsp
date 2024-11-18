<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo - 공지사항</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
html, body {
    min-height: 100%; /* 모든 페이지에서 최소 높이 설정 */
    display: flex;
    flex-direction: column;
    margin: 0;
    padding: 0;
    background-color: #f4f7f6;
    font-family: 'Noto Sans KR', sans-serif;
}

.container {
    padding: 50px 20px;
    max-width: 800px;
    margin: 0 auto;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    flex-grow: 1; /* 화면을 채우도록 설정 */
    margin-bottom: 20px; /* footer와의 여백 추가 */
}

.footer {
    margin-top: auto; /* Footer를 항상 하단에 위치 */
    background-color: #f8f9fa;
    padding: 20px 0;
    text-align: center;
    font-size: 0.9rem;
    color: #666;
}

.title-box {
    display: flex;
    padding-left: 2vw;
    padding-right: 2vw;
    margin-left: 130px;
}

.carbonCal-title {
    width: 100%;
    height: 7.5vw;
}

.noticeDetail ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.noticeDetail li {
    border-bottom: 1px solid #ddd;
    padding: 20px 15px;
    transition: background-color 0.3s, transform 0.2s;
    border-radius: 10px;
    margin-bottom: 10px;
}

.noticeDetail li:hover {
    background-color: #d0f0c0;
    transform: translateY(-2px);
}

.noticeDetail a {
    text-decoration: none;
    color: #333;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
}

.noticeDetail a:hover {
    color: #007bff;
}

.noticeDetail span {
    font-size: 1rem;
}

.noticeDetail .text-muted {
    font-size: 0.9rem;
    color: #666;
}
</style>
</head>
<body>
    <!-- Header -->
    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <div class="title-box">
        <div class="carbonCal-title w-50">
            <h1 style="color: green; font-weight: bold;">공지사항</h1>
            <span style="font-size: 0.7vw;">Coding Bamboo Notice</span>
        </div>
    </div>

    <!-- 공지사항 리스트 컨테이너 -->
    <div class="container">
        <div class="noticeDetail">
            <ul>
                <c:forEach var="notice" items="${noticeList}">
                    <li>
                        <a href="noticeDetailView?noticeNo=${notice.noticeNo}">
                            <span>${notice.noticeTitle}</span>
                            <span class="text-muted">
                                <fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd" />
                            </span>
                        </a>
                    </li>
                </c:forEach>
                <c:if test="${empty noticeList}">
                    <li class="text-center text-muted py-4">등록된 공지사항이 없습니다.</li>
                </c:if>
            </ul>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/inc/footer.jsp"%>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
