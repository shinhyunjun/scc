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

<form:form modelAttribute="member">
    <table>
        <tr>
            <td>비밀번호</td>
            <td><form:input path="user_password" type="password" name="user_password" id="user_password"
                            placeholder="비밀번호"/></td>
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
            var result = confirm("탈퇴하시겠습니까?");
            if(result) {
                formObj.attr("action", "/user/remove");
                formObj.submit();
            }
        });




    });
</script>
</body>
</html>
