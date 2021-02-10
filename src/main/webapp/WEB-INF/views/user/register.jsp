<%@ page session="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>가입해보자!</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        h1 {
            width: 90px;
            height: 63px;
            text-align: center;
            color: #81F781;
            font-family: '맑은 고딕';
            display: block;
            margin-left: 10px;
            border: 1px solid #EFFBF5;
            position: absolute;
            background-color: #CEF6CE;
        }

        #nav_menu ul {
            margin-top: 15px;
            list-style-type: none;
            padding-left: 0px;
            float: right;
        }

        #nav_menu ul li {
            display: inline-block;
            padding: 0px 10px 0px 10px;
            margin: 5px 0px 5px 0px;
        }

        h1 a {
            text-decoration: none;
            color: #81F781;
        }

        h4 a {
            text-decoration: none;
            color: black;
        }

        form {
            width: 600px;
            height: 600px;
            position: absolute;
            top: 190px;
            left: 520px;
            text-align: center;
        }

        td {
            font-size: 15px;
        }

        .idCheck {
            height: 30px;
            background-color: yellow;
        }

        form input {
            width: 450px;
            height: 30px;
            margin: 7px;
        }


        #divId #user_id {
            width: 400px;
            margin-right: 3px;
        }

        #divId strong {

            align: right;
            font-size: 12px;
            color: #9F81F7;
        }

        #btnRegister {
            width: 460px;
            height: 30px;
            margin: 7px;
        }

        form img {
            width: 100px;

        }

        #upImgFile {
            width: 200px;
        }

    </style>


</head>
<body>
<jsp:include page="../menubar.jsp"/>

<form:form modelAttribute="member" action="register" enctype="multipart/form-data" autocomplete="off">
    <fieldset>
        <legend>회원가입</legend>


        <table>
            <tr>
                <td>프로필사진</td>
                <div align="center">
                    <img id="thumbnailImg" src="">
                    <form:input path="picture" type="file" id="upImgFile" onchange="uploadImgPreview();"/>
                </div>
            </tr>
            <tr>
                <td>아이디</td>
                <td>
                    <div align="center" id="divId">
                        <form:input path="user_id" type="text" name="user_id" id="user_id" placeholder="아이디"/>
                        <strong class="idCheck">중복체크</strong>
                    </div>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <p class="result" style="display: none;">
                        <span class="msg"></span>
                    </p>
                </td>
            </tr>
            <!--  <div id="checkMsg"></div> -->
            <!-- <h4 align="left" style="display:none">숨길내용입니다.</h4> -->
            <tr>
                <td>비밀번호</td>
                <td><form:input path="user_password" type="password" name="user_password" id="user_password"
                                placeholder="비밀번호"/></td>
            </tr>
            <tr>
                <td>비밀번호확인</td>
                <td><input type="password" id="user_password2" placeholder="비밀번호 확인"/></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><form:input path="user_name" type="text" name="user_name" id="user_name" placeholder="이름"/></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><form:input path="user_birth" type="text" name="user_birth" id="testDatepicker"
                                placeholder="생년월일"/></td>
            </tr>

            <tr>
                <td>성별</td>
                <td align="left">
                    <form:select path="user_sex" type="text" name="user_sex" id="user_sex">
                        <form:option value="남" label="남"/>
                        <form:option value="여" label="여"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><form:input path="user_phone" type="text" name="user_phone" id="user_phone" placeholder="연락처"/></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><form:input path="user_email" type="text" name="user_email" id="user_email" placeholder="이메일"/></td>
            </tr>


            <tr>
                <td></td>
                <td>
                    <button type="submit" id="btnRegister" disabled="disabled">가입하기</button>
                </td>
            </tr>
        </table>

    </fieldset>
</form:form>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
    $(function () {
        $("#testDatepicker").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: 'c-100:c+0',
            dateFormat: "yy/mm/dd",
            dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
            monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        });
    });
</script>


<script>

    var formObj = $("#member");

    $("#btnRegister").on("click", function () {

        var user_id = $('#user_id').val();
        var user_password = $('#user_password').val();
        var user_password2 = $('#user_password2').val();

        var user_name = $('#user_name').val();
        var user_sex = $('#user_sex').val();
        var user_birth = $('#user_birth').val();
        var user_phone = $('#user_phone').val();
        var user_email = $('#user_email').val();
        var text = "@";

        if (user_id == '') {
            alert('아이디를 입력하세요.');
            return false;
        } else if (user_password == '') {
            alert('비밀번호를 입력하세요.');
            return false;
        } else if (user_name == '') {
            alert('성함을 입력하세요.');
            return false;
        } else if (user_birth == '') {
            alert('생년월일을 입력하세요.');
            return false;
        } else if (user_sex == '') {
            alert('성별을 입력하세요.');
            return false;
        } else if (user_phone == '') {
            alert('전화번호를 입력하세요.');
            return false;
        } else if (user_email.indexOf(text) == -1) {
            alert("이메일 형식을 확인해주세요.");
            return false;
        } else if (user_password != user_password2) {
            alert('비밀번호를 다시 입력해주세요.');
            return false;
        } else {
            formObj.submit();
        }

    });
</script>

<script type="text/javascript">
    
    function uploadImgPreview() {

        let fileInfo = document.getElementById("upImgFile").files[0];
        let reader = new FileReader();

        reader.onload = function () {

            document.getElementById("thumbnailImg").src = reader.result;

        };


        if (fileInfo) {

            reader.readAsDataURL(fileInfo);
        }

        var img = document.getElementById('thumbnailImg')
        var width = img.width;

    }

</script>

<script>


    $(".idCheck").click(function () {

        var query = {user_id: $("#user_id").val()};

        $.ajax({
            url: "/user/idCheck",
            type: "get",
            data: query,
            success: function (data) {


                if (data == 1) {
                    $(".result .msg").text("이미 사용중이거나 탈퇴한 아이디입니다.");
                    $(".result .msg").attr("style", "color:#f00");
                    $("#btnRegister").attr("disabled");
                    $(".result").show();
                } else {
                    $(".result .msg").text("사용가능한 아이디입니다!")
                    $(".result .msg").attr("style", "color:#00f");
                    $("#btnRegister").removeAttr("disabled");
                    $(".result").show();
                }
            }
        });
    });

</script>
</body>
</html>