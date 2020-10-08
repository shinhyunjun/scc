<%@ page session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<html>
<head>
    <title>read</title>

    <style>
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

        table{
            border:1px solid black;
            border-collapse: collapse;
        }
        th, td{
            border:1px solid black;
            padding:5px;
        }
    </style>
</head>

<script src="/js/jQuery-2.1.4.min.js"></script>



<body>

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

    <table>
        <tr>
            <th>정원</th>
            <th>현원</th>
            <th>잔여</th>
            <th>대기</th>
        </tr>
        <tr>
            <td>${scc_pr.limit_num}</td>
            <td>${scc_pr.state_num}</td>
            <td>${scc_pr.remaind_num}</td>
            <td>${scc_pr.wait_num}</td>
        </tr>
    </table>
</div>


<div id="map" style="width:100%;height:350px;"></div>

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


            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">회사</div>'

            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>
</body>
</html>