
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            height: 63px;
            text-align: center;
            position:absolute;
            font-family: '맑은 고딕';
            display: block;
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


    #qa{
        position: absolute;
        top: 18%;
        left: 38%;
    }

    #qq{
        margin-bottom:10px;
    }

    #menu{
        width:300px;
        border:1px solid black;

    }

    #menu p {
        margin-top:6px;
        margin-bottom:6px;
    }
    </style>


</head>
<body>

<h1>  <a href="/">   SCC  </a> </h1>
<jsp:include page="menubar.jsp"/>


<br><br><br><br>
<h3 id="qq">top 7</h3>
<div id="menu">
    <p>scc 서비스</p>
    <p>등급</p>
    <p>등급별 현황</p>
    <p>등급없음</p>
    <p>요양원</p>
    <p>장기요양보험 필요성</p>
    <p>장기요양보험 서비스</p>
    <p>장기요양보험, 국민건강보험</p>
</div>

<iframe
        id="qa"
        allow="microphone;"
        width="480"
        height="580"
        src="https://console.dialogflow.com/api-client/demo/embedded/67135558-a179-49c0-8ee4-478528dbe9bf">
</iframe>

</body>
</html>