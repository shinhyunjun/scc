
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>
    <style>



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

<jsp:include page="menubar.jsp"/>


<div class="d1">

    <!--
    <input type="text" placeholder="시설 검색하기"/>
    <button id="sb">검색</button>
-->

    <form:form modelAttribute="pgrq" method="get" action="sccSearch" >

        <form:hidden path="searchType" items="${searchTypeCodeValueList}" itemValue="value" itemLabel="label" value="tc"/>
        <form:input path="keyword" placeholder="시설명 또는 지역구 검색하기" autocomplete="off"/>

           <button id='sb'>검색</button>

    </form:form>

    <!--  <button id='sb' onclick="location.href='/sccSearch?searchType=c&keyword=강남구'">검색</button>  -->
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

<!--
 <img src="img/human.jpg" width="100%">
-->

<script>
    var result = "${msg}";

    if (result === "SUCCESS") {
        alert("성공");
    }

    /*
    $("#sb").onclick(function(){

        var keyword = $("#keyword");
        var keywordVal = keyword.val();

        self.location="/sccSearch?searchType=t&keyword=" + keywordVal;

    })

     */




</script>
</body>
</html>