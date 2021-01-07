<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>비밀번호 변경</h2>

<form:form modelAttribute="member" action="modifyPwd">
    <table>
        <!--
        <tr>
            <td><input type="password" name="user_password" id="user_password" placeholder="현재 비밀번호"/></td>
        </tr>
        -->

        <tr>
            <td><form:input path="user_password"/></td>
        </tr>
        <!--
        <tr>
            <td><input path="user_password" type="password" name="user_password3" placeholder="비밀번호 확인"/></td>
        </tr>
        -->
    </table>
</form:form>

<div>
    <button type="submit" id="btnModifyPwd">비밀번호 변경</button>
</div>



<script type="text/javascript">


    $(document).ready(function() {
        var formObj = $("#member");

        $("#btnModifyPwd").on("click", function (){
            formObj.submit();
            alert("수정이 완료되었습니다")
        });

    });

</script>
</body>
</html>
