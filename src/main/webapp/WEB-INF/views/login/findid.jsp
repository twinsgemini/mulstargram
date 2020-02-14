<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Find ID | Test</title>
    <link rel="stylesheet" type="text/css" href="/multistargram/resources/login/styles.css" />
  </head>
  <body>
    <div>
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
      <!-- container -->
      <div id="container">
        <form id="content" action="/multistargram/findUserIdresult" method="POST">
          <fieldset class="find_form login_form">
            <legend class="blind">등록한 이름</legend>
            <div class="name_area">
              <div class="input_row" id="email_area">
                <span class="input_box">
                  <label for="id_inquiry" class="lbl" id="label_name_area">등록한 이름</label>
                  <input
                    type="text"
                    id="id_inquiry"
                    name="user_name"
                    value=""
                    placeholder="등록한 이름"
                    maxlength="47"
                    class="int"
                  />
                </span>
              </div>
              <div class="error_area"></div>
            </div>
            <div class="email_area">
              <div class="input_row" id="name_area">
                <span class="input_box">
                  <label for="email_inquiry" class="lbl" id="label_email_area"
                    >이메일</label
                  >
                  <input
                    type="text"
                    id="email_inquiry"
                    name="user_email"
                    value=""
                    placeholder="등록한 이메일"
                    maxlength="40"
                    class="int"
                  />
                </span>
              </div>
              <div class="error_area"></div>
            </div>
            <input
              class="btn"
              id="find"
              type="submit"
              value="다음"
              title="다음"
              alt="다음"
            />
            <!-- 구현 여부 상의해야함 -->
            <div class="check_area"></div>
            <div class="find_info">
                <a target="_blank" id="signin" href="/multistargram/memberinsert">회원가입</a>
                <span class="bar" aria-hidden="true">|</span>
                <a target="_blank" id="pw_inquiry" href="/multistargram/findUserPw">비밀번호 찾기</a>
                <span class="bar" aria-hidden="true">|</span>
                <a target="_blank" id="login" href="/multistargram">로그인</a>
            </div>
          </fieldset>
        </form>
      </div>
      <!-- //container -->
      <!-- footer -->
      <div id="footer"></div>
      <!-- //footer -->
    </div>
    <!-- javascript -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="/multistargram/resources/login/styles.js"></script>
  </body>
</html>
