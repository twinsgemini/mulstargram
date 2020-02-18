<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<link href="<c:url value="/resources/css/board.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/jquery.form.js" />"></script>
</head>

<script type="text/javascript">
	function checkTitle() {
		var s = document.getElementById('board_title').value.trim();
		var b = true;
		if (s == '') {
			b = false;
			alert("제목은 필수 항목입니다.");
		}
		if (b) {
			document.getElementById('board_title').value = s;
			document.getElementById('boardForm').submit();
		}
	}
</script>



<body>
	<div id="nav">
		<%@ include file="../include/header.jsp"%>
	</div>
	<div id="wrap">
		<div id="container">
			<div class="inner">
				<h2>게시글 작성</h2>
				<form id="boardForm" name="boardForm"
					action="/multistargram/boardinsert"
					method="post">
					<table width="100%" class="table02">
						<caption>
							<strong><span class="t_red">*</span> 표시는 필수 항목입니다</strong>
						</caption>
						<colegroup>
						<col width="20%">
						<col width="*">
						</colegroup>
						<tbody id="tbody">
							<tr>
								<th>제목<span class="t_red">*</span></th>
								<td><input id="board_title" name="board_title" value=""
									class="tbox01" placeholder="제목을 입력하세요" /></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${member.user_id }</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea id="board_content" name="board_content"
										cols="10" rows="5" class="textarea01" placeholder="내용을 입력하세요"></textarea></td>
							</tr>
						</tbody>
					</table>

					<input type="hidden" name="user_id" value="${member.user_id }">

				</form>
				<div class="btn_right mt15">
					<button type="button" class="btn black mr5"
						onclick="location.href='/multistargram/board'">목록으로</button>
					<button type="button" class="btn black" onclick="checkTitle();">등록하기</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>



