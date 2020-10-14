<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Notice</title>
</head>
<body>

<form:form modelAttribute="notice" action="modify">
    <form:hidden path="boardNo" />

    <!-- 현재 페이지 번호, 페이징 크기, 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달-->
    <input type="hidden" name="page" value="${pgrq.page}">
    <input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
    <input type="hidden" name="searchType" value="${pgrq.searchType}">
    <input type="hidden" name="keyword" value="${pgrq.keyword}">

    <table>
        <tr>
            <td>TItle</td>
            <td><form:input path="title" /></td>
            <td><font color="red"><form:errors path="title" /></font></td>
        </tr>
        <tr>
            <td>Writer</td>
            <td><form:input path="writer" /></td>
            <td><font color="red"><form:errors path="writer" /></font></td>
        </tr>
        <tr>
            <td>Content</td>
            <td><form:textarea path="content" /></td>
            <td><font color="red"><form:errors path="content" /></font></td>
        </tr>
    </table>
</form:form>

<div>
    <sec:authentication property="principal" var="pinfo" />
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <button type="submit" id="btnModify">수정</button>
        <button type="submit" id="btnList">목록</button>
    </sec:authorize>
</div>

<script type="text/javascript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

        var formObj = $("#notice");

        $("#btnModify").on("click", function() {
            formObj.submit();
        });

        $("#btnList").on("click", function() {
            self.location = "list";
        });

    });
</script>
</body>
</html>