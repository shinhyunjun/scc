<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false"%>
<html>
<head>
    <title>Board</title>

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



        input, textarea{
            width:500px;
        }
        textarea{
            height:440px;
        }

        div{
            width:600px;
            text-align: center;

        }

        #btnRegister{
            background-color:#5882FA;
            color:white;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
        }

        #btnList{
            background-color:#5882FA;
            color:white;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
        }


    </style>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<script>
    $(document).ready(function() {

        var formObj = $("#notice");

        $("#btnRegister").on("click", function() {
            formObj.attr("action", "/notice/register");
            formObj.attr("method", "post");
            formObj.submit();
        });

        $("#btnList").on("click", function() {
            self.location = "/notice/list";
        });

    });
</script>

<body>


<h1>  <a href="/">   SCC  </a> </h1>
<nav id="nav_menu">
    <ul>
        <li><h4><a href="/sccSearch">요양시설 찾기</a></h4></li>
        <li><h4><a href="qa.html">자주하는 질문</a></h4></li>
        <li><h4><a href="/notice/list">공지사항</a></h4></li>

        <sec:authorize access="!isAuthenticated()">   <!--로그인 하지 않은 경우-->
            <li><h4><a href="/login">회원가입/로그인</a></h4></li>
        </sec:authorize>


        <sec:authorize access="isAuthenticated()">  <!--인증된 경우-->
            <li> <h5> <sec:authentication property="principal.username"/> 님 <a href="/logout">로그아웃</a></h5></li>
        </sec:authorize>
    </ul>
</nav>

<br><br><br><br>


<h2>공지사항 등록</h2><br>
<form:form modelAttribute="notice" action="register">
    <table>
        <tr>
            <td width="50" align="center">제목</td>
            <td width="550" align="center"><form:input path="title" /></td>
        </tr>
        <tr>
            <td width="50" align="center">작성자</td>
            <td width="550" align="center"><form:input path="writer" /></td>
        </tr>
        <tr>
            <td width="50" align="center">내용</td>
            <td width="550" align="center"><form:textarea path="content" /></td>
        </tr>

        <tr>
            <td width="70" align="center">첨부파일</td>
            <td width="100" align="center"><input type="file" name="picture" /></td>
        </tr>
    </table>
</form:form>

<div>
    <button  type="submit" id="btnRegister">등록</button>
    <button  type="submit" id="btnList">목록</button>
</div>


</body>
</html>
