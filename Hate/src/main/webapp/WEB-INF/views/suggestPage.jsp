<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE HTML>
<html>
<head>
<title>건의사항</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${path}/resources/board/css/createBoard.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="/">메인화면</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="boardPage">전체</a></li>
					<li><a href="#">소주</a></li>
					<li><a href="#">맥주</a></li>
					<li><a href="#">와인</a></li>
					<li><a href="#">보드카</a></li>
					<li><a href="#">위스키</a></li>
					<li><a href="#">자유</a></li>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<form action='insertSuggest' id="registBoardForm" method="get">
					<div>
						<h1 id="createBoardName">건의하기</h1>
					</div>
					<div>
						<div class="choiceType">
							<p>
								<input type="radio" name="choiceSulType" id="01" value="소주">
								<label for="01"> 소주 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="02" value="맥주">
								<label for="02"> 맥주 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="03" value="와인">
								<label for="03"> 와인 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="04" value="보드카">
								<label for="04"> 보드카 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="05" value="위스키">
								<label for="05"> 위스키 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="06" value="그외">
								<label for="06"> 자유 </label>
							</p>
						</div>
					</div>
					<div>
						<label>제목</label> <input id="regTitle"
							type="text" name="title" placeholder="제목을 15자내로 작성해주세요." maxlength="15">
					</div>
					<div>
						<label>내용</label>
						<textarea name="content" rows="10" id="regContent"
							placeholder="1. 비방, 욕설, 도배 등은 서비스 이용제한 사유가 될 수 있습니다."></textarea>
					</div>
				</form>

			</article>

			<!-- Pagination -->
			<ul class="actions pagination">
				<li><a href="#" onclick="regBoardChk()" class="button large previous">등록</a></li>
				<li><a href="boardPage" class="button large next" id="cancelBtn"
				onclick="return confirm('글 작성을 취소하고 나감');">취소</a></li>
			</ul>

		</div>

	</div>

	<!-- Scripts -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="${path}/resources/board/js/browser.min.js"></script>
	<script src="${path}/resources/board/js/breakpoints.min.js"></script>
	<script src="${path}/resources/board/js/util.js"></script>
	<script src="${path}/resources/board/js/main.js"></script>

</body>
</html>