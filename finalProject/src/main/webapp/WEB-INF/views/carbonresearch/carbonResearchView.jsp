<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탄소저감 연구 동향</title>

<%@ include file="/WEB-INF/inc/header.jsp"%>

<style type="text/css">

.container {
	text-align: center;
	width: 80%;
	border: 2px solid black;
	padding: 20px;
	background-color: #ffffff;
}

h1 {
	margin-bottom: 20px;
	font-size: 1.8em;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

table th, table td {
	border: 1px solid black;
	padding: 10px;
	text-align: center;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container">
		<h1>탄소 저감 기술 연구 동향</h1>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 데이터 수 만큼 반복되는 부분 -->
				<c:forEach items="" var="technology">
					<tr>
						<td scope="row">${technology.techNo }</td>
						<td><a href="${technology.techUrl}" class="btn btn-primary">${technology.techTitle }</a></td>
						<td>${technology.techDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>