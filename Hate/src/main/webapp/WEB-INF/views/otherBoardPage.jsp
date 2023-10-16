<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE HTML>
<html>
<head>
<title>통합 게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/board/css/myBoard.css" />
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
					<c:if test="${not empty check}">
						<li id="showBoardUserName"><a href="/myInfoPage">${sessionScope.sessionVo.userName}님</a>
					</c:if>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="#">
							<h3>내가 작성한 글</h3>
							<p>작성한 글 보러가기</p>
					</a></li>
					<li><a href="#">
							<h3>좋아요</h3>
							<p>좋아요 누른 글 보러가기</p>
					</a></li>
					<li><a href="#">
							<h3>댓글</h3>
							<p>댓글 작성한 글 보러가기</p>
					</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>

				<c:choose>
					<c:when test="${empty check}">
						<ul class="actions stacked">
							<li><a href="/boardLoginPage" class="button large fit" onclick="boardGoLogin">로그인</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="actions stacked">
							<li><a href="/boardLogout" class="button large fit">로그아웃</a></li>
						</ul>
					</c:otherwise>
				</c:choose>




			</section>

		</section>

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<ul class="firstUlStyle">
					<li id="boardSul">분류</li>
					<li id="boardTitle">제목</li>
					<li id="boardWriter">작성자</li>
					<!-- 날짜 포맷 -->
					<li id="boardRegdate">날짜</li>
					<li id="boardClickCnt">조회수</li>
					<li id="boardLikeBtn">추천</li>
				</ul>
				<c:forEach items="${list}" var="alReg" varStatus="status">
					<ul>
						<li id="boardSul">${alReg.sul}</li>
						<li id="boardTitle"><a
							href="singleBoardPage${pagingVo.makeQueryPage(alReg.bno, pagingVo.cri.page) }">${alReg.title}</a></li>
						<li id="boardWriter">${alReg.writer}</li>
						<!-- 날짜 포맷 -->
						<li id="boardRegdate"><fmt:parseDate value="${alReg.regdate}"
								var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
								value="${dateFmt}" var="yMd" pattern="yyyy.MM.dd" /> <fmt:formatDate
								value="${dateFmt}" var="Hms" pattern="HH:mm" /> <!-- now는 맨위에서 현재날짜+시간 포맷한거, today는 오늘 날짜 -->
							<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />
							<!-- if로 비교 --> <c:choose>
								<c:when test="${today==yMd}">
									<time class="published" id="boardRegdate">${Hms}</time>
								</c:when>
								<c:otherwise>
									<time class="published" id="boardRegdate">${yMd}</time>
								</c:otherwise>
							</c:choose></li>
						<li id="boardClickCnt">${alReg.clickCnt}</li>
						<li id="boardLikeBtn"><a class="icon solid fa-heart"
							id="boardLikeColor"> ${alReg.likeBtn}</a></li>
					</ul>
				</c:forEach>

				<ul class="btn-group pagination">
					<c:if test="${pagingVo.prev }">
						<li><a
							href='<c:url value="/boardPage?page=${pagingVo.startPage-1 }"/>'><i
								class="fa fa-chevron-left"></i></a></li>
					</c:if>
					<c:forEach begin="${pagingVo.startPage }"
						end="${pagingVo.endPage }" var="pageNum">
						<li><a href='<c:url value="/boardPage?page=${pageNum }"/>'><i
								class="fa">${pageNum }</i></a></li>
					</c:forEach>
					<c:if test="${pagingVo.next && pagingVo.endPage >0 }">
						<li><a
							href='<c:url value="/boardPage?page=${pagingVo.endPage+1 }"/>'><i
								class="fa fa-chevron-right"></i></a></li>
					</c:if>
				</ul>
			</article>

			<!-- Pagination -->
			<ul class="actions pagination">
				<li><a href="myBoardPage" class="button large previous">내 게시글</a></li>
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