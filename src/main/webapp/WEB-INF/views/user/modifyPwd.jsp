<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>비밀번호 변경</h2>

<form autocomplete="off">

    <table>
        <tr>
            <td><input type="password" name="user_password" id="user_password" placeholder="현재 비밀번호"/></td>
        </tr>
        <tr>
            <td><input type="password" name="user_password2" id="user_password2" placeholder="새 비밀번호"/></td>
        </tr>
        <tr>
            <td><input path="user_password" type="password" name="user_password3" placeholder="비밀번호 확인"/></td>
        </tr>
    </table>
</form>

</body>
</html>
