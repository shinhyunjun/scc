
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title> 로그인 </title>

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

        #login-form {
            width:600px;
            height:60px;
            position: absolute;
            top: 240px;
            left: 520px;
        }

        #login-form input{

            width:450px;
            height: 45px;
            margin: 5px;
        }

        div{
            width: 600px;
            height: 60px;
            position: absolute;
            top: 417px;
            left: 525px;
        }

        div button{
            width:223px;
            height: 45px;
        }

    </style>


</head>
<body>
<h1>  <a href="/home">   SCC  </a> </h1>
<nav id="nav_menu">
    <ul>
        <li><h4><a href="search.html">요양시설 찾기</a></h4></li>
        <li><h4><a href="qa.html">자주하는 질문</a></h4></li>
        <li><h4><a href="post.html">공지사항</a></h4></li>
        <li><h4><a href="/login">회원가입/로그인</a></h4></li>
    </ul>
</nav>

<form id="login-form" method="post">
    <input name="userid" type="text" placeholder="아이디">
    <input name="password" type="password" placeholder="비밀번호">
    <input name="btn" type="submit" value="로그인">
</form>

<div>
    <button onclick="location.href='sign/sign'">회원가입</button>
    <button>계정찾기</button>
</div>
</body>
</html>