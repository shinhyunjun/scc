<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8"/>
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        h1 {
            width: 90px;
            height: 63px;
            text-align: center;
            color: #81F781;
            font-family: '맑은 고딕';
            display: block;
            margin-left: 10px;
            border: 1px solid #EFFBF5;
            position: absolute;
            background-color: #CEF6CE;
        }

        #nav_menu ul {
            margin-top: 15px;
            list-style-type: none;
            padding-left: 0px;
            float: right;
        }

        #nav_menu ul li {
            display: inline-block;
            padding: 0px 10px 0px 10px;
            margin: 5px 0px 5px 0px;
        }

        h1 a {
            text-decoration: none;
            color: #81F781;
        }

        h4 a {
            text-decoration: none;
            color: black;
        }

        #sc {
            position: absolute;
            top: 95px;
            left: 10px;
        }

        table {
            position: absolute;
            top: 150px;
            left: 10px;
            border-collapse: collapse;
        }

        table a {
            text-decoration: none;
            color: #5858FA;
        }

        th, td {
            border: 1px solid black;
            padding: 5px;
        }


        #paging {
            top: 600px;
            left: 5px;
            position: absolute;
        }

        #paging li {
            list-style: none;
            float: left;
            padding: 6px;
        }

        li a {
            text-decoration: none;
        }

        #searchBtn {
            width: 80px;
            border: 0;
            outline: 0;
            background-color: #088A08;
            color: white;
        }

        #clear {
            width: 80px;
            border: 0;
            outline: 0;
            background-color: #B40404;
            color: white;
        }
    </style>


</head>
<body>

<jsp:include page="../menubar.jsp"/>

<!-- 검색폼 만들기 -->
<form:form modelAttribute="pgrq" method="get" action="list${pgrq.toUriStringByPage(1)}" autocomplete="off">

    <div id="sc">
        <form:select path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label"/>

        <form:input path="keyword"/>
        <button id='searchBtn'>검색</button>

        <!-- 인증된 사용자인 경우 -->
        <sec:authorize access="isAuthenticated()">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <input type="button" id="clear" value="작성" onclick="location.href='register'"/>
            </sec:authorize>

            <!--회원 권한을 가진 사용자인 경우 -->
        </sec:authorize>
    </div>


    <table>

        <tr style="background-color: yellow;">
            <th align="center" width="60">번호</th>

            <th align="center" width="300">제목</th>

            <th align="center" width="100">작성자</th>

            <th align="center" width="180">작성일</th>
        </tr>

        <c:choose>
            <c:when test="${empty list}">

                <tr>
                    <td colspan="4">
                        List is empty.
                    </td>
                </tr>
            </c:when>


            <c:otherwise>
                <c:forEach items="${list}" var="notice" varStatus="status">
                    <tr>
                        <td align="center">${pgrq.sizePerPage * (pgrq.page - 1)  + status.index + 1}</td>
                        <td align="left">
                            <a href="/notice/read${pgrq.toUriString(pgrq.page)}&boardNo=${notice.boardNo}">${notice.title}</a>
                        </td>
                        <td align="center">${notice.writer}</td>
                        <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${notice.regDate}"/></td>
                    </tr>

                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>

</form:form>


<div id="paging">
    <ul>
        <c:if test="${pagination.prev}">
            <li><a href="${pagination.startPage - 1}">&laquo;</a></li>
        </c:if>

        <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
            <li><a href="/notice/list${pageRequest.toUriString(idx)}">${idx}</a></li>
        </c:forEach>

        <c:if test="${pagination.next && pagination.endPage > 0}">
            <li><a href="${pagination.endPage +1}">&raquo;</a></li>
        </c:if>
    </ul>
</div>


<script>
    var result = "${msg}";

    if (result === "SUCCESS") {
        alert("성공");
    }
</script>


</body>
</html>
