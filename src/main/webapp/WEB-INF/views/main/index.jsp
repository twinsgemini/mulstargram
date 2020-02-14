<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link rel="shortcut icon" href="<c:url value="/resources/favicon.ico"/>"
	type="image/x-icon" />
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Multistagram</title>
</head>
<body>
	<script src="/multistargram/resources/jquery-3.2.1.min.js"></script>
	<div id="nav">
		<%@ include file = "../include/header.jsp" %>
	</div>
	<div id="container">
		<div id="container-left">
			<c:forEach var="article" items="${articles }">
				<div class="article" style="margin-bottom: 40px">
					<div class="article-header"><h4 id="user_id" style="margin-left: 4px">${article.user_id }</h4></div>
					<div class="article-img"><img class ="art-image" alt="이미지" src="${pageContext.request.contextPath}/${article.article_img }"></div>
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
			<input type="submit" value="사진올리기">
		</form>
		<form action="/multistargram/board">
			<input type="submit" value="게시판 가기">
		</form>
		</div>
	</div>
	


</body>
</html>
