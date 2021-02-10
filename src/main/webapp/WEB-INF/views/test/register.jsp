<%@ page session="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Title</title>

    <style>
        .clicked {
            background: black;
            color: white;
        }
    </style>
</head>
<body>

<table id="tb">
    <tr>
        <td id="one" class="col">1등급</td>
        <td id="two" class="col">2등급</td>
    </tr>
    <tr>
        <td id="three" class="col">3,4,5등급-시설급여</td>
        <td id="four" class="col">모름</td>
    </tr>
</table>

<table>
    <tr>
        <td id="scc" class="col2">요양원</td>
        <td id="scc2" class="col2">공동생활가정</td>
    </tr>
</table>

<table>
    <tr>
        <td id="sec1" class="col3">일반</td>
        <td id="sec2" class="col3">건보료 25~50%</td>
    </tr>
    <tr>
        <td id="sec3" class="col3">건보료 0~25%</td>
        <td id="sec4" class="col3">기초생활수급</td>
    </tr>
</table>

<table>
    <tr>
        <td>일비용 전국평균</td>
        <td id="price"></td>
    </tr>
    <tr>
        <td>본인부담금 비율</td>
        <td id="price2"></td>
    </tr>
    <tr>
        <td>일 본인부담금</td>
        <td id="price3"></td>
    </tr>
</table>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
    var col = document.getElementsByClassName("col");

    function handleClick(event) {

        for (var i =0; i < col.length;i++) {
            col[i].classList.remove("clicked");
        }
        event.target.classList.add("clicked");

    }

    function init() {
        for (var i = 0;i < col.length;i++) {
            col[i].addEventListener("click", handleClick);
        }
    }

    init();


</script>

<script>
    var col2 = document.getElementsByClassName("col2");

    function handleClick2(event) {

        for (var i =0; i < col2.length;i++) {
            col2[i].classList.remove("clicked");
        }
        event.target.classList.add("clicked");

    }

    function init2() {
        for (var i = 0;i < col2.length;i++) {
            col2[i].addEventListener("click", handleClick2);
        }
    }

    init2();


</script>

<script>
    var col3 = document.getElementsByClassName("col3");

    function handleClick3(event) {

        for (var i =0; i < col3.length;i++) {
            col3[i].classList.remove("clicked");
        }
        event.target.classList.add("clicked");

    }

    function init3() {
        for (var i = 0;i < col3.length;i++) {
            col3[i].addEventListener("click", handleClick3);
        }
    }

    init3();


</script>

<script>

    // Number 객체를 선언한다
    // 위의 선택지에 따라 숫자를 변환시킨다.
    // 0. 등급을 누르면 기본 금액 설정
    // (1등급 : 69150원(13830원), 2등급, 모름 : 64170원(12834원), 345: 59170원(11834원)
    // 1. 요양원-공동생활가정
    // 2. 일반-건보료 25~50%-건보료 0~25%-기초생활수급
    // 함수를 만들어서 버튼을 누를 때 마다 함수를 실행하는 방식으로 해야할 듯
    // class를 배열 단위로 실행 가능하면 함수로 만들어서
    // if문을 통해 col[0] == click => 계산함수 실행

    var price = document.getElementById("price");
    var price2 = document.getElementById("price2");
    var price3 = document.getElementById("price3");
    //switch문 활용 가능?
    var num;

   function compute() {
        /*
        for (var i =0; i < col.length;i++) {
            if(col[i].)
        }

         */
    }

    $("#one").on("click", function () {
        num = 69150;
        price.innerText = num + "원";
    });

    $("#two").on("click", function () {
        num = 64170;
        price.innerText = num + "원";
    });

    $("#three").on("click", function () {
        num = 59170;
        price.innerText = num + "원";
    })

    $("#four").on("click", function () {
        num = 64170;
        price.innerText = num + "원";
    });

    ///////////////////////////////////////////////////

    $("#sec1").on("click", function () {
        var num2 = num;
        num2 *= 1/5;
        price2.innerText = "20%";
        price3.innerText = num2 + "원"
    });

    $("#sec2").on("click", function () {
        var num2 = num;
        num2 *= 12/100;
        price2.innerText = "12%";
        price3.innerText = num2 + "원"
    });

    $("#sec3").on("click", function () {
        var num2 = num;
        num2 *= 8/100;
        price2.innerText = "8%";
        price3.innerText = num2 + "원"
    })

    $("#sec4").on("click", function () {
        var num2 = num;
        num2 = 0;
        price2.innerText = "0%";
        price3.innerText = num2 + "원"
    });




</script>
</body>
</html>
