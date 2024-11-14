<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 목록</title>

<%@ include file="/WEB-INF/inc/header.jsp"%>

<style>
	.table-container{
	margin-top: 100px;
	}
	
	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<div class="container table-container">
		<h2>건의 사항 목록</h2>
		<div>
			<table class="table table-bordered">
				<thead>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</thead>
				<tbody>
					<!-- 데이터 수 만큼 반복되는 부분 -->
					<c:forEach items="${SgList }" var="Suggestions">
						<tr>
							<td scope="row">${suggestion.sgNo }</td>
							<td>${suggestion.sgTitle }</td>
							<td>${suggestion.userId }</td>
							<td>${suggestion.sgDate }</td>
						</tr>
					</c:forEach>
				</tbody>
				
				
			</table>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	
</body>
</html>