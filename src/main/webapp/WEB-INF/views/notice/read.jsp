<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notice</title>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<body>

    <h2>공지사항</h2>

    <form:form modelAttribute="notice">
        <form:hidden path="boardNo"/>

        <!-- 현재 페이지 번호, 페이징 크기, 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달-->
        <input type="hidden" name="page" value="${pgrq.page}">
        <input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
        <input type="hidden" name="searchType" value="${pgrq.searchType}">
        <input type="hidden" name="keyword" value="${pgrq.keyword}">

        <table>
            <tr>
                <td>Title</td>
                <td><form:input path="title" readonly="true"/> </td>
            </tr>

            <tr>
                <td>Writer</td>
                <td><form:input path="writer" readonly="true"/> </td>
            </tr>

            <tr>
                <td>Content</td>
                <td><form:input path="content" readonly="true"/> </td>
            </tr>
        </table>
    </form:form>

    <div>


        <button type="submit" id="btnList">목록</button>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
             <button type="submit" id="btnEdit">편집</button>
             <button type="submit" id="btnRemove">삭제</button>
        </sec:authorize>


    </div>


    <script>
        $(document).ready(function(){

            var formObj = $("#notice");

            console.log(formObj);

            $("#btnList").on("click", function() {
                self.location = "/notice/list";
            });

            $("#btnEdit").on("click", function() {
                var boardNo = $("#boardNo");
                var boardNoVal = boardNo.val();

                self.location = "/notice/modify?boardNo="+boardNoVal;
            });

            $("#btnRemove").on("click", function() {
                formObj.attr("action", "/notice/remove");
                formObj.submit();
            });
        })
    </script>

</body>
</html>
