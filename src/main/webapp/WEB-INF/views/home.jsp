
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
            position:absolute;
            font-family: '맑은 고딕';
            display: block;
            margin-left: 10px;
            border: 1px solid #EFFBF5;
            position: fixed;
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



        .tb1 {
            width:250px;
            height:100px;
            border:1px solid #444444;
            position: absolute;
            right: 100px;
            bottom: 100px;
            background-color: #F2F2F2;
            text-align:center;
        }

        .ll {
            width: 248px;
            position: absolute;
            right: 100px;
            bottom: 155px;
        }
        #pay {
            width: 130px;
            background: #CEE3F6;
            border: none;
            font-size: 17px;
        }


        .tb2 {
            width:250px;
            height:100px;
            border:1px solid #444444;
            position: absolute;
            right: 400px;
            bottom: 100px;
            background-color: #F2F2F2;
            text-align:center;
        }

        .ll2 {
            width: 248px;
            position: absolute;
            right: 400px;
            bottom: 155px;
        }
        #check {
            width: 130px;
            background: #CEE3F6;
            border: none;
            font-size: 17px;
        }


        .d1 {
            width:560px;
            position: absolute;
            top: 40%;
            left: 30%;

        }
        input {
            font-size: 16px;
            width:450px;
            height:30px;
            float:left;
            border: 1px solid #00ff00;
        }

        input::placeholder{
            color:#81F781;
        }

        #sb {

            width: 100px;
            height: 30px;
            color: white;
            border: none;
            background: #CEE3F6;
            float:right;
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


<div class="d1">

    <input type="text" placeholder="시설 검색하기"/>
    <button id="sb">검색</button>
</div>


<table class="tb1">
    <tr>
        <th>장기요양 급여비용 계산</th>
    </tr>
    <tr>
        <td><button id="pay" onclick="window.open('http://www.longtermcare.or.kr/npbs/e/b/504/openPopEquipPaymtCalcu')">시설급여계산</button></td>
    </tr>
</table>
<hr class="ll" />


<table class="tb2">
    <tr>
        <th>장기요양등급 확인하기</th>
    </tr>
    <tr>
        <td><button id="check" onclick="window.open('http://www.longtermcare.or.kr/npbs/e/b/201/npeb201t02.web?menuId=npe0000000080')">장기요양등급</button></td>
    </tr>
</table>
<hr class="ll2" />


</body>
</html>