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

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li id="titleLi"><a href="/">메인화면</a></li>
					<li><a href="/boardPage">게시판</a>
						<ul>
							<li><a href="sojuBoardPage">소주게시판</a></li>
							<li><a href="beerBoardPage">맥주게시판</a></li>
							<li><a href="wineBoardPage">와인게시판</a></li>
							<li><a href="vodkaBoardPage">보드카게시판</a></li>
							<li><a href="whiskeyBoardPage">위스키게시판</a></li>
							<li><a href="freeBoardPage">자유게시판</a></li>
						</ul></li>
					<li class="current"><a href="myInfoPage">${sessionScope.sessionVo.userName}님</a></li>
				</ul>
			</nav>

		</div>

		<!-- Main -->
		<section class="wrapper style1">
			<div class="container">
				<div id="content">
					<!-- Content -->
					<article id="myInfo">
						<h2 class="major">내정보</h2>
						<form action="">
							<table>
								<tr>
									<!-- 세션값을 빼올때는 sessionScope.세션이름.세션에있는값 으로 작성하면된다 -->
									<td>이름</td>
									<td><input type="text" name="userName"
										value="${sessionScope.sessionVo.userName}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="userId"
										value="${sessionScope.sessionVo.userId}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>작성 게시글 수</td>
									<td><input type="text" name="writeCount"
										value="${sessionScope.cnt}" readonly="readonly"></td>
								</tr>
							</table>
						</form>
					</article>

				</div>
			</div>
		</section>

		<!-- Footer -->
		<div id="footer">
			<a class="loginATag" href="/logout">로그아웃</a>
			<a class="loginATag" href="/myInfoEdit">비밀번호변경</a>
				<a class="loginATag" href="/deleteInfoPage">회원탈퇴</a>
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