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
	<script src="<c:url value="/resources/jquery.form.js" />"></script>
	<div id="nav">
		<%@ include file="../include/header.jsp"%>
	</div>
	<div id="container">
		<div id="container-left" >
			<c:forEach var="article" items="${articles }">
				<div class="article" style="margin-bottom: 40px">
					<div class="article-header">
						<h4 id="user_id" style="margin-left: 4px">${article.user_id }</h4>
					</div>
					<div class="article-img">
						<img class="art-image" alt="이미지"
							src="${pageContext.request.contextPath}/${article.article_img }">
					</div>
					<div class="article-footer">
						<div class="aritcle-social">
							<i class="far fa-heart" style="font-size: 24px;"></i>
						</div>
						<div class="article-like">
							<h4 id="user_id">${article.like }</h4>
							&nbsp;<span class="content-text">명이 좋아합니다.</span>
						</div>
						<div class="article-content">
							<h4 id="user_id">${article.user_id }</h4>
							&nbsp;<span class="content-text">${article.article_content }</span><br>
							<span class="content-text">${article.article_time } 에 작성</span>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<div id="ajaxarticle"></div>
			<div id ="btndiv">
				<button id="addlistbtn" onclick="javascript:moreList(this);" value="2" style="width: 100%; margin-bottom: 20px;" >더보기</button>
			</div>
		</div>
		<div id="container-right">
		<div>
			<form>
			<%@ include file = "../board/boardindex.jsp" %>
			</form>
		</div>
		</div>
	</div>
	
	<script type="text/javascript">
	function moreList(btn){
        $.ajax({
            url : "/multistargram/ajaxinsert",
            type : "get",
            cache : false,
            dataType: 'json',
            data : {numberOfRequests : btn.value },
            success : function(data){
                console.log(data);
                if(data.length==0){
                    $('#addlistbtn').attr("disabled","disabled");
                    $('#addlistbtn').text("더 불러올 사진목록이 없습니다");
                } else {
                    // 불러올 펀딩 목록이 있는 경우
                    var content="";
                    for(var i=0; i<data.length; i++){
                    	console.log(data[i]);
                        content +=
                        '<div class="article" style="margin-bottom: 40px">'
                            +'<div class="article-header"><h4 id="user_id" style="margin-left: 4px">'+data[i].USER_ID+'</h4></div>'
                            +'<div class="article-img"><img class="art-image" alt="이미지" src = "${pageContext.request.contextPath}/'+data[i].ARTICLE_IMG+'"></div>'
                            +'<div class="article-footer">'
                            +'<div class="aritcle-social"><i class="far fa-heart" style="font-size: 24px;"></i></div>'
                            +'<div class="article-like"><h4 id="user_id">' + data[i].ARTICLE_LIKE + '</h4>&nbsp;<span class="content-text">명이 좋아합니다.</span></div>'
                            +'<div class="article-content"><h4 id="user_id">' + data[i].USER_ID + '</h4>&nbsp;<span class="content-text">' + data[i].ARTICLE_CONTENT
                            +'</span><br><span class="content-text">' + data[i].ARTICLE_TIME + '에 작성</span></div></div></div>';
                    }
               
                    // 기존 버튼을 지우고 새로 만들어줄때 value 값을 1 증가시켜서 다음 3개를 불러올 페이징넘버를 기억하게함.
                    var pagingNum = Number(btn.value) + 1;
                    content += '<div id="btndiv">'
                        +'<button type="button" id="addlistbtn" onclick="javascript:moreList(this);"'
                        +'value="'+pagingNum+'">'
                        +'더보기</button></div>';
                    //console.log("content : "+content);
                    $('#btndiv').remove();
                    $('#ajaxarticle').append(content);
                    $('#addlistbtn').css("width","100%");
                    $('#addlistbtn').css("margin-bottom","20px");
               }
               
            },
            error : function(){
               alert('ajax 통신 실패');
            }
      
    });
	}
	
	</script>



</body>
</html>
