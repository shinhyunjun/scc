<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>

<!DOCTYPE html>

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
            position:absolute;
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

        h4 a {
            text-decoration: none;
            color:black;
        }

        div {
            width:400px;
            position: absolute;
            top: 130px;
            left: 10px;

        }
        div input{
            margin-top: 10px;
            width:200px;
            height: 25px;
        }

        .seoul{
            position: absolute;
            top: 260px;
            left: 10px;
        }

        .choice{

            width:200px;
            height:20px;
            position: absolute;
            top: 298px;
            left: 10px;
            border:1px solid black;
            text-align: center;
        }

        #bx{
            overflow:auto;
            width:200px;
            height:250px;
            position: absolute;
            top: 320px;
            left: 10px;
            border:1px solid black;
            text-align: center;
        }

        #bx p{
            color:darkgrey
        }



        table{
            width:900px;
            font-size: 14px;

            position:absolute;
            top:200px;
            right:100px;
        }

    </style>

</head>
<body>


<h1>  <a href="/home">   SCC  </a> </h1>
<nav id="nav_menu">
    <ul>
        <li><h4><a href="/sccSearch">요양시설 찾기</a></h4></li>
        <li><h4><a href="qa.html">자주하는 질문</a></h4></li>
        <li><h4><a href="/notice/list">공지사항</a></h4></li>
        <li><h4><a href="/login">회원가입/로그인</a></h4></li>
    </ul>
</nav>




<h5 class="seoul">서울특별시</h5>
<div class="choice">구 선택</div>
<div id="bx" >
    <p>강남구</p>
    <p>강동구</p>
    <p>강북구</p>
    <p>강서구</p>
    <p>관악구</p>
    <p>광진구</p>
    <p>구로구</p>
    <p>금천구</p>
    <p>노원구</p>
    <p>도봉구</p>
    <p>동대문구</p>
    <p>동작구</p>
    <p>마포구</p>
    <p>서대문구</p>
    <p>서초구</p>
    <p>성동구</p>
    <p>성북구</p>
    <p>송파구</p>
    <p>양천구</p>
    <p>영등포구</p>
    <p>용산구</p>
    <p>은평구</p>
    <p>종로구</p>
    <p>중구</p>
    <p>중랑구</p>
</div>


<form:form modelAttribute="sccPr" method="POST" action="search">
<br><br><br><br><br><br><br>

검색 <form:input path="scc_name" /><input type="submit" value="Search" />

<table border="1">
    <tr>
        <th align="center" width="80">name</th>
        <th align="center" width="320">grade</th>
        <th align="center" width="100">address</th>

    </tr>




    <c:forEach items="${list}" var="scc">
        <tr>
            <td align="center">${scc.scc_name}</td>
            <td align="center">${scc.scc_grade}</td>
            <td align="center">${scc.scc_address}</td>
        </tr>
    </c:forEach>

</table>
</form:form>


</body>
</html>