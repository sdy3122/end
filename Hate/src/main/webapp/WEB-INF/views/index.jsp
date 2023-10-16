<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>한잔해</title>
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

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current" id="titleLi"><a href="/">메인화면</a></li>
					<li><a href="/boardPage">게시판</a>
						<ul>
							<li><a href="#">소주게시판</a></li>
							<li><a href="#">맥주게시판</a></li>
							<li><a href="#">와인게시판</a></li>
							<li><a href="#">보드카게시판</a></li>
							<li><a href="#">위스키게시판</a></li>
						</ul></li>

					<c:choose>
						<c:when test="${empty check}">
							<li><a href="/loginPage">로그인</a>
								<ul>
									<li><a href="/findIdPage">아이디찾기</a></li>
									<li><a href="/findPwPage">비밀번호찾기</a></li>
									<li><a href="/registPage">회원가입</a></li>
								</ul></li>
						</c:when>
						<c:otherwise>
							<li><a href="/myInfoPage">${sessionScope.sessionVo.userName}님</a>
								<ul>
									<li><a class="loginATag" href="/logout">로그아웃</a></li>
									<li><a class="loginATag" href="/myInfoEdit">비밀번호변경</a></li>
									<li><a class="loginATag" href="/deleteInfoPage">회원탈퇴</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>

		</div>

		<!-- Banner -->
		<section id="banner" class="hideOnce">
			<header>
				<h2>
					버튼 <em>랜덤안주생성</em>
				</h2>
				<a href="#" class="button" onclick="HSBanner()">클릭~!</a>
			</header>
		</section>
		<section id="banner" class="hideBanner">
			<header>
				<div id="choiceSul1" class="sul" onclick="sojuRandomFood();">소주</div>
				<div id="choiceSul3" class="sul" onclick="vodkaRandomFood();">보드카</div>
				<div id="choiceSul2" class="sul" onclick="beerRandomFood();">맥주</div>
				<div id="choiceSul4" class="sul" onclick="whiskeyRandomFood();">위스키</div>
				<div id="choiceSul5" class="sul" onclick="wineRandomFood();">와인</div>
			</header>
			<div id="showFood1">랜덤</div>
			<div id="showFood2">안주</div>
			<div id="showFood3">출력</div>
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