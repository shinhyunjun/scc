<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<h2>로그아웃</h2>

<form action="/logout" method="post">
    <sec:csrfInput />
    <button>로그아웃</button>
</form>
