<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Multistagram</title>
</head>
<style type="text/css">
#nav{
	border-bottom: 1px solid rgba(219, 219, 219, 1);
	height: 120px;
}

#nav-in {
	width: 90%;
	height: 100%;
	margin: auto;
}

#nav-in-con {
	height: 90%;
	width: 90%;
	margin: auto;
}

#nav-in-con-tit {
	float: left;
}

#nav-in-con-so {
	float: right;
}
.inputArea {
	border: solid 1px #efefef;
	border-radius: 6px;
	padding: 12px 16px;
}

#content {
	resize: none;
	border: 0;
	outline: 0;
}

.select_img img {
	margin: 20px 0;
}
.container{
	width: 80%;
	height: 100%;
	margin: auto;
	padding-top: 40px;
}
</style>

<body>
	<script src="/multistargram/resources/jquery-3.2.1.min.js"></script>
	<div id="nav">
		<%@ include file="../include/header.jsp"%>
	</div>

	<div class ="container">

		<form action="/multistargram/artinsert" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="user_id" value=${member.user_id }>
			<br><br>
			<div class="inputArea">
				<label for="gdsImg">이미지</label> <input type="file" id="gdsImg"
					name="file" />		
					<div class="select_img"><img src="" /></div>
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
			<div class="inputArea">
				<textarea rows="5" cols="50" maxlength="100" id="content"
					name="article_content" placeholder="내용" required="required"></textarea>
			</div>
			<input type="submit" id="article_btn" value="작성하기">
		</form>
	</div>
</body>
</html>