<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style>
        table {
            margin-left: 7px;
            background-color: #E6E6E6;
            padding: 15px;
        }

        input {
            width: 260px;
            height: 30px;
        }
    </style>
</head>
<body>

<jsp:include page="../menubar.jsp"/>

<h3 style="margin-left: 7px;">비밀번호 변경</h3>

<form:form modelAttribute="member" action="modifyPwd">
    <form:hidden path="user_no"/>
    <table>
        <tr>
            <td width="70">비밀번호</td>
            <td width="350"><form:password path="user_password" id="password"/></td>
        </tr>
        <tr>
            <td width="110">비밀번호 확인</td>
            <td width="350"><input type="password" id="password2"></td>
        </tr>
    </table>
</form:form>

<div style="margin-left: 7px;">
    <button type="submit" id="btnModifyPwd" onclick="test()">변경</button>
</div>

<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<script type="text/javascript">
    function test() {
        var p1 = document.getElementById('password').value;
        var p2 = document.getElementById('password2').value;

        if(p1 != p2) {
            alert("비밀번호가 일치하지 않습니다");
            return false;
        } else {
            return true;
        }
    }
</script>


<script type="text/javascript">


    $(document).ready(function() {
        var formObj = $("#member");

        $("#btnModifyPwd").on("click", function (){
            formObj.submit();
        });

    });

</script>
</body>
</html>
