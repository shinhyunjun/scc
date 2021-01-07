<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>

<jsp:include page="../menubar.jsp"/>
<br>

<h3>마이페이지</h3>


<button onclick="location.href='read?user_no=${member.user_no}'">계정관리</button>
<input type="button" id="list" value="즐겨찾기"/>



<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script>
    $("#list").on("click", function () {
         self.location = "/cart/list";
    });
</script>

</body>
</html>
