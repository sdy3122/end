<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>내정보</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/main/css/choiceSul.css" />
<style>
</style>
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header">

			<!-- Logo -->
			<h1>
				<a href="/" id="logo"><em>페이지 이름 정해라</em></a>
			</h1>

			<nav id="nav">
				<ul>
					<li id="titleLi"><a href="/">메인화면</a></li>
					<li><a href="/boardPage">게시판</a>
						<ul>
							<li><a href="#">소주게시판</a></li>
							<li><a href="#">맥주게시판</a></li>
							<li><a href="#">와인게시판</a></li>
							<li><a href="#">보드카게시판</a></li>
							<li><a href="#">위스키게시판</a></li>
						</ul></li>
					<li class="current"><a href="/myInfoPage">${sessionScope.sessionVo.userName}님</a></li>
				</ul>
			</nav>

		</div>

		<!-- Main -->
		<section class="wrapper style1">
			<div class="container">
				<div id="content">
					<!-- Content -->
					<article id="delete">
						<h2 class="major">회원탈퇴</h2>
						<form>
							<div class="btnFields">
								<div class="field half">
									<button type="button" class="primary"
										onclick="location.href='/deleteInfo'">회원탈퇴</button>
									<button type="button" class="primary"
										onclick="location.href='/myInfoPage'" id="pleaseCancel">취소</button>
								</div>
							</div>
						</form>
					</article>

				</div>
			</div>
		</section>

		<!-- Footer -->
		<div id="footer">
			<!-- Copyright -->
			<div class="copyright">
				<p class="copyright">&copy; Design: 서덕영</p>
			</div>
		</div>

	</div>
	<!-- Scripts -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="${path}/resources/main/js/jquery.dropotron.min.js"></script>
	<script src="${path}/resources/main/js/browser.min.js"></script>
	<script src="${path}/resources/main/js/breakpoints.min.js"></script>
	<script src="${path}/resources/main/js/util.js"></script>
	<script src="${path}/resources/main/js/main.js"></script>

</body>
</html>