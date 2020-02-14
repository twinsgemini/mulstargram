<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title></title>

</head>
<body>
<h1> ${member.userid } 회원님 로그아웃되셨습니다.</h1>
<% session.removeAttribute("member"); %>
<div id="countdown_board"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
countdown();
setTimeout(function(){countdown();} , 5000);

function countdown(){
    var currentDate = new Date()
    var dateAndTime = "홈으로 : " + currentDate.getDate() + "/"
                + (currentDate.getMonth()+1)  + "/" 
                + currentDate.getFullYear() + " @ "  
                + currentDate.getHours() + ":"  
                + currentDate.getMinutes() + ":" 
                + currentDate.getSeconds();
    $('#countdown_board').append("<p>" + dateAndTime + "</p>");
}
</script>
</body>
</html>