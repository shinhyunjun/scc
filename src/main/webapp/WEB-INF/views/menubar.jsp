<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>


    * {
        margin: 0;
        padding: 0;
    }

    h1 {
        width: 90px;
        height: 63px;
        text-align: center;
        position: absolute;
        font-family: '맑은 고딕';
        display: block;
        margin-left: 10px;
        border: 1px solid #EFFBF5;

        background-color: #CEF6CE;
    }

    h1 a {
        text-decoration: none;
        color: white;
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


    h4 a {
        text-decoration: none;
        color: black;
    }

    .m1:hover {
        transform: scale(1.3);
    }

    .m2:hover {
        transform: scale(1.3);
    }

    .m3:hover {
        transform: scale(1.3);
    }

    .m4:hover {
        transform: scale(1.3);
    }

    .m5:hover {
        transform: scale(1.3);
    }

    .m6:hover {
        transform: scale(1.3);
    }

</style>


<h1><a href="/"> SCC </a></h1>
<nav id="nav_menu">
    <ul>
        <li><h4 class="m1"><a href="/sccSearch">요양시설 찾기</a></h4></li>
        <li><h4 class="m2"><a href="/qa">자주하는 질문</a></h4></li>
        <li><h4 class="m3"><a href="/notice/list">공지사항</a></h4></li>
        <sec:authorize access="hasRole('ROLE_MEMBER')">
            <li><h4 class="m4"><a href="/user/setup">마이페이지</a></h4></li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')"> <!--인증된 경우-->
            <li><h4 class="m5"><a href="/user/adminSetup">관리페이지</a></h4></li>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()"> <!--로그인 하지 않은 경우-->
            <li><h4 class="m6"><a href="/login">회원가입/로그인</a></h4></li>
        </sec:authorize>

        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')"> <!--인증된 경우-->
            <li><h5><sec:authentication property="principal.username"/> 님 <a href="/logout">로그아웃</a></h5></li>
        </sec:authorize>

    </ul>
</nav>
<br><br><br>
<hr width="100%">
