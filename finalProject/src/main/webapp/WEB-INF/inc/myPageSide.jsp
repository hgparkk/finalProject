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
	padding: 23px;
	cursor: pointer;
	border-right: rgb(25, 135, 84) 1px solid;
	border-bottom: rgb(25, 135, 84) 1px solid;
}

.sub-menu-box {
	width: 150px;
	padding: 15px;
	cursor: pointer;
}

.not-selected-span {
	color: #FFFFFF;
	transition-duration: 0.3s;
}

.not-selected-span:hover {
	background-color: #d1e7dd;
	color: rgb(25, 135, 84);
}

.spanAlert {
	position: relative;
}

.spanAlert::after {
	content: "";
	width: 10px;
	height: 10px;
	background-color: red;
	border-radius: 50%;
	position: absolute;
	top: 20px;
	right: 20px;
}
</style>

<div class="d-flex flex-column bg-success ps-5">
	<span class="mt-5"></span>
	<c:if test="${selectedSpan == 'myCarbonResult'}">
		<span class="text-success bg-success-subtle link-underline link-underline-opacity-0 menu-box border-end border-success">나의 탄소 발자국</span>
	</c:if>
	<c:if test="${selectedSpan != 'myCarbonResult'}">
		<a href="<c:url value="/myPageMyCarbonResultView" />" class="not-selected-span link-underline link-underline-opacity-0 menu-box">나의 탄소 발자국</a>
	</c:if>
	<c:if test="${selectedSpan == 'mySuggestions'}">
		<span id="Suggestion" class="text-success bg-success-subtle link-underline link-underline-opacity-0 menu-box border-end border-success">나의 건의사항</span>
	</c:if>
	<c:if test="${selectedSpan != 'mySuggestions'}">
		<a id="Suggestion" href="<c:url value="/myPageMySuggestionsView" />" class="not-selected-span link-underline link-underline-opacity-0 menu-box">나의 건의사항</a>
	</c:if>
	<c:if test="${selectedSpan == 'aboutUser'}">
		<span class="text-success bg-success-subtle link-underline link-underline-opacity-0 menu-box border-bottom border-end border-success border-end border-success">회원 관리</span>
		<div class="d-flex flex-column align-items-end bg-white">
			<c:if test="${selectedItem == 'userInfo'}">
				<a class="text-success sub-menu-box link-underline link-underline-opacity-0 border-end border-success">회원 정보</a>
			</c:if>
			<c:if test="${selectedItem != 'userInfo'}">
				<a href="<c:url value="/myPageUserInfoView" />" class="text-black not-selected-item sub-menu-box link-underline link-underline-opacity-0 border-end border-success">회원 정보</a>
			</c:if>
			<c:if test="${selectedItem == 'pwChange'}">
				<a class="text-success sub-menu-box link-underline link-underline-opacity-0 border-end border-success">비밀번호 변경</a>
			</c:if>
			<c:if test="${selectedItem != 'pwChange'}">
				<a href="<c:url value="/myPagePwChangeView" />" class="text-black not-selected-item sub-menu-box link-underline link-underline-opacity-0 border-end border-success">비밀번호 변경</a>
			</c:if>
			<c:if test="${selectedItem == 'snsLinkManage'}">
				<a class="text-success sub-menu-box link-underline link-underline-opacity-0 border-end border-success">SNS 연동 관리</a>
			</c:if>
			<c:if test="${selectedItem != 'snsLinkManage'}">
				<a href="<c:url value="/myPageSnsLinkManageView" />" class=" text-black not-selected-item sub-menu-box link-underline link-underline-opacity-0 border-end border-success">SNS 연동 관리</a>
			</c:if>
			<span id="resignUserBtn" class=" text-black not-selected-item sub-menu-box link-underline link-underline-opacity-0 border-end border-success">회원 탈퇴</span>
		</div>
	</c:if>
	<c:if test="${selectedSpan != 'aboutUser'}">
		<a href="<c:url value="/myPageUserInfoView" />" class="not-selected-span link-underline link-underline-opacity-0 menu-box">회원 관리</a>
		<span id="resignUserBtn" class="d-none"></span>
	</c:if>
	<form id="resignUserForm" action="<c:url value="/resignUserDo" />" method="POST"></form>
</div>

<script>
$.ajax({
	type:'POST',
	url: "${pageContext.request.contextPath }/getUnreadReply",
	data: { "userId": "${sessionScope.login.userId}"},
	success: function(result){
		if(result.length > 0){
			document.getElementById("Suggestion").classList.add("spanAlert")
		}
	}
})

	const notSelectedItem = document.getElementsByClassName("not-selected-item")

	Array.from(notSelectedItem).forEach((element) => {
		// mouseover 이벤트 리스너
		element.addEventListener("mouseover", (event) => {
			event.target.classList.remove("text-black");
			event.target.classList.add("text-success");
		})
			
		// mouseout 이벤트 리스너
		element.addEventListener("mouseout", (event) => {
			event.target.classList.remove("text-success");
			event.target.classList.add("text-black");
		})
	})
	
	document.getElementById("resignUserBtn").addEventListener("click",()=>{
		if(confirm("회원을 탈퇴하시겠습니까?")){
			if(confirm("탈퇴된 회원 정보는 복구되지 않습니다")){
				document.getElementById("resignUserForm").submit();
			}
		}
	})
</script>