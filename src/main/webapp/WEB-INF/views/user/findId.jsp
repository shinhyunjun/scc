<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>

        #div1 {
            width: 80%;
            height: 120px;
            background-color: mediumseagreen;
        }

        #div1 p {
            text-align: center;
            color: white;
            font-size: 23px;
        }

        #div2 {
            width: 80%;

            text-align: center;
        }

        #div2 h4 {
            color: #F78181;
        }

        #div3 input {
            width: 260px;
            height: 45px;
        }

        #div4 input {
            width: 260px;
            height: 45px;
        }

        button {
            width: 260px;
            height: 35px;
        }

        #div22 {
            width: 80%;

            text-align: center;
        }

        #div22 h4 {
            color: #F78181;
        }

        #div33 input {
            width: 260px;
            height: 45px;
        }

        #div44 input {
            width: 260px;
            height: 45px;
        }
    </style>


</head>
<body>

<div id="div1">
    <br>
    <p>계정 찾기</p>
</div>

<div id="div2">
    <h4>아이디 찾기</h4>
    <hr>
</div>


<form:form modelAttribute="member" action="findId" method="post" autocomplete="off">
    <div style="line-height:80%">

        <div id="div3">
            <h4>이름</h4>
            <input type="text" name="user_name" id="user_name" placeholder="가입시 등록한 이름를 입력하세요">
        </div>

        <div id="div4">
            <h4>이메일</h4>
            <input type="email" name="user_email" id="user_email" placeholder="가입시 등록한 이메일을 입력하세요">
        </div>


        <br>
        <button type="submit" id="btnRegister">아이디 찾기</button>

    </div>
</form:form>


<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<script>


</script>
</body>
</html>
