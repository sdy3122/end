<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>비밀번호찾기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/login/css/index.css" />
<style>
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div id="registDivBorder">
				<article id="findPw">
				<h2 class="major">비밀번호찾기</h2>
				<form method="post" action="findPw" name="findPw"
					onsubmit="return formCheckFindPw(this)" accept-charset="UTF-8">
					<div class="fields">
						<div class="field half">
							<label for="Name">이름입력</label> <input type="text" id="userName"
								name="userName" required="required" placeholder="이름 입력"
								maxlength="10">
						</div>
						<div class="field half">
							<label for="ID">아이디입력</label> <input type="text" id="userId"
								name="userId" required="required" placeholder="아이디 입력"
								maxlength="10">
						</div>
					</div>
					<div class="fields">
						<div class="field half">
							<label for="Rn1">주민등록번호 앞자리</label> <input type="text" name="rn1"
								id="rn1" placeholder="주민등록번호 앞자리" maxlength="6"
								required="required"
								onkeyup="moveNext(this,6,document.findPw.rn2)">
						</div>
						<div class="field half">
							<label for="Rn2">뒷자리</label> <input type="password" name="rn2"
								id="rn2" placeholder="주민등록번호 뒷자리" maxlength="7"
								required="required"
								onkeyup="moveNext(this,7,document.findPw.sendBtn)">
						</div>
					</div>
					<div class="myFields" id="SRnDupWarningPw">
						<div class="myField">
							<label class="myLabel" for="SRnLabelWarningPw">RNRNRNRN</label>
						</div>
					</div>
					<div class="btnFields">
						<div class="field half">
							<input type="submit" value="찾기" class="primary"
							name="sentBtn" />
						</div>
					</div>
				</form>
			</article>
			</div>
		</header>
		<!-- 여가 끝남 -->
		<!-- Footer -->
		<footer id="footer">
			<a href="/">메인화면</a>
		</footer>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Scripts -->
	<script src="${path}/resources/login/js/browser.min.js"></script>
	<script src="${path}/resources/login/js/breakpoints.min.js"></script>
	<script src="${path}/resources/login/js/util.js"></script>
	<script src="${path}/resources/login/js/main.js"></script>

</body>
</html>