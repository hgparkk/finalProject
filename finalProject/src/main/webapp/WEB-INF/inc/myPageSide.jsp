<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String selectedSpan = request.getParameter("selectedSpan");
request.setAttribute("selectedSpan", selectedSpan);

String selectedItem = request.getParameter("selectedItem");
request.setAttribute("selectedItem", selectedItem);
%>

<style>
.menu-box {
	min-width: 173.267px;
	padding: 25px;
	cursor: pointer;
}

.sub-menu-box {
	width: 150px;
	padding: 15px;
	cursor: pointer;
}
</style>

<div class="d-flex flex-column bg-success ps-5">
	<span class="mt-5"></span>
	<span class="text-white link-underline link-underline-opacity-0 menu-box">나의 탄소 발자국</span>
	<span class="text-white link-underline link-underline-opacity-0 menu-box">나의 건의사항</span>
	<c:if test="${selectedSpan == 'aboutUser'}">
		<span class="text-success bg-success-subtle link-underline link-underline-opacity-0 menu-box border-bottom border-end border-success">회원 관리</span>
		<div class="d-flex flex-column align-items-end bg-white">
			<c:if test="${selectedItem == 'userInfo'}">
				<a class="text-success sub-menu-box link-underline link-underline-opacity-0">회원 정보</a>
			</c:if>
			<c:if test="${selectedItem != 'userInfo'}">
				<a href="<c:url value="/myPageUserInfoView" />" class="text-black not-selected sub-menu-box link-underline link-underline-opacity-0">회원 정보</a>
			</c:if>
			<c:if test="${selectedItem == 'pwChange'}">
				<a class="text-success sub-menu-box link-underline link-underline-opacity-0">비밀번호 변경</a>
			</c:if>
			<c:if test="${selectedItem != 'pwChange'}">
				<a href="<c:url value="/myPagePwChangeView" />" class="text-black not-selected sub-menu-box link-underline link-underline-opacity-0">비밀번호 변경</a>
			</c:if>
			<c:if test="${selectedItem == 'snsManage'}">
				<a class="text-success sub-menu-box link-underline link-underline-opacity-0">SNS 연동 관리</a>
			</c:if>
			<c:if test="${selectedItem != 'snsManage'}">
				<a class="text-black not-selected sub-menu-box link-underline link-underline-opacity-0">SNS 연동 관리</a>
			</c:if>
		</div>
	</c:if>
	<c:if test="${selectedSpan != 'aboutUser'}">
		<span class="text-white link-underline link-underline-opacity-0 menu-box">회원 관리</span>
	</c:if>
</div>

<script>
	const notSelected = document.getElementsByClassName("not-selected")

	Array.from(notSelected).forEach((element) => {
	  // mouseover 이벤트 리스너
	  element.addEventListener("mouseover", (event) => {
	    event.target.classList.remove("text-black");
	    event.target.classList.add("text-success");
	  })

	  // mouseout 이벤트 리스너
	  element.addEventListener("mouseout", (event) => {
	    event.target.classList.add("text-black");
	  })
	})
</script>