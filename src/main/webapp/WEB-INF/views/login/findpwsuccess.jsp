<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Success | Test</title>
    <link rel="stylesheet" type="text/css" href="/multistargram/resources/login/styles.css" />
</head>
<body>
    <!-- header -->
    <div id="header">
        <h1>
          <a href="logo.logo" class="title_logo" id="logo"></a>
          <span class="blind">로고 여기</span>
        </h1>
        <div class="lang">
          <select id="locale" name="locale" title="언어선택" class="select">
            <option value="ko_KR">한국어</option>
            <option value="en_US">English</option>
          </select>
        </div>
      </div>
      <!-- //header -->
      <div id="container">
          <div id="content">
              <h3><span id="your_inquiry">회원님의 PW는</span></h3>
              <h1><span> ${pw.user_pw }</span><h1>
              <h3><span>입니다. 나가세요.</span></h3>
              <div class="find_info">
                <a target="_blank" id="id_inquiry" href="/multistargram/findUserId">아이디 찾기</a>
                <span class="bar" aria-hidden="true">|</span>
                <a target="_blank" id="pw_inquiry" href="/multistargram/findUserPw">비밀번호 찾기</a>
                <span class="bar" aria-hidden="true">|</span>
                <a target="_blank" id="signin" href="/multistargram">로그인</a>
              </div>
          </div>
      </div>
      <!-- footer -->
      <div id="footer"></div>
      <!-- //footer -->
    </div>
    <!-- javascript -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="/multistargram/resources/login/styles.js"></script>
</body>
</html>