<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>아이디조회성공</title>
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
				<article id="login">
					<h2 class="major">아이디조회결과</h2>
					<form method="post" accept-charset="UTF-8">
					<p id="tableSuccessHead">아이디 조회 성공!</p>
						<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="userName" value="${inputName}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>주민등록번호 앞자리</td>
							<td><input type="text" name="userRn1" value="${inputRn1}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<td>조회된 아이디</td>
							<td><input type="text" name="userId" value="${findId}"
								readonly="readonly"></td>
						</tr>
					</table>
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