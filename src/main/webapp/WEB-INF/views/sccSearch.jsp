<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title></title>


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
            top: 160px;
            right: 100px;
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

        #searchBtn {
            width: 60px;
            border: 0;
            outline: 0;
            background-color: #013ADF;
            color: white;
        }

    </style>

    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>

    <script>

        $(document).ready(function () {

            $('p').on({
                mouseenter: function () {
                    $(this).addClass('reverse')
                },
                mouseleave: function () {
                    $(this).removeClass('reverse')
                }
            })


        })
    </script>

</head>

<body>


<jsp:include page="menubar.jsp"/>


<h5 class="seoul">서울특별시</h5>
<div class="choice">구 선택</div>


<!-- 지역구 목록
<div id="bx">

    <p><a href="/sccSearch?searchType=c&keyword=강남구">강남구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=강동구">강동구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=강북구">강북구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=강서구">강서구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=관악구">관악구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=광진구">광진구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=구로구">구로구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=금천구">금천구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=노원구">노원구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=도봉구">도봉구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=동대문구">동대문구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=동작구">동작구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=마포구">마포구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=서대문구">서대문구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=서초구">서초구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=성동구">성동구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=성북구">성북구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=송파구">송파구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=양천구">양천구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=영등포구">영등포구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=용산구">용산구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=은평구">은평구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=종로구">종로구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=중구">중구</a></p>
    <p><a href="/sccSearch?searchType=c&keyword=중랑구">중랑구</a></p>
</div>
-->

<div id="bx">
<c:forEach items="${list2}" var="list2" varStatus="status">

    <p><span><a href="/sccSearch?searchType=c&keyword=${list2.scc_district}">${list2.scc_district}</a>  ${list2.cnt} </span></p>

</c:forEach>
</div>


<br><br><br><br>

<!-- 검색폼 만들기 -->
<form:form modelAttribute="pgrq" method="get" action="sccSearch${pgrq.toUriStringByPage(1)}" autocomplete="off">
    <form:select path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label"/>

    <form:input path="keyword"/>

    <button id='searchBtn'>검색</button>
</form:form>

<table>

    <thead>
    <tr>
        <th align="center" width="40">no</th>
        <th align="center" width="320">요양원명</th>
        <th align="center" width="120">등급</th>
        <th align="center" width="507">주소</th>

    </tr>
    </thead>


    <tbody>
    <c:forEach items="${list}" var="scc">
        <tr>
            <td align="center">${scc.scc_num}</td>

            <!-- 게시글 상세보기할 때 페이징 요청정보를 매개변수로 전달-->
            <td align="left"><b><a
                    href="/sccSearch_read${pgrq.toUriString(pgrq.page)}&scc_num=${scc.scc_num}"> ${scc.scc_name} </a>
            </b></td>
            <td align="center">${scc.scc_grade}</td>
            <td align="left">${scc.scc_address}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<!-- 페이징 네비게이션 -->
<div id="paging">
    <c:if test="${pagination.prev}">
        <a href="/sccSearch${pagination.makeQuery(pagination.startPage -1)}">&laquo;</a>
    </c:if>

    <c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
        <a href="/sccSearch${pageRequest.toUriString(idx)}">${idx}</a> <!-- 페이지 누를때 url-->
    </c:forEach>

    <c:if test="${pagination.next && pagination.endPage > 0}">
        <a href="/sccSearch${pagination.makeQuery(pagination.endPage + 1)}"> &raquo; </a>
    </c:if>
</div>


</body>
</html>

