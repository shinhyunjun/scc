<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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

<h3 style="margin-left: 7px;">회원 탈퇴</h3>

<form:form modelAttribute="member" action="remove">
    <form:hidden path="user_no"/>
    <form:hidden path="user_password" id="password"/>
    ${member.user_password}
    <table>
        <tr>
            <td width="110">비밀번호 입력</td>
            <td width="350"><input type="password" id="password2"></td>
        </tr>
    </table>
</form:form>

<div style="margin-left: 7px;">
    <button type="submit" id="btnRemove">입력</button>
</div>


<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<script type="text/javascript">


    $(document).ready(function() {
        var formObj = $("#member");


        $("#btnRemove").on("click", function (){

            var user_password = $('#password').val();
            var user_password2 = $('#password2').val();

            if (user_password == '') {
                alert('비밀번호를 입력하세요.');
                return false;
            } else if(user_password != user_password2){
                alert("비밀번호가 일치하지 않습니다");
                return false;
            } else {
                var result = confirm("탈퇴하시겠습니까?");
                if(result) {
                    formObj.attr("action", "/user/remove");
                    formObj.submit();
                    alert("탈퇴가 완료되었습니다.");
                }

            }
        });




    });
</script>

</body>
</html>
