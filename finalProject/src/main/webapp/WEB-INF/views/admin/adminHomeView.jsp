<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<%@ include file="/WEB-INF/inc/header.jsp"%>
<style type="text/css">
        .container {
            margin-top: 20px;
        }
        .welcome-box, .content-box {
            border: 2px solid black;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        .welcome-box {
            font-size: 1.5rem;
        }
        .content-row {
            display: flex;
            justify-content: space-around;
            gap: 20px;
        }
        .content-box {
            width: 45%;
            height: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }
</style>
</head>
<body>

<%@ include file="/WEB-INF/inc/top.jsp"%>

<div class="container">
	<div class="welcome-box">어서오세요 관리자 페이지입니다.</div>

	<div class="content-row">
		<div class="content-box">
			<div>건의사항 목록/답변하기</div>
		</div>
		<div class="content-box">
			<div>계산식 수정하기</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>
</html>