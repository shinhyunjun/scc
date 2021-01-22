<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Error</title>
</head>
<body>

<h2><c:out value="${msg}"/></h2>
<button onclick="self.location='/'">홈 으로 돌아가기</button>
</body>
</html>
