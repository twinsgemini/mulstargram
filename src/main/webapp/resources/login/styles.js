
// alert로 비밀번호 유효성 검사
$(function () {
    $("#signin_form").submit(function () {
        if ($("#pw").val() !== $("#pw1").val()) {
            alert("비밀번호가 다릅니다.");
            $("#pw").val("").focus();
            $("#pw1").val("");
            return false;
        } else if ($("#pw").val().length < 10) {
            alert("비밀번호는 10자 이상으로 설정해야 합니다.");
            $("#pw").val("").focus();
            $("#pw1").val("");
            return false;
        } else if ($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()) {
            alert("공백은 입력이 불가능합니다.");
            return false;
        }
    });

    // 아이디 유효성 검사(1 = 중복 / 0 != 중복)
    $("#user_id").blur(function () {
        var user_id = $('#id').val();
        $.ajax({
            url: '${pageContext.request.contextPath}/컨트롤러에서 지정/idCheck?userId=' + user_id,
            type: 'get',
            success: function (data) {
                if (data == 1) {
                    // 1 : 아이디가 중복되는 문구
                    $("#id_check").text("사용중인 아이디입니다");
                    $("#id_check").css("color", "red");
                    $("#reg_submit").attr("disabled", true);
                } else {

                    if (idJ.test(user_id)) {
                        // 0 : 아이디 길이 / 문자열 검사
                        $("#id_check").text("");
                        $("#reg_submit").attr("disabled", false);

                    } else if (user_id == "") {

                        $('#id_check').text('아이디를 입력해주세요');
                        $('#id_check').css('color', 'red');
                        $("#reg_submit").attr("disabled", true);

                    } else {

                        $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
                        $('#id_check').css('color', 'red');
                        $("#reg_submit").attr("disabled", true);
                    }

                }
            }, error: function () {
                console.log("실패");
            }
        });
    });


    $("#id").keyup(function () {
        $.ajax({
            url: "요청URL",
            type: "POST",
            data: { id: $("#id").val() },
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
            url: "요청URL",
            type: "POST",
            data: { email: $("#email").val() },
            success: function (result) {
                if (result == 1) {
                    $("#emailMsg").html("중복된 이메일이 있습니다.");
                } else {
                    $("#emailMsg").html("");
                }
            },
        })
    });
})

