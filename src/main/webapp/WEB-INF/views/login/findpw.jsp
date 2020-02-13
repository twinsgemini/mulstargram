<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Find ID | Test</title>
    <link rel="stylesheet" type="text/css" href="../../../resources/login/styles.css" />
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
        <form id="content" action="ID 찾기 요청URL" method="POST">
          <fieldset class="find_form login_form">
            <legend class="blind">등록한 아이디</legend>
            <div class="id_area">
              <div class="input_row" id="id_area">
                <span class="input_box">
                  <label for="id_inquiry" class="lbl" id="label_id_area">등록한 아이디</label>
                  <input
                    type="text"
                    id="id_inquiry"
                    name="user_id"
                    value=""
                    placeholder="등록한 아이디"
                    maxlength="47"
                    class="int"
                  />
                </span>
              </div>
              <div class="error_area"></div>
            </div>
            <div class="birth_area">
              <div class="input_row" id="birth_area">
                <span class="input_box">
                  <label for="birth_inquiry" class="lbl" id="label_birth_area"
                    >생년월일</label
                  >
                  <input
                    type="text"
                    id="birth_inquiry"
                    name="user_birth"
                    value=""
                    placeholder="생년월일"
                    maxlength="8"
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
                <a target="_blank" id="signin" href="signin.html">회원가입</a>
                <span class="bar" aria-hidden="true">|</span>
                <a target="_blank" id="id_inquiry" href="findid.html">아이디 찾기</a>
                <span class="bar" aria-hidden="true">|</span>
                <a target="_blank" id="login" href="login.html">로그인</a>
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
    <script type="text/javascript" src="../../../resources/login/styles.js"></script>
  </body>
</html>
