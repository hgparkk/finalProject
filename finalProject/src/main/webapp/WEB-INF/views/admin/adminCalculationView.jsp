<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산식 수정</title>
</head>
<body>
	    <div class="container mt-5">
        <h1>탄소발자국 계산식 수정</h1>
        <form action="/carbon/update" method="post" class="mt-4">
            <input type="hidden" name="id" th:value="${formula.id}" />

            <div class="mb-3">
                <label for="name" class="form-label">계산식 이름</label>
                <input type="text" id="name" name="name" class="form-control" th:value="${formula.name}" required />
            </div>

            <div class="mb-3">
                <label for="formula" class="form-label">계산식</label>
                <textarea id="formula" name="formula" class="form-control" rows="4" required th:text="${formula.formula}"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">저장</button>
            <a href="/carbon/list" class="btn btn-secondary">취소</a>
        </form>
    </div>
	
</body>
</html>