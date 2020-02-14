// 2020 02 13
// 정규식으로 유효성 검사

//모든 공백 체크 정규식
var empR = /\s/g;
// 아이디 정규식
var idR = /^[a-z0-9]{4,19}$/;
// 비밀번호 정규식
var pwR = /^[a-zA-Z0-9]{4,12}$/;
// 이름 정규식
var nameR = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var emailR = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
// 휴대폰 번호 정규식
var phoneR = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

$(document) .ready(function() {
					// 아이디 중복확인
					$("#id") .blur( function() {
										if ($('#id').val() == '') {
											$('#idMsg').text('아이디를 입력하세요.');
											$('#idMsg').css('color', 'red');
										} else if (idR.test($('#id').val()) != true) {
											$('#idMsg').text(
													'4~12자의 영문, 숫자만 사용 가능합니다.');
											$('#idMsg').css('color', 'red');
										} else if ($('#id').val() != '') {
											var user_id = $('#id').val();
											$
													.ajax({
														async : true,
														type : 'POST',
														data : user_id,
														url : '컨트롤러에서 받을 누군가에게',
														// json 형식 굳이 써야하나?
														// dateType: 'json',
														// contentType:
														// "application/json;
														// charset=UTF-8",
														success : function(data) {
															if (data.cnt > 0) {
																$('#idMsg')
																		.text(
																				'중복된 아이디 입니다.');
																$('#idMsg')
																		.css(
																				'color',
																				'red');
																$("#usercheck")
																		.attr(
																				"disabled",
																				true);
															} else {
																if (idR
																		.test(user_id)) {
																	$('#idMsg')
																			.text(
																					'사용가능한 아이디 입니다.');
																	$('#idMsg')
																			.css(
																					'color',
																					'blue');
																	$(
																			"#usercheck")
																			.attr(
																					"disabled",
																					false);
																} else if (user_id == '') {
																	$('#idMsg')
																			.text(
																					'아이디를 입력해주세요.');
																	$('#idMsg')
																			.css(
																					'color',
																					'red');
																	$(
																			"#usercheck")
																			.attr(
																					"disabled",
																					true);
																} else {
																	$('#idMsg')
																			.text(
																					"아이디는 소문자와 숫자 4~12자리만 가능합니다.");
																	$('#idMsg')
																			.css(
																					'color',
																					'red');
																	$(
																			"#usercheck")
																			.attr(
																					"disabled",
																					true);
																}
															}
														}
													});// end ajax
										}// end else if
									});// end blur
					// 빨간펜 등장
					$('#id')	.blur(	function() {
										if (idR.test($('#id').val())) {
											$('#idMsg').text('');
										} else {
											$('#idMsg').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
											$('#idMsg').css('color', 'red');
										}
									});
					$('#pw1').blur(function() {
						if (pwR.test($('#pw1').val())) {

							$('#pw1Msg').text('');
						} else {
							$('#pw1Msg').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
							$('#pw1Msg').css('color', 'red');
						}
					});
					// 1~2 패스워드 일치 확인
					$('#pw').blur(function() {
						if ($('#pw1').val() != $(this).val()) {
							$('#pwMsg').text('비밀번호가 일치하지 않습니다.');
							$('#pwMsg').css('color', 'red');
						} else {
							$('#pwMsg').text('');
						}
					});
					// 이름에 특수문자 들어가지 않도록 설정
					$("#name")	.blur(	function() {
										if (nameR.test($(this).val())) {
											$("#nameMsg").text('');
										} else {
											$('#nameMsg').text(	'한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
											$('#nameMsg').css('color', 'red');
										}
									});
					$("#email").blur(function() {
						if (emailR.test($(this).val())) {
							$("#emailMsg").text('');
						} else {
							$('#emailMsg').text('이메일 양식을 확인해주세요.');
							$('#emailMsg').css('color', 'red');
						}
					});
					// 생일 유효성 검사
					var birthR = false;
					// 생년월일 birthR 유효성 검사
					$('#user_birth')
							.blur(
									function() {
										var dateStr = $(this).val();
										var year = Number(dateStr.substr(0, 4)); 										
										var month = Number(dateStr.substr(4, 2)); 										
										var day = Number(dateStr.substr(6, 2)); 
										
										var today = new Date(); // 날짜 변수 선언
										var yearNow = today.getFullYear(); // 올해
										
										// 2019 12 25, 8자 까지
										if (dateStr.length <= 8) {
											// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면
											// false를 반환합니다.
											if (year > yearNow || year < 1900) {
												$('#birthMsg').text(
														'출생년도 확인해주세요');
												$('#birthMsg').css('color',
														'red');
											} else if (month < 1 || month > 12) {
												$('#birthMsg').text(
														'생일을 확인해주세요 ');
												$('#birthMsg').css('color',
														'red');
											} else if (day < 1 || day > 31) {
												$('#birthMsg').text(
														'날짜를 확인해주세요 ');
												$('#birthMsg').css('color',
														'red');
											} else if ((month == 4
													|| month == 6 || month == 9 || month == 11)
													&& day == 31) {
												$('#birthMsg').text(
														'생년월일을 확인해주세요 ');
												$('#birthMsg').css('color',
														'red');
											} else if (month == 2) {
												// 윤달 체크
												var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
												if (day > 29
														|| (day == 29 && !isleap)) {
													$('#birthMsg').text(
															'생년월일을 확인해주세요 ');
													$('#birthMsg').css('color',
															'red');
												} else {
													$('#birthMsg').text('');
													birthR = true;
												}
											} else {
												$('#birthMsg').text('');
												birthR = true;
											}// end of if
										} else {
											// 입력값이 8자 초과할때 : auth:false
											$('#birthMsg')
													.text('생년월일을 확인해주세요 ');
											$('#birthMsg').css('color', 'red');
										}
									}); // End 생년월일
					// 휴대전화
					$('#phoneNum').blur(function() {
						if (phoneR.test($(this).val())) {
							$("#phoneNoMsg").text('');
						} else {
							$('#phoneNoMsg').text('휴대폰번호를 확인해주세요 ');
							$('#phoneNoMsg').css('color', 'red');
						}
					});
				});


							// alert 지옥의 시작
					$('form').on( 'submit', function() {
						// 8개 항목 먼저 false 값으로 유효성 검사 준비
						var inval_Arr = new Array(7).fill(false);
						if (idR.test($('#id').val())) {
							inval_Arr[0] = true;
						} else {
							inval_Arr[0] = false;
							alert('아이디를 확인하세요.');
							return false;
						}
						// 비밀번호가 같은 경우 && 비밀번호 정규식
						if (($('#pw1').val() == ($('#pw').val()))
								&& pwR.test($('#pw1').val())) {
							inval_Arr[1] = true;
						} else {
							inval_Arr[1] = false;
							alert('비밀번호를 확인하세요.');
							return false;
						}
						// 이름 정규식
						if (nameR.test($('#name').val())) {
							console.log(nameR.test($('#name').val()))
							inval_Arr[2] = true;
						} else {
							inval_Arr[2] = false;
							alert('이름을 확인하세요.');
							return false;
						}
						// 생년월일 정규식
						if (birthR) {
							inval_Arr[3] = true;
						} else {
							inval_Arr[3] = false;
							alert('생년월일을 확인하세요.');
							return false;
						}
						// 이메일 정규식
						if (emailR.test($('#user_email').val())) {
							inval_Arr[4] = true;
						} else {
							inval_Arr[4] = false;
							alert('이메일을 확인하세요.');
							return false;
						}
						// 휴대폰번호 정규식
						if (phoneR.test($('#user_phone').val())) {
							inval_Arr[5] = true;
						} else {
							inval_Arr[5] = false;
							alert('휴대폰 번호를 확인하세요.');
							return false;
						}
						
						if (user_gender.checked == false) {
							inval_Arr[6] = false;
							alert('성별을 확인하세요.');
							return false;
						} else {
							inval_Arr[6] = true;
						}
						// 전체 유효성 검사
						var validAll = true;
						for (var i = 0; i < inval_Arr.length; i++) {
							if (inval_Arr[i] == false) {
								validAll = false;
							}
						}
						// 유효성 모두 통과
						if (validAll == true) {
							alert('이제 나가세요.');
						} else {
							alert('정보를 다시 확인하세요.')
						}
					});// end alert 지옥 끝
					
// // mvc로 아이디 유효성 검사(1 = 중복 / 0 != 중복)
// $("#id").blur(function () {
//     var user_id = $('#id').val();
//     $.ajax({
//         url: '${pageContext.request.contextPath}/컨트롤러에서 지정/idCheck?userId=' + user_id,
//         type: 'get',
//         success: function (data) {
//             if (data == 1) {
//                 // 1 : 아이디가 중복되는 문구
//                 $("#idMsg").text("사용중인 아이디입니다");
//                 $("#idMsg").css("color", "red");
//                 $("#submit").attr("disabled", true);
//             } else {

//                 if (idR.test(user_id)) {
//                     // 0 : 아이디 길이 / 문자열 검사
//                     $("#idMsg").text("");
//                     $("#submit").attr("disabled", false);

//                 } else if (user_id == "") {

//                     $('#idMsg').text('아이디를 입력해주세요');
//                     $('#idMsg').css('color', 'red');
//                     $("#submit").attr("disabled", true);

//                 } else {

//                     $('#idMsg').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
//                     $('#idMsg').css('color', 'red');
//                     $("#submit").attr("disabled", true);
//                 }
//             }
//         }
//     });
// });

// 2020 02 12

// // mvc를 이용한 id,email 중복처리
$("#id").keyup(function () {
    $.ajax({
        url: "'${pageContext.request.contextPath}/member/idcheck", 
        type: "POST",
        data: { "id": $("#id").val() },
        success: function (result) {
            if (result == 1) {
                $("#idMsg").html("중복된 아이디가 있습니다.");
                $("#submit").attr("disabled", "disabled");
            } else {
                $("#idMsg").html("");
                $("#submit").removeAttr("disabled");
            }
        },
    })
});

$("#email").keyup(function () {
    $.ajax({
        url: "'${pageContext.request.contextPath}member/emailcheck",
        type: "POST",
        data: { "email": $("#email").val() },
        success: function (result) {
            if (result == 1) {
                $("#emailMsg").html("중복된 이메일이 있습니다.");
            } else {
                $("#emailMsg").html("");
            }
        },
    })
});

// // alert로 비밀번호 유효성 검사
// $(function () {
//     $("#signin_form").submit(function () {
//         if ($("#pw").val() !== $("#pw1").val()) {
//             alert("비밀번호가 다릅니다.");
//             $("#pw").val("").focus();
//             $("#pw1").val("");
//             return false;
//         } else if ($("#pw").val().length < 4) {
//             alert("비밀번호는 4자 이상으로 설정해야 합니다.");
//             $("#pw").val("").focus();
//             $("#pw1").val("");
//             return false;
//         } else if ($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()) {
//             alert("공백은 입력이 불가능합니다.");
//             return false;
//         }
//     });

//2020 20 11