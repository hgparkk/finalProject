<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo</title>
<style type="text/css">
ul {
	display: flex;
}

.li-text::before {
	content: '> ';
	color: gray;
}

.campaign-container {
	max-width: 1300px;
	margin: auto;
}

.campaign-nav-box {
	width: 100%;
	margin-top: 5.5vw;
}

.campaign-ul {
	width: 100%;
	display: flex;
}

.campaign-ul>li {
	margin: 0.1vw;
}

.li-text {
	display: flex;
	align-items: center;
}

.li-text>a {
	color: black;
	text-decoration: none;
}

.home-go {
	border: 1px solid #CCCCCC;
	border-radius: 0.4vw;
	padding: 0.3vw;
	padding-left: 0.5vw;
	padding-right: 0.5vw;
	color: black;
	font-size: 1vw;
}

.home-go>img {
	width: 1vw;
	height: 1vw;
}

.campaign-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 0.7vw;
}

.campaign-list {
	border-top: 1px solid black;
}

.campaign-list-ul {
	margin: 0; /* 기본 margin 리셋 */
	padding: 0;
	margin-top: 0.7vw;
	list-style-type: none;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	padding: 0;
	gap: 2%;
	margin-top: 0.7vw;
}

.campaign {
	width: 32%;
	display: block;
	margin-bottom: 0.7vw;
}

@media ( max-width : 1100px) {
	.campaign {
		width: 48%; /* 화면 크기가 줄어들면 2개만 한 줄에 보이도록 설정 */
	}
}

@media ( max-width : 600px) {
	.campaign {
		width: 98%; /* 화면 크기가 더 줄어들면 1개만 보이도록 설정 */
	}
}

.campaign-img {
	height: 22vh;
}

i>img {
	width: 100%;
}

/* 추가로 모든 링크에 대해 확실히 밑줄 제거 */
a {
	text-decoration: none !important;
}

a>span {
	text-decoration: none;
	color: black;
	font-size: 0.9vw;
}
</style>
<!-- header -->
<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<!-- top -->
	<%@ include file="/WEB-INF/inc/top.jsp"%>

	<section class="campaign-section">
		<div class="campaign-container">
			<div class="campaign-nav-box">
				<nav>
					<ul class="campaign-ul">
						<li class="d-flex"><a class="home-go"
							href="${pageContext.request.contextPath }"> <img
								src="image/home.png">
						</a></li>
						<li class="li-text"><a
							href="${pageContext.request.contextPath }/campaignView">탄소중립
								참여해요</a></li>
						<li class="li-text"><a
							href="${pageContext.request.contextPath }/campaignView">캠페인</a></li>
					</ul>
				</nav>
			</div>
			<div class="campaign-box">
				<div class="campaign-info">
					<p>
						<c:if test="${keyGetCampaignList.size() == 0 }">
							<span>전체</span>
							<b>${keyGetCampaignList.size() }건</b>
							<span>페이지</span>
							<b>${keySearch.pageNo }</b>
							<span>/</span>
							<b>${keySearch.lastPage+1 }</b>
						</c:if>
						<c:if test="${keyGetCampaignList.size() != 0 }">
							<span>전체</span>
							<b>${keyCampaignCount}건</b>
							<span>페이지</span>
							<b>${keySearch.pageNo }</b>
							<span>/</span>
							<b>${keySearch.lastPage }</b>
						</c:if>
					</p>
					<!-- 검색바 -->
					<form class="d-flex justify-content-around"
						action="${pageContext.request.contextPath }/campaignView"
						method="get">
						<select class="form-select w-25" name="searchOption">
							<option value="title">제목</option>
						</select> <input type="text" class="form-control w-50" name="searchWord">
						<button class="btn btn-primary" type="submit">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								  <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
								</svg>
						</button>
					</form>
				</div>
				<!-- 캠페인 부분 -->
				<div class="campaign-list">
					<c:if test="${keyGetCampaignList.size() != 0}">
						<ul class="campaign-list-ul">
							<c:forEach items="${keyGetCampaignList }" var="campaignDTO">
								<li class="campaign"><a class="d-flex flex-column"
									href="${campaignDTO.campaignUrl }" target="_blank"> <i>
											<img src="${campaignDTO.campaignImg }" class="campaign-img">
									</i> <span class="campaign-explain"> <strong>${campaignDTO.campaignTitle }</strong>
											<br> <span> <strong>작성일</strong>
												${campaignDTO.campaignDate }
										</span>
									</span>
								</a></li>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${keyGetCampaignList.size() == 0}">
						<ul class="campaign-list-ul">
							<li>검색 결과를 찾을 수 없습니다.</li>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- 캠페인 등록 -->
	<div>
		<c:if test="${sessionScope.login.userIsmaster == 1 }">
			<form action="${pageContext.request.contextPath }/campaignWriteView">
				<button type="button" id="camBtn">캠페인 등록하기</button>
			</form>
		</c:if>
	</div>
	<!-- 페이지 부분 -->
	<!-- 페이징 -->
	<c:if test="${keyCampaignList.size() != 0 }">
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<!-- 이전 페이지 -->
					<li
						class="page-item ${keySearch.firstPage == 1 ? 'disabled' : '' }">
						<c:if test="${searchWord == null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/campaignView?pageNo=${keySearch.firstPage - 1 }"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if> <c:if test="${searchWord != null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/campaignView?pageNo=${keySearch.firstPage - 1 }&searchOption=${keySearch.searchOption}&searchWord=${keySearch.searchWord}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
						</c:if>
					</li>

					<!-- 중간 페이지 번호 부분 -->
					<c:forEach begin="${keySearch.firstPage }"
						end="${keySearch.lastPage }" var="num">
						<li class="page-item ${keySearch.pageNo == num ? 'active' : ''}">
							<c:if test="${keySearch.searchWord == null }">
								<a class="page-link"
									href="${pageContext.request.contextPath }/campaignView?pageNo=${num }">${num }</a>
							</c:if> <c:if test="${keySearch.searchWord != null }">
								<a class="page-link"
									href="${pageContext.request.contextPath }/campaignView?pageNo=${num }&searchOption=${keySearch.searchOption}&searchWord=${keySearch.searchWord}">${num }</a>
							</c:if>
						</li>
					</c:forEach>

					<!-- 다음 페이지 -->
					<li
						class="page-item ${keySearch.lastPage == keySearch.finalPage ? 'disabled' : '' }">
						<c:if test="${keySearch.searchWord == null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/campaignView?pageNo=${keySearch.lastPage + 1 }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if> <c:if test="${keySearch.searchWord != null }">
							<a class="page-link"
								href="${pageContext.request.contextPath }/campaignView?pageNo=${keySearch.lastPage + 1 }&searchOption=${keySearch.searchOption}&searchWord=${keySearch.searchWord}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
					</li>

				</ul>
			</nav>
		</div>
	</c:if>
	<!-- footer 부분 -->
	<%@ include file="/WEB-INF/inc/footer.jsp"%>

	<script type="text/javascript">
		document.getElementById("camBtn").addEventListener('click', ()=>{
			document.getElementById("camBtn").parentElement.submit();
		})
	</script>

</body>
</html>