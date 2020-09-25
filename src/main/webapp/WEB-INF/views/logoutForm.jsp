<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>

<h1>로그아웃</h1>

<form action="/logout" method="post">

    <sec:csrfInput/>
    <button>로그아웃</button>
</form>
</body>
</html>
