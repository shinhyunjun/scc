<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        h1 {
            width: 90px;
            height: 55px;
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
            color:black;
        }

        #sc{
            position: absolute;
            top: 95px;
            left: 10px;
        }

        table{

            position: absolute;
            top: 150px;
            left: 10px;
        }
        div ul{
            position: absolute;
            top: 450px;
            left: 10px;
            font-size: 18px;
            float: left;
        }

        li {
            list-style: none;

            float: left;
            padding: 6px;
        }

        li a{
            text-decoration: none;
        }
    </style>



</head>
<body>
<h1>  <a href="/home">   SCC  </a> </h1>
<nav id="nav_menu">
    <ul>
        <li><h4><a href="/sccSearch">요양시설 찾기</a></h4></li>
        <li><h4><a href="qa.html">자주하는 질문</a></h4></li>
        <li><h4><a href="/list">공지사항</a></h4></li>
        <li><h4><a href="/login">회원가입/로그인</a></h4></li>
    </ul>
</nav>




<form:form modelAttribute="notice" method="POST" action="search">

    <div id="sc">
    TITLE : <form:input path="title" /><input type="submit" value="Search" />
    </div>


    <table border="1">

        <tr>
            <th align="center" width="60">NO</th>

            <th align="center" width="300">TITLE</th>

            <th align="center" width="100">WRITER</th>

            <th align="center" width="180">REGDATE</th>
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
                <c:forEach items="${list}" var="notice">
                    <tr>
                        <td align="center">${notice.boardNo}</td>
                        <td align="left"><a href="/notice/read?boardNo=${notice.boardNo}">${notice.title}</a></td>
                        <td align="right">${notice.writer}</td>
                        <td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${notice.regDate}" /></td>
                    </tr>

                </c:forEach>

            </c:otherwise>

        </c:choose>
    </table>



</form:form>







<div>
    <ul>
        <c:if test="${pageMaker.prev}">
            <li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
        </c:if>

        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
        </c:forEach>

        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
        </c:if>
    </ul>
</div>



</body>
</html>
