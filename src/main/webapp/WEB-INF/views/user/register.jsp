<%@ page session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
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
            width:600px;
            height: 600px;
            position: absolute;
            top: 190px;
            left: 520px;
            text-align: center;
        }

#exception{
    width:100px;
}

        form input {
            width:450px;
            height: 30px;
            margin: 7px;
        }

        #divId #user_id{
            width:400px;
            margin-right:0px;
        }

        #divId button{

            align: right;

        }
        #btnRegister {
            width: 450px;
            height: 30px;
            margin: 7px;
        }

        form img {
            width: 100px;

        }

        #upImgFile{
            width:200px;
        }

    </style>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

    <script>
        $(document).ready(function() {

            var formObj = $("#member");

            $("#btnRegister").on("click", function() {

                var user_id = $('#user_id').val();
                var user_password = $('#user_password').val();
                var user_name = $('#user_name').val();
                var user_sex = $('#user_sex').val();
                var user_birth = $('#user_birth').val();
                var user_age = $('#user_age').val();

                if (user_id == '') {
                    alert('아이디를 입력하세요.');
                    return false;
                }

                else if (user_password == '') {
                    alert('비밀번호를 입력하세요.');
                    return false;
                }

                else if (user_name == '') {
                    alert('성함을 입력하세요.');
                    return false;
                }
                else if (user_birth == '') {
                    alert('생년월일을 입력하세요.');
                    return false;
                }
                else if (user_age == '') {
                    alert('나이를 입력하세요.');
                    return false;
                }
                else if (user_sex == '') {
                    alert('성별을 입력하세요.');
                    return false;
                }

                formObj.submit();
            });

/*
            $(".idCheck").click(function(){

                var query = {user_id : $("#user_id").val()};

                $.ajax({
                    url : "/user/idCheck",
                    type : "post",
                    data : query,
                    success : function(data) {

                        if(data == 1) {
                            $(".result .msg").text("사용 불가");
                            $(".result .msg").attr("style", "color:#f00");
                        } else {
                            $(".result .msg").text("사용 가능");
                            $(".result .msg").attr("style", "color:#00f");
                        }
                    }
                });  // ajax 끝
*/




            <sec:authorize access="hasRole('ROLE_ADMIN')">
            $("#btnList").on("click", function() {
                self.location = "list";
            });
            </sec:authorize>

        });
    </script>

    <script type="text/javascript">

    </script>

</head>
<body >
<h1>  <a href="/">   SCC  </a> </h1>
<nav id="nav_menu">
    <ul>
        <li><h4><a href="search.html">요양시설 찾기</a></h4></li>
        <li><h4><a href="/qa">자주하는 질문</a></h4></li>
        <li><h4><a href="/notice/list">공지사항</a></h4></li>
        <li><h4><a href="/login">회원가입/로그인</a></h4></li>
    </ul>
</nav>
<br><br><br>
<hr width="100%">

<form:form  modelAttribute="member" action="register" enctype="multipart/form-data">
    <fieldset>
        <legend>회원가입</legend>

        <div align="center">
            <img id="thumbnailImg" src="" >
            <form:input path="picture" type="file"  id="upImgFile" onchange="uploadImgPreview();" />
        </div>

        <div align="center" id="divId">
            <form:input path="user_id" type="text" name="user_id" id="user_id" placeholder="아이디"/>
            <button class="idCheck">중복체크</button>
        </div>

        <p class="result">
            <span class="msg">아이디를 확인해주심시오</span>
        </p>

        <!--  <div id="checkMsg"></div> -->
          <!-- <h4 align="left" style="display:none">숨길내용입니다.</h4> -->

        <form:input path="user_password" type="password" name="user_password" id="user_password" placeholder="비밀번호"/>
        <form:input path="user_name" type="text" name="user_name" id="user_name" placeholder="이름"/>
        <form:input path="user_birth" type="number" name="user_birth" id="user_birth" placeholder="생년월일" />
        <form:input path="user_age" type="number" name="user_age" id="user_age" placeholder="나이"/>
        <form:input path="user_sex" type="text" name="user_sex" id="user_sex" placeholder="성별"/>
        <form:input path="user_phone" type="text" name="user_phone" id="user_phone" placeholder="연락처"/>
        <form:input path="user_email" type="text" name="user_email" id="user_email" placeholder="이메일"/>

        <button type="submit" id="idck">가입하기</button>

    </fieldset>
</form:form>

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
</body>
</html>