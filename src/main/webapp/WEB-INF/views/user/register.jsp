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
            width: 600px;
            height: 600px;
            position: absolute;
            top: 190px;
            left: 520px;
            text-align: center;
        }

        form input {
            width: 450px;
            height: 30px;
            margin: 7px;
        }
        form button {
            width: 450px;
            height: 30px;
            margin: 7px;
        }

        form img {
            width: 70px;

        }


    </style>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

    <script>
        $(document).ready(function() {

            var formObj = $("#member");

            $("#btnRegister").on("click", function() {

                formObj.submit();
            });


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
<body bgcolor="#EFF5FB">
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

<form:form  modelAttribute="member" action="register">
    <fieldset>
        <legend>회원가입</legend>

        <!--
        <div>
            <img id="thumbnailImg" src="">
            <input type="file" accept="image/*" id="upImgFile" onchange="uploadImgPreview();" />
        </div>
        -->
        <form:input path="user_id" type="text" name="user_id" id="user_id" placeholder="아이디"/>
        <form:input path="user_password" type="password" name="user_password" id="user_password" placeholder="비밀번호"/>
        <form:input path="user_name" type="text" name="user_name" id="user_name" placeholder="이름"/>
        <form:input path="user_birth" type="number" name="user_birth" id="user_birth" placeholder="생년월일" />
        <form:input path="user_age" type="number" name="user_age" id="user_age" placeholder="나이"/>
        <form:input path="user_sex" type="text" name="user_sex" id="user_sex" placeholder="성별"/>
        <form:input path="user_phone" type="text" name="user_phone" id="user_phone" placeholder="연락처"/>
        <form:input path="user_email" type="text" name="user_email" id="user_email" placeholder="이메일"/>

        <button type="submit" id="btnRegister">가입하기</button>


    </fieldset>
</form:form>


</body>
</html>