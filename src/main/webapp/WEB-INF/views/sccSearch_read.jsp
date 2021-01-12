<%@ page session="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<html>
<head profile="http://www.w3.org/2005/10/profile">
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
            position: absolute;
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
            color: black;
        }

        #d1 {
            display: flex;
        }

        #d1 h4 {

            margin-left: 6px;
            padding: 10px;
        }

        #d1 h5 {

            color: red;
            margin-right: 8px;
            padding: 10px;
        }

        #d1 button {

            margin-left: 20px;
            padding: 20px;
        }


        th, td {
            padding: 5px;
        }

        #back {
            background-color: #F2F2F2;
        }

        textarea {
            width: 500px;
            height: 150px;
        }

        td h5 {
            color: black;
            font-weight: bold;
        }

        .form-control {
            margin: 5px;
            width: 40%;
            height: 30%;
            vertical-align: top;
            text-align: left;
        }

        .input-group-btn {
            margin-top: 5px;
            margin-left: 585px;
        }

        #ff {
            margin-left: 8px;
        }

        #rep {
            display: flex;
            font-size: 18px;
        }

        .full {
            -webkit-filter: blur(5px);
            -moz-filter: blur(5px);
            -o-filter: blur(5px);
            -ms-filter: blur(5px);
            filter: blur(5px);

        }
    </style>
</head>


<body>


<jsp:include page="menubar.jsp"/>
<!-- 현재 페이지 번호, 페이징 크기, 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달-->
<input type="hidden" name="page" value="${pgrq.page}">
<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
<input type="hidden" name="searchType" value="${pgrq.searchType}">
<input type="hidden" name="keyword" value="${pgrq.keyword}">
<input type="hidden" id="rno" name="rno" value="${Reply.rno}">

<div id="d1">
    <h4>${scc_pr.scc_name}</h4>
    <h5>(${scc_pr.scc_grade})</h5>


    <sec:authorize access="isAuthenticated()">
       <!-- <p id="star" style="text-decoration: none; font-size: 30px; color:blue;">☆</p> -->
        <button type="button" id="addCart_btn">스크랩</button>
    </sec:authorize><br>

    <button onclick="window.open('${scc_pr.detail_info}')"> 상세정보</button>
</div>

<div>
    <p>
        주소 : ${scc_pr.scc_address} <br>
        연락처 : ${scc_pr.scc_phone} <br>
    </p>
    <br>

    <table border="1px solid black">
        <tr>
            <th border="1px solid black">정원</th>
            <th border="1px solid black">현원</th>
            <th border="1px solid black">잔여</th>
            <th border="1px solid black">대기</th>
        </tr>
        <tr>
            <td border="1px solid black">${scc_pr.limit_num}</td>
            <td border="1px solid black">${scc_pr.state_num}</td>
            <td border="1px solid black">${scc_pr.remaind_num}</td>
            <td border="1px solid black">${scc_pr.wait_num}</td>
        </tr>
    </table>
</div>

<br>

<div id="map" style="width:100%;height:350px;"></div>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=147fd5c7cd7aa03b9a0757efe7860531&libraries=services"></script>
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
    geocoder.addressSearch('${scc_pr.scc_address}', function (result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });



            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">${scc_pr.scc_name}</div>'

            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>
<br>

<!--
<div>
    <a href="#" onclick="if(confirm('추천하시겠습니까?') == false) {return false;}">좋아요</a>
    <sapn id="cnt1" style="color: red; font-weight: normal;">0</sapn>
</div>
-->

<br>
<div class="full">
    <sec:authorize access="!isAuthenticated()"> <!--로그인 하지 않은 경우-->
        <div class="container">
            <label for="content">댓글 ${count}</label>
            <form id="commentInsertForm2">
                <div class="input-group">
                    <input type="hidden" name="bno" value="${scc_pr.scc_num}" readonly="true"/>
                    <input type="text" class="form-control" id="content2" name="content" placeholder="내용을 입력하세요."
                           readonly="true">
                    <br>
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" id="commentInsertBtn2" readonly="true">등록</button>
                </span>

                </div>
            </form>
        </div>

        <div class="container">
            <div class="commentList"></div>
        </div>
    </sec:authorize>
</div>

<sec:authorize access="!isAuthenticated()"> <!--로그인 하지 않은 경우-->
    <button style="border: 1px solid black; width: 100px; height: 50px;  margin: 0 auto; position: absolute; bottom:-40%; left:40%; width:100px; background-color:#04B431; color: white;  border:0;
            outline: 0; border-radius: 5px;" onclick="location.href='/login'">로그인 하기
    </button>
</sec:authorize>


<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
    <div class="container">
        <label for="content">댓글 ${count}</label>
        <form id="commentInsertForm">
            <div class="input-group">
                <input type="hidden" name="bno" value="${scc_pr.scc_num}"/>
                <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
                <br>
                <span class="input-group-btn">
                        <button class="btn btn-default" type="button" id="commentInsertBtn">등록</button>
                </span>

            </div>
        </form>
    </div>
    <div class="container">
        <div class="commentList"></div>
    </div>
</sec:authorize>


<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("#reply");

        $("#btnRegister").click(function () {
            formObj.submit();
        });


        $("#btnRemove").on("click", function () {
            formObj.attr("action", "/sccSearch_remove");
            formObj.submit();
        });
    })


</script>

