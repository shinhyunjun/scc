<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <style>
        @import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);

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
            position: absolute;
            margin-left: 10px;
            border: 1px solid #EFFBF5;
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

        div a {
            text-decoration: none;
            color: #181907
        }

        h4 a {
            text-decoration: none;
            color: black;
        }

        div {
            width: 400px;
            position: absolute;
            top: 130px;
            left: 10px;

        }

        div input {
            margin-top: 10px;
            width: 200px;
            height: 25px;
        }

        .seoul {
            position: absolute;
            top: 260px;
            left: 10px;
        }

        .choice {

            width: 200px;
            height: 20px;
            position: absolute;
            top: 298px;
            left: 10px;
            border: 1px solid black;
            text-align: center;
            font-family: 'Malgun Gothic';
        }

        #bx {
            overflow: auto;
            width: 200px;
            height: 250px;
            position: absolute;
            top: 320px;
            left: 10px;
            border: 1px solid black;
            text-align: center;
        }


        #bx p {
            color: black;

        }

        .reverse {
            background-color: #58ACFA;
        }

        table {

            position: absolute;
            top: 150px;
            center: 50px;
            border-collapse: collapse;
        }

        table a {
            text-decoration: none;
            color: #088A4B;
        }

        th, td {
            border: 1px solid black;
            padding: 5px;
        }

        td {
            font-size: 13px;
        }

        #paging {
            top: 580px;
            left: 405px;
            position: absolute;
        }

        #paging li {
            float: left;
            list-style: none;

            padding: 6px;
        }

        li a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<jsp:include page="../menubar.jsp"/>
<br>

<form:form modelAttribute="pgrq" method="get" action="list${pgrq.toUriStringByPage(1)}">
    <form:select path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label"/>

    <form:input path="keyword"/>
    <button id="searchBtn">검색</button>
</form:form>

<!-- 유저 리스트 테이블 -->
<table border="1">
    <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>성별</th>
        <th>생일</th>
        <th>가입일</th>
    </tr>
    <c:choose>
        <c:when test="${empty list}">
            <tr>
                <td colspan="9">
                    데이터가 없습니다
                </td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach items="${list}" var="member">
                <tr>
                    <td align="center">${member.user_no}</td>
                    <td align="center"><a href="/user/read?user_no=${member.user_no}">${member.user_id}</a></td>
                    <td align="center">${member.user_name}</td>
                    <td align="center">${member.user_phone}</td>
                    <td align="center">${member.user_email}</td>
                    <td align="center">${member.user_sex}</td>
                    <td align="center">${member.user_birth}</td>
                    <td align="center"><fmt:formatDate value="${member.user_date}" pattern="yyyy-MM-dd"/></td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>

<div id="paging">
    <!-- startPage가 1일 경우 false 이므로 이전 페이지로 돌아가는 << 기호 출력안함 -->
    <!-- startPage가 11, 21,.... 일 경우 << 기호를 누르면 n-1 페이지로 돌아간다 -->
    <c:if test="${pagination.prev}">
        <a href="${pageRequest.toUriString(pagination.startPage-1)}">&laquo;</a>
    </c:if>

    <!-- 1~10페이지 까지 출력 c:forEach var=n begin=a end= b => a~b까지 n을 증가 시킨다(like for문)-->
    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
        <a href="/user/list${pageRequest.toUriString(idx)}">${idx}</a>
    </c:forEach>

    <!-- endPage가 0이상, 게시글의 총 숫자가 endPage * 10보다 클 경우 >> 기호 클릭 시 다음 페이지로 넘어간다 -->
    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="${pageRequest.toUriString(pagination.endPage+1)}">&raquo;</a>
    </c:if>
</div>


</body>
</html>
