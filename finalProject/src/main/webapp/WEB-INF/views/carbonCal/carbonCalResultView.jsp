<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	
	<div>
		<div>
			<span id="electricUsage"></span>
		</div>
		<div>
			<span id="gasUsage"></span>
		</div>
		<div>
			<span id="trafficUsage"></span>
		</div>
		<div>
			<span id="garbageUsage"></span>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>
	<script type="text/javascript">
		/* sessionStorage에 저장된 결과를 출력 */
		document.getElementById("electricUsage").innerHTML += sessionStorage.getItem('resultE')
		document.getElementById("gasUsage").innerHTML += sessionStorage.getItem('resultGas')
		document.getElementById("trafficUsage").innerHTML += sessionStorage.getItem('resultT')
		document.getElementById("garbageUsage").innerHTML += sessionStorage.getItem('resultGar')
	</script>
</body>
</html>