<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE HTML>
<html>
<head>
<title>글 수정</title>
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
				<form action='updateBoard' id="registBoardForm" method="get">
					<div>
						<h1 id="createBoardName">${sessionScope.sessionVo.userName}님</h1>
					</div>
					<div>
						<div class="choiceType">
							<p>
								<input type="radio" name="choiceSulType" id="01" value="소주"
									<c:if test="${boardForEdit.sul eq '소주'}">checked</c:if>>
								<label for="01"> 소주 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="02" value="맥주"
								<c:if test="${boardForEdit.sul eq '맥주'}">checked</c:if>>
								<label for="02"> 맥주 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="03" value="와인"
								<c:if test="${boardForEdit.sul eq '와인'}">checked</c:if>>
								<label for="03"> 와인 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="04" value="보드카"
								<c:if test="${boardForEdit.sul eq '보드카'}">checked</c:if>>
								<label for="04"> 보드카 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="05" value="위스키"
								<c:if test="${boardForEdit.sul eq '위스키'}">checked</c:if>>
								<label for="05"> 위스키 </label>
							</p>
							<p>
								<input type="radio" name="choiceSulType" id="06" value="그외"
								<c:if test="${boardForEdit.sul eq '그외'}">checked</c:if>>
								<label for="06"> 자유 </label>
							</p>
						</div>
					</div>
					<div>
						<label>제목</label> <input id="regTitle" type="text" name="title"
							placeholder="제목을 15자내로 작성해주세요." maxlength="15" value="${boardForEdit.title}">
					</div>
					<div>
						<label>안주</label> <input id="regMenu" type="text" name="menu" maxlength="10"
							placeholder="추천하고 싶은 안주를 작성해주세요." value="${boardForEdit.menu}">
					</div>
					<div>
						<label>내용</label>
						<textarea name="content" rows="10" id="regContent"
							placeholder="1. 비방, 욕설, 도배글 등은 서비스 이용제한 사유가 될 수 있습니다.
2. 타인의 개인정보가 포함된 게시물을 올릴 경우, 개인 정보 보호법 제 59조 3호에 의해 5년 이하의 징역 또는 5천만원 이하의 벌금이 부과될 수 있으니 유의하여 주시기 바랍니다.
3. 모든 분들이 게시물을 불편없이 이용할 수 있도록 게시물에 대한 설명을 문자로 기재해 주시기 바랍니다.">${boardForEdit.content}</textarea>
					</div>
					<input type="hidden" name="hiddenBnoAway" value="${boardForEdit.bno}">
				</form>

			</article>

			<!-- Pagination -->
			<ul class="actions pagination">
				<li><a href="#" onclick="regBoardChk()"
					class="button large previous">등록</a></li>
				<li><a href="boardPage" class="button large next" onclick="return confirm('글 수정을 취소하고 나감');"
					id="cancelBtn">취소</a></li>
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