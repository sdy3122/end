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
					<li id="titleLi"><a href="/">메인화면</a></li>
					<li><a href="/boardPage">게시판</a>
						<ul>
							<li><a href="#">소주게시판</a></li>
							<li><a href="#">맥주게시판</a></li>
							<li><a href="#">와인게시판</a></li>
							<li><a href="#">보드카게시판</a></li>
							<li><a href="#">위스키게시판</a></li>
						</ul></li>
					<li class="current"><c:choose>
							<c:when test="${empty check}">
								<a href="/loginPage">로그인</a>
							</c:when>
							<c:otherwise>
								<a href="/myInfoPage">${sessionScope.sessionVo.userName}님</a>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</nav>

		</div>

		<!-- Main -->
		<section class="wrapper style1">
			<div class="container">
				<div id="content">
					<!-- Content -->
					<article>
						<h2 class="major">로그인</h2>
						<form method="post" action="login"
							onsubmit="return loginCheckInfo()" accept-charset="UTF-8">
							<div class="fields">
								<div class="field half">
									<label for="ID">아이디</label> <input type="text"
										id="inputLoginId" placeholder="아이디 입력" name="userId"
										required="required">
								</div>
								<div class="field half">
									<label for="PW">비밀번호</label> <input type="password"
										id="inputLoginPw" placeholder="비밀번호 입력" name="userPw"
										required="required">
								</div>
							</div>
							<div class="myFields" id="loginInputDiv">
								<div class="myField">
									<label class="myLabel" for="loginInputLabel">loglogloglog</label>
								</div>
							</div>
							<input type="hidden" name="pathChoiceNum" value="${checkPath}">
							<div class="btnFields">
								<div class="field">
									<input type="submit" value="로그인" class="primary" />
								</div>
							</div>
						</form>
					</article>

				</div>
			</div>
		</section>

		<!-- Footer -->
		<div id="footer">
			<a class="loginATag" href="findIdPage">아이디 찾기</a> <a
				class="loginATag" href="findPwPage">비밀번호 찾기</a> <a class="loginATag"
				href="/registPage">회원가입</a>
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