<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
</head>

<body>
	<script>
		let alertMsg = "<c:out value='${msg}'/>"
		let alertUrl = "<c:out value='${url}'/>"
		
		alert(alertMsg)
		location.replace("${pageContext.request.contextPath}"+aleartUrl)
	</script>
</body>

</html>