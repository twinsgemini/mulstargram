<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link href="<c:url value="/resources/css/board.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/jquery.form.js" />"></script>
</head>





<body>
	<div id="nav">
		<%@ include file="../include/header.jsp"%>
	</div>
	<div id="wrap">
		<div id="container">
			<div class="inner">
				<h2>게시글 수정</h2>
				<form id="boardForm" name="boardForm"
					action="http://localhost:8080/multistargram/boardmodify"
					method="post">
					<table width="100%" class="table01">
						<colegroup>
						<col width="20%">
						<col width="*">
						' </colegroup>
						<tbody id="tbody">
							<tr>
								<th>제목<span class="t_red">*</span></th>
								<td><input id=board_title " name="board_title"
									value="${board.board_title}" class="tbox01" /></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td id="user_id">${board.user_id }</td>
							</tr>
							<tr>
								<th>내용<span class="t_red">*</span></th>
								<td colspan="3" height="400"><textarea id="board_content"
										name="board_content" cols="50" rows="5" class="textarea01">${board.board_content}</textarea></td>
						</tbody>
					</table>
					<input type="hidden" id="board_num" name="board_num"
						value="${board.board_num }" /> <input type="hidden" id="board_cnt"
						name="board_cnt" value="${board.board_cnt }" />
				</form>
				<div class="btn_right mt15">
					<button type="button" class="btn black mr5"
						onclick="document.getElementById('boardForm').submit();">수정하기</button>
					<button type="button" class="btn black"
						onclick="location.href='http://localhost:8080/multistargram/boarddetail?board_num=${board.board_num}'">취소하기</button>




				</div>
			</div>
		</div>
	</div>
</body>
</html>



