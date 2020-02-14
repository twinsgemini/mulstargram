<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title></title>
<link href="<c:url value="/resources/css/board.css" />" rel="stylesheet">
<script src="<c:url value="/resources/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/jquery.form.js" />"></script>
</head>


<body>
<div id="wrap">
	<div id="container">
		<div class="inner">
			<h2>게시글 상세</h2>
			<form id="boardForm" name="boardForm" action="http://localhost:8080/multistargram/boardmodify" method="get">
			<table width="100%" class="table01">
				<colegroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="*">'
				</colegroup>
				
				<tbody id="tbody">
				<tr>
				<th>제목</th>
				<td>${board.board_title }</td>
				<th>조회수</th>
				<td>${board.board_cnt }</td>
				</tr>
				<tr>
				<th>작성자</th>
				<td>${board.user_id }</td>
				<th>작성일시</th>
				<td>${board.board_date }</td>
				</tr>
				<tr>
				<th>내용</th>
				<td colspan="3" height="400"><div style="text-align:left">${board.board_content}</td></div>
				</tr>
				</tbody>
				<input type="hidden" name="board_num" value="${board.board_num }">
				<input type="hidden" name="board_title" value="${board.board_title }">
				<input type="hidden" name="user_id" value="${board.user_id }">
				<input type="hidden" name="board_content" value="${board.board_content }">
				<input type="hidden" name="board_cnt" value="${board.board_cnt }">
		</table>					
		 					
	</form>
	<div class="btn_right mt15">
		<button type="button" class="btn black mr5" onclick="location.href='http://localhost:8080/multistargram/board'">목록으로</button>
		<c:if test="${board.user_id==member.user_id}">
		<button type="button" class="btn black mr5" onclick="document.getElementById('boardForm').submit()">수정하기</button>
		<button type="button" class="btn black" onclick="location.href='http://localhost:8080/multistargram/boarddelete?board_num=${board.board_num}'">삭제하기</button>
		</c:if>
		
		
	
	
	</div>			
	</div>
</div>
</div>
</body>
</html>






