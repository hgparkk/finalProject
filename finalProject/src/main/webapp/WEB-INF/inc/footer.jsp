<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.footer {
    width: 100% !important;
}

.footer-container {
    width: 100% !important;
    height: 20vh !important;
}

.footer-box {
    width: 55% !important;
    justify-content: center !important;
    margin: 0px !important;
    padding: 0px !important;
    columns: 0 !important;
    flex-direction: column !important;
    font-size: 1vw !important;
}

.dropdown-menu {
    text-transform: translate(100px, 100px) !important;
}

.main-img-box {
    width: 25% !important;
    display: flex !important;
    justify-content: center !important;
    align-items: center !important;
}

.btn-find {
    width: 20% !important;
    display: flex !important;
    justify-content: center !important;
    align-items: center !important;
}

.tags {
    display: flex !important;
    justify-content: center !important;
}

.line {
    border: 0.5px solid #DDDDDD !important;
}

.btn-success {
    width: 13vw !important;
    font-size: 1vw !important;
}

.detail2 {
    display: flex !important;
    justify-content: center !important;
    align-items: center !important;
    text-decoration: none !important;
    font-size: 0.9vw !important;
    color: black !important;
    margin-top: 0.5vw !important;
    margin-bottom: 0.5vw !important;
}

.dropdown-menu {
    width: 13vw !important;
}
</style>
<!-- Footer-->
<footer class="footer text-center">
	<div class="line"></div>
	<div class="footer-container d-flex">
		<div class="footer-box row">
			<span>대전광역시 서구 계룡로 491번길 86(둔산동, 미래융합교육원)</span>
			<div class="tags">
				<span style="font-weight: bold;">TEL</span> <span>&nbsp;042-471-9222</span><span
					style="font-weight: bold;">&nbsp;FAX</span><span>&nbsp;042-471-9223</span><span
					style="font-weight: bold;">&nbsp;E-MAIL</span> <span>&nbsp;mcea@mcea.co.kr</span>
			</div>
			<div class="copyright text-center text-black">
				<div class="container">
					<small>&copy; Team . Coding Bamboo</small>
				</div>
			</div>
		</div>
		<!-- Copyright Section-->
		<div class="mx-auto my-auto">
			<img src="image/favicon.ico" style="filter: grayscale(1) invert(1);">
			<a class="btn btn-social mx-1" href="#!"><i
				class="fab fa-fw fa-instagram"></i></a> <a class="btn btn-social mx-1"
				href="https://github.com/hgparkk/finalProject"><i class="fab fa-fw fa-github"></i></a> <a
				class="btn btn-social mx-1" href="#!"><i
				class="fas fa-fw fa-phone"></i></a> <a class="btn btn-social mx-1"
				href="#!"><i class="far fa-fw fa-envelope"></i></a>
		</div>
		<div class="btn-find">
			<div class="dropup">
				<button type="button" class="btn btn-success dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">관련 사이트
					보러가기</button>
				<ul class="dropdown-menu">
					<li><a class="detail2"
						href="https://www.kcen.kr/tanso/intro.green">탄소발자국 계산기</a></li>
					<li><a class="detail2"
						href="https://energyinfo.seoul.go.kr/solarmap?menu-id=Z080600">서울특별시
							에너지정보</a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>
