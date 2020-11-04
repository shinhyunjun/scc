<%@ page session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>read</title>

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

        h1 a {
            text-decoration: none;
            color: #81F781;
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
            color:black;
        }

        #d1{
            display:flex;
        }
        #d1 h4{

            margin-left: 6px;
            padding: 10px;
        }
        #d1 h5{

            color:red;
            margin-right: 8px;
            padding: 10px;
        }
        #d1 button{

            margin-left: 20px;
            padding: 20px;
        }


        th, td{
            padding:5px;
        }

        #back{
            background-color: #F2F2F2;
        }

        textarea{
            width:500px;
            height:150px;
        }

        td h5{
            color: black;
            font-weight: bold;
        }

    </style>
</head>

<script src="/js/jQuery-2.1.4.min.js"></script>



<body>


<h1>  <a href="/">   SCC  </a> </h1>
<nav id="nav_menu">
    <ul>
        <li><h4><a href="/sccSearch">요양시설 찾기</a></h4></li>
        <li><h4><a href="/qa">자주하는 질문</a></h4></li>
        <li><h4><a href="/notice/list">공지사항</a></h4></li>

        <sec:authorize access="!isAuthenticated()">   <!--로그인 하지 않은 경우-->
            <li><h4><a href="/login">회원가입/로그인</a></h4></li>
        </sec:authorize>


        <sec:authorize access="isAuthenticated()">  <!--인증된 경우-->
            <li> <h5> <sec:authentication property="principal.username"/> 님 <a href="/logout">로그아웃</a></h5></li>
        </sec:authorize>
    </ul>
</nav>
<br><br><br>
<hr width="100%">



<!-- 현재 페이지 번호, 페이징 크기, 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달-->
<input type="hidden" name="page" value="${pgrq.page}">
<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
<input type="hidden" name="searchType" value="${pgrq.searchType}">
<input type="hidden" name="keyword" value="${pgrq.keyword}">

<div id="d1">
    <h4>${scc_pr.scc_name}</h4>
    <h5>(${scc_pr.scc_grade})</h5>
    <button onclick="window.open('${scc_pr.detail_info}')"> 상세정보 </button>
</div>

<div>
    <p>
        주소 : ${scc_pr.scc_address} <br>
        연락처 : ${scc_pr.scc_phone} <br>
    </p>
<br>

    <table border="1px solid black">
        <tr>
            <th border="1px solid black" >정원</th>
            <th border="1px solid black" >현원</th>
            <th border="1px solid black" >잔여</th>
            <th border="1px solid black" >대기</th>
        </tr>
        <tr>
            <td border="1px solid black" >${scc_pr.limit_num}</td>
            <td border="1px solid black" >${scc_pr.state_num}</td>
            <td border="1px solid black" >${scc_pr.remaind_num}</td>
            <td border="1px solid black" >${scc_pr.wait_num}</td>
        </tr>
    </table>
</div>

<br>

<div id="map" style="width:100%;height:350px;"></div>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=147fd5c7cd7aa03b9a0757efe7860531&libraries=services"></script>
<script>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('${scc_pr.scc_address}', function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });


            /* 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'

            });
            infowindow.open(map, marker);
*/
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>

<br>
<div id="back" >
<form:form modelAttribute="reply" method="post">
    <table>

        <tr>
            <td  align="center" border="none"><form:textarea path="content" /></td>

        </tr>
    </table>

    <button  type="submit" id="btnRegister" align="right">등록</button>

</form:form>

<br>

<div id="reply2">
    <c:forEach items="${repList}" var="repList">

        <table >
            <tr>
                <td align="center" width="80"><h5>${repList.writer}</h5></td>
                <td align="left" width="400"><p> ${repList.content}</p></td>
            </tr>
        </table>
    </c:forEach>
</div>
</div>


<script>
    var formObj = $("#reply");

    $("#btnRegister").click(function(){
        formObj.submit();
    });
</script>




</body>
</html>