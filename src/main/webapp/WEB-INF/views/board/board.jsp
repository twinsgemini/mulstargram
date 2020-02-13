<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 페이지</title>


<link href="<c:url value="/resources/css/board.css" />" rel="stylesheet">
<script src="<c:url value="/resources/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/jquery.form.js" />"></script>


</head>
<body>
<div id="wrap">
<div id="container">
<div class="inner">
<h2>게시글 목록</h2>
<form id="boardForm" name="boardForm">
<table width="100%" class="table01">
<colgroup>
<col width="10%"/>
<col width="25%"/>
<col width="15%"/>
<col width="25%"/>
<col width="10%"/>
</colgroup>
<thead>
<tr>
<th>글번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
<th>조회수</th>
</tr>
</thead>
<tbody>
<tbody id="tbody">

</tbody>
<c:forEach items="${list }" var="vo">
<tr>
<td>${vo.board_num }</td>
<td><a href="http://localhost:8080/multistargram/boarddetail?board_num=${vo.board_num}&board_cnt=${vo.board_cnt+1}">${vo.board_title}</a></td>
<td>${vo.user_id}</td>
<td>${vo.board_date }</td>
<td>${vo.board_cnt }</td>
</tr>
</c:forEach>
</table>

</form>
<!-- 페이징 처리 startpage ~ endpage -->
<div class="pagination">
<c:if test="${paging.prev}">
   	<a href="http://localhost:8080/multistargram/board?page=${paging.startpage-1 }">이전</a>
</c:if> 
<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="page">
    <a href="http://localhost:8080/multistargram/board?page=${page }">${page}</a>
    <a></a>
</c:forEach>
<c:if test="${paging.next}">
   	<a href="http://localhost:8080/multistargram/board?page=${paging.endpage+1 }">다음</a>
</c:if> 
</div>
<div class="btn_right mt15">
	<button type="button" class="btn black mr5" onclick="location.href='http://localhost:8080/multistargram/boardwrite'">작성하기</button>
</div>
</div>
</div>
</div>
</body>
</html>