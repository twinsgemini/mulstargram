<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="ko">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login | Test</title>
        <link rel="stylesheet" type="text/css" href="/multistargram/resources/login/styles.css" />
      </head>
      <body>
        <div>
          <!-- header -->
          <div id="header">
            <h1>
              <a href="#" class="title_logo" id="logo"></a>
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
            <form id="content" action="/multistargram/loginresult" method="POST">
              <fieldset class="login_form">
                <legend class="blind">로그인</legend>
                <div class="id_area">
                  <div class="input_row" id="id_area">
                    <span class="input_box">
                      <label for="id" class="lbl" id="label_id_area">아이디</label>
                      <input
                        type="text"
                        id="id"
                        name="user_id"
                        placeholder="아이디"
                        maxlength="45"
                        class="int"
                      />
                    </span>
                  </div>
                  <div class="error_area"></div>
                </div>
                <div class="pw_area">
                  <div class="input_row" id="pw_area">
                    <span class="input_box">
                      <label for="pw" class="lbl" id="label_pw_area"
                        >비밀번호</label
                      >
                      <input
                        type="password"
                        id="pw"
                        name="user_pw"
                        placeholder="비밀번호"
                        maxlength="45"
                        class="int"
                      />
                    </span>
                  </div>
                  <div class="error_area"></div>
                </div>
                <input
                  class="btn"
                  id="login"
                  type="submit"
                  value="로그인"
                  title="로그인"
                  alt="로그인"
                />
                <!-- 구현 여부 상의해야함 -->
                <div class="check_area"></div>
                <div class="find_info">
                  <a target="_blank" id="id_inquiry" href="/multistargram/findUserId">아이디 찾기</a>
                  <span class="bar" aria-hidden="true">|</span>
                  <a target="_blank" id="pw_inquiry" href="/multistargram/findUserPw">비밀번호 찾기</a>
                  <span class="bar" aria-hidden="true">|</span>
                  <a target="_blank" id="signin" href="/multistargram/memberinsert">회원가입</a>
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
    