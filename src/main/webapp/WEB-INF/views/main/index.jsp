<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>"
	type="image/x-icon" />
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Mulstagram</title>
</head>
<body>
	<script src="/multistargram/resources/jquery-3.2.1.min.js"></script>
	<div id="nav">
		<div id="nav-in">
			<div id="nav-in-con">
				<div id="nav-in-con-tit">
					<a href="#">홈으로 돌아갑니다.</a>
				</div>

				<div id="nav-in-con-so">
					<a href="#">후에 로그인이 될 아이입니다.</a>
				</div>
			</div>
		</div>
	</div>
	<div id="container">
		<div id="container-left">
			<c:forEach var="article" items="${articles }">
				<div class="article">
					<div class="article-header"><h4 id="user_id">${article.user_id }</h4></div>
					<div class="article-img"><img class ="art-image" alt="이미지" src="/multistargram/resources/cat.jpg"></div>
					<div class="article-footer">
						<div class= "aritcle-social"> <i class="far fa-heart" style="font-size:24px;" ></i></div>
						<div class= "article-like"><h4 id="user_id">${article.like }</h4>&nbsp;<span class="content-text">명이 좋아합니다.</span></div>
						<div class= "article-content"><h4 id="user_id">${article.user_id }</h4>&nbsp;<span class="content-text">${article.article_content }</span><br>
						<span class="content-text">${article.article_time } 에 작성</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="container-right">
		<form action="/multistargram/artinsert">
			<input type="submit" value="글쓰러 가기">
		</form>
		<form action="/multistargram/board">
			<input type="submit" value="게시판 가기">
		</form>
		</div>
	</div>
	


</body>
</html>
