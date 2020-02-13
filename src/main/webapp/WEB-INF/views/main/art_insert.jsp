<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mulstagram</title>
</head>
<style type="text/css">
.inputArea {
	border: solid 1px #efefef;
	border-radius: 6px;
	padding: 12px 16px;
}
.inputArea:focus{
	border: solid 1px #dbdbdb;
}

#content {
	resize: none;
	border: 0;
	outline: 0;
}

/* textarea:focus {
	border: solid 1px #dbdbdb;
	box-shadow: 0 0 10px #719ECE;
} */

.select_img img {
	margin: 20px 0;
}
</style>

<body>
	<h1>게시물 작성</h1>

	<div class="select_img">
		<img src="" />
	</div>
	<div class="inputArea">
		<label for="gdsImg">이미지</label> <input type="file" id="gdsImg"
			name="file" />


		<script src="/multistargram/resources/jquery-3.2.1.min.js"></script>
		<script>
			$("#gdsImg").change(
					function() {
						if (this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src",
										data.target.result).width(300);
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
		</script>
	</div>
	${member.user_id }
	<form action="/multistargram/artinsert" method="post">
	<input type="hidden" name ="user_id" value =${member.user_id }>
		<div class="inputArea">
			<textarea rows="5" cols="50" maxlength="100" id="content" name="article_content" placeholder="내용"></textarea>
		</div>
		<input type="submit" id="article_btn" value="작성하기">
	</form>
	<%-- <%=request.getRealPath("/") %> --%>
	
</body>
</html>