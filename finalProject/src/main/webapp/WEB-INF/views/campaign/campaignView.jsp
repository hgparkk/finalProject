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

.campaing-section {
	max-width: 1340px;
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
	flex-wrap: wrap; /* 항목들이 여러 줄로 넘어가도록 허용 */
	justify-content: space-between;
	padding: 0;
	margin-top: 0.7vw; /* 항목들 간에 간격을 동일하게 분배 */
}

.campaign {
	width: 32%;
	margin-bottom: 0.7vw;
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
	font-size: 1vw;
	color: black;
	font-size: 1vw;
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
						<span>전체</span> <span>페이지</span> <a
							href="https://www.gihoo.or.kr/rss/gallery.es?mid=a10302000000&bid=0001">ㅇㅇ</a>
					</p>
					<form class="d-flex justify-content-around"
						action="${pageContext.request.contextPath }/campaignWriteView"
						method="get">
						<select class="form-select w-25" name="searchOption">
							<option value="all">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
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
				<div class="campaign-list">
					<ul class="campaign-list-ul d-flex justify-content-between">
						<li class="campaign"><a class="d-flex flex-column"
							href="https://www.gihoo.or.kr/gallery.es?mid=a10302000000&bid=0001&b_list=9&act=view&list_no=766&nPage=1&vlist_no_npage=0&keyField=&orderby=&cid=0022">
								<i> <img alt=""
									src="https://www.gihoo.or.kr/galleryThumbView.es?bid=0001&list_no=766">
							</i> <span class="campaign-explain"> <strong>(11월
										챌린지) 이달의 실천수칙</strong> <br> <span> <strong>작성일</strong>
										2024/10/15
								</span> <span> <strong>조회수</strong> 1473
								</span>
							</span>
						</a></li>
						<li class="campaign"><a class="d-flex flex-column"
							href="https://www.gihoo.or.kr/gallery.es?mid=a10302000000&bid=0001&b_list=9&act=view&list_no=766&nPage=1&vlist_no_npage=0&keyField=&orderby=&cid=0022">
								<i> <img alt=""
									src="https://www.gihoo.or.kr/galleryThumbView.es?bid=0001&list_no=766">
							</i> <span class="campaign-explain"> <strong>(11월
										챌린지) 이달의 실천수칙</strong> <br> <span> <strong>작성일</strong>
										2024/10/15
								</span> <span> <strong>조회수</strong> 1473
								</span>
							</span>
						</a></li>
						<li class="campaign"><a class="d-flex flex-column"
							href="https://www.gihoo.or.kr/gallery.es?mid=a10302000000&bid=0001&b_list=9&act=view&list_no=766&nPage=1&vlist_no_npage=0&keyField=&orderby=&cid=0022">
								<i> <img alt=""
									src="https://www.gihoo.or.kr/galleryThumbView.es?bid=0001&list_no=766">
							</i> <span class="campaign-explain"> <strong>(11월
										챌린지) 이달의 실천수칙</strong> <br> <span> <strong>작성일</strong>
										2024/10/15
								</span> <span> <strong>조회수</strong> 1473
								</span>
							</span>
						</a></li>
						<li class="campaign"><a class="d-flex flex-column"
							href="https://www.gihoo.or.kr/gallery.es?mid=a10302000000&bid=0001&b_list=9&act=view&list_no=766&nPage=1&vlist_no_npage=0&keyField=&orderby=&cid=0022">
								<i> <img alt=""
									src="https://www.gihoo.or.kr/galleryThumbView.es?bid=0001&list_no=766">
							</i> <span class="campaign-explain"> <strong>(11월
										챌린지) 이달의 실천수칙</strong> <br> <span> <strong>작성일</strong>
										2024/10/15
								</span> <span> <strong>조회수</strong> 1473
								</span>
							</span>
						</a></li>
						<li id="ttitle"></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<h1>RSS Feed from Gihoo</h1>
    <div id="rss-container"></div>

    <script>
        // 서버에서 제공하는 프록시 URL
        const proxyUrl = 'http://localhost:9009/rss-proxy';

        // fetch를 사용하여 서버로부터 데이터를 요청
        fetch(proxyUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                // XML 데이터를 파싱
                const parser = new DOMParser();
                const xmlDoc = parser.parseFromString(data, 'application/xml');

                // RSS 아이템 추출
                const items = xmlDoc.getElementsByTagName('item');
                const rssContainer = document.getElementById('rss-container');
                
                // 각 아이템을 화면에 출력
                Array.from(items).forEach(item => {
                    const title = item.getElementsByTagName('title')[0].textContent;
                    const link = item.getElementsByTagName('link')[0].textContent;
                    const description = item.getElementsByTagName('description')[0].textContent;

                    // 새로운 HTML 요소 생성
                    const rssItem = document.createElement('div');
                    rssItem.classList.add('rss-item');
                    
                    rssItem.innerHTML = `
                        <h3><a href="${link}" target="_blank">${title}</a></h3>
                        <p>${description}</p>
                    `;

                    // 컨테이너에 추가
                    rssContainer.appendChild(rssItem);
                });
            })
            .catch(error => {
                console.error('Error fetching RSS feed:', error);
                document.getElementById('rss-container').innerHTML = 'Failed to load RSS feed.';
            });
    </script>

</body>
</html>