<script type="text/javascript">
    var bno = '${scc_pr.scc_num}'; //게시글 번호

    $('#commentInsertBtn').click(function () { //댓글 등록 버튼 클릭시

        var content = $('#content').val();
        if (content == '') {
            alert('댓글을 입력하세요.');
            return false;
        }

        var insertData = $('#commentInsertForm').serialize(); //commentInsertForm의 내용을 가져옴
        commentInsert(insertData); //Insert 함수호출(아래)
        alert("등록이 완료되었습니다");
    });


    function displayTime(timeValue) {


        var dateObj = new Date(timeValue);
        var str = "";

        var yy = dateObj.getFullYear();
        var mm = dateObj.getMonth() + 1;
        var dd = dateObj.getDate();
        var hh = dateObj.getHours();
        var mi = dateObj.getMinutes();
        var ss = dateObj.getSeconds();

        return [yy, '-', mm, '-', dd, ' ', (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
            ':', (ss > 9 ? '' : '0') + ss].join('');

    }


    //댓글 목록
    function commentList() {
        $.ajax({
            url: '/comment/list',
            type: 'get',
            data: {'bno': bno},
            success: function (data) {
                var a = '';
                $.each(data, function (key, value) {
                    a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                    a += '<div class="commentInfo' + value.cno + '" style="font-weight: bold; font-size: 18px; display: block;">' + value.writer;

                    a += '</div>  <div class="commentContent' + value.cno + '" style="font-size: 16px; padding:8px;"> <p> ' + value.content + '</p>';
                    a += '<div class="commentDate' + value.cno + '">' + displayTime(value.regdate) + "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp";

                    a += '<sec:authentication property="principal" var="pinfo"/>';
                    a += '<sec:authorize access="hasRole('ROLE_MEMBER')">';

                    var b = (value.writer);
                    if (b ==  ${pinfo.username}) {
                        a += '<a onclick="commentUpdate(' + value.cno + ',\'' + value.content + '\');" style="border:1px solid red; width:150px;"> 수정 </a>';
                        a += '<a onclick="commentDelete(' + value.cno + ');" style="border:1px solid blue; width:150px; margin-left: 5px;"> 삭제 </a>';
                    }

                    a += '</sec:authorize>';

                    a += '<sec:authorize access="hasRole('ROLE_ADMIN')">';
                    a += '<a onclick="commentUpdate(' + value.cno + ',\'' + value.content + '\');" style="border:1px solid red; width:150px;"> 수정 </a>';
                    a += '<a onclick="commentDelete(' + value.cno + ');" style="border:1px solid blue; width:150px; margin-left: 5px;"> 삭제 </a>';
                    a += '</sec:authorize>';

                    a += '</div></div></div>';
                });

                $(".commentList").html(a);

            }
        });
    }

    //댓글 등록
    function commentInsert(insertData) {
        $.ajax({
            url: '/comment/insert',
            type: 'get',
            data: insertData,
            success: function (data) {
                if (data == 1) {
                    commentList(); //댓글 작성 후 댓글 목록 reload
                    $('#content').val('');
                }
            }
        });
    }

    //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
    function commentUpdate(cno, content) {
        var a = '';

        a += '<div class="input-group">';
        a += '<textarea type="text" class="form-control" name="content_' + cno + '" value="' + content + '"/>';
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc(' + cno + ');">수정</button> </span>';
        a += '</div>';

        $('.commentContent' + cno).html(a);

    }

    //댓글 수정
    function commentUpdateProc(cno) {
        var updateContent = $('[name=content_' + cno + ']').val();

        $.ajax({
            url: '/comment/update',
            type: 'get',
            data: {'content': updateContent, 'cno': cno},
            success: function (data) {
                if (data == 1) commentList(bno); //댓글 수정후 목록 출력
            }
        });
    }

    //댓글 삭제
    function commentDelete(cno) {
        var result = confirm("삭제하시겠습니까?");
        if (result) {
            $.ajax({
                url: '/comment/delete/' + cno,
                type: 'get',
                success: function (data) {
                    if (data == 1) commentList(bno); //댓글 삭제후 목록 출력
                }
            });
        } else {
            return;
        }
    }


    $(document).ready(function () {
        commentList(); //페이지 로딩시 댓글 목록 출력
    });


</script>


<script>

    var formObj = $("#reply");
    var badTalk = new Array('개새끼', '개색기', '개색끼', '개자식', '씨발', '씨팔', '씨부랄', '병신', '바보', 'ㅅㅂ', 'ㅂㅅ', 'ㅄ');
    var tmp;
    var bool = true;


    $("#btnRegister").click(function () {

        var content = $('#content').val();

        for (var i = 0; i < badTalk.length; i++) {

            tmp = content.indexOf(badTalk[i]);
            if (tmp >= 0) {
                bool = false;
                break;
            }
        }

        if (bool == false)
            alert("욕설을 금지합니다.");
        else {
            formObj.submit();
        }
    });


    $("#btnEdit").click(function () {

        var rno = $("#rno");
        var rnoVal = rno.val();

        self.location = "/replyUpdate?rno=" + rnoVal;
    })

    $("#btnRemove").click(function () {

        // formObj.attr("action", "/replyDelete");
        //  formObj.submit();


    })
</script>



<script>
    $(document).ready(function(){

        $("#star").click(function () {

            var a = confirm('추천하시겠습니까?');

            if(a == true) {
                //$('#star').val('★');
                alert(1);
            }
        })

    })

    var sccNum = '${scc_pr.scc_num}'; //게시글 번호
    $("#addCart_btn").click(function(){

        $.ajax({
            url:"/cart/insert",
            type:"get",
            data: {'sccNum': sccNum},
            success: function(){
                alert("카트담기 성공");
            }
        })
    })
</script>
</body>
</html>