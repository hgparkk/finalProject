<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<%@ include file="/WEB-INF/inc/header.jsp"%>
<style >
container{
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/inc/top.jsp"%>

<div class="container">
<div class="title">어서오세요 관리자 페이지입니다.</div>

	<div class="content-container">
		<div>
			<div>건의사항 목록/답변하기</div>
		</div>
		<div>
			<div>계산식 수정하기</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/inc/footer.jsp"%>

</body>
</html>