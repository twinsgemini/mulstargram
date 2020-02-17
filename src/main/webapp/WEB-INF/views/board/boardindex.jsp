<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="<c:url value="/resources/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/jquery.form.js" />"></script>

<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
 ul {margin-top:3px;margin-bottom:auto;padding-left: 15px; line-height: normal;}
 a {font-size: 15px;
 	display: block;
    text-decoration: none;
    color: #333;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden; }


div.boarder {border: 1px solid #ccc; padding: 10px;}
header {border-bottom: 1px dashed #aaa; margin: 5px;}
h3 {margin: 0;}

</style>




</head>
<body>

<div class="boarder">
<header>
<h3>최신 게시글</h3>
</header>
<c:forEach items="${list }" var="vo">
 <ul style="list-style-type: disc; font-size:5px;">
<li><a href="http://localhost:8080/multistargram/boarddetail?board_num=${vo.board_num}">${vo.board_title}</a></li>
</ul>
</c:forEach>
</div>


</body>
</html>