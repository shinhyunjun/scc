<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<html>
<head>
    <title>Title</title>

    <style>
        table{
            position: absolute;
            top:40%;
            left:50%;
            transform: translate(-50%,-50%);
            table-layout: fixed;
            border-collapse: collapse;
        }
        table a {
            text-decoration: none;
            color: #013ADF;
        }
        th, td {
            border: 1px solid gray;
            padding: 5px;
        }
        #dv{
            position: absolute;
            top:28%;
            left:17%;
        }
        .selectDelete_btn{
            margin-left: 870px;
        }

    </style>
</head>
<body>

<jsp:include page="../menubar.jsp"/>

<!--
<div id="dv">
    <span>
        <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
        <button type="button" class="selectDelete_btn">선택 삭제</button>
    </span>
</div>
-->

<table>

    <thead>
    <tr>
        <th align="center" width="320">요양원명</th>
        <th align="center" width="120">등급</th>
        <th align="center" width="507">주소</th>

    </tr>
    </thead>

    <tbody>

    <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
    <button type="button" class="selectDelete_btn">선택 삭제</button>
    <c:forEach items="${cartList}" var="scc">
        <tr>
            <!-- 게시글 상세보기할 때 페이징 요청정보를 매개변수로 전달-->
            <td align="center">

                <input type="checkbox" name="chBox" class="chBox" var="${scc.cartNum}" />

                <b>
                    <a href="/sccSearch_read${pgrq.toUriString(pgrq.page)}&scc_num=${scc.sccNum}"> ${scc.scc_name} </a>
                </b>

            </td>
            <td align="center">${scc.scc_grade}</td>
            <td align="center">${scc.scc_address}</td>

        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<!-- 모두 선택-->
<script>
    $("#allCheck").click(function(){
        var chk = $("#allCheck").prop("checked");
        if(chk) {
            $(".chBox").prop("checked", true);
        } else {
            $(".chBox").prop("checked", false);
        }
    });

    $(".chBox").click(function(){
        $("#allCheck").prop("checked",false);
    })
</script>

<!--
<script>
    $(".delete_btn").click(function(cartNum){

        var result = confirm("삭제하시겠습니까?");
        if (result) {
            $.ajax({
                url: '/cart/delete/' + cartNum,
                type: 'get',
                success: function () {
                    location.href = "/cart/list";
                }
            });
        }
    });
</script>
-->

<script>

    $(".selectDelete_btn").click(function(){
        var confirm_val = confirm("정말 삭제하시겠습니까");

        if(confirm_val){
            var checkArr = new Array();

            $("input[class='chBox']:checked").each(function(){

                checkArr.push($(this).attr("var"));
            })

            $.ajax({
                url: "/cart/deleteCart",
                type: 'get',
                data: {chBox:checkArr},
                success: function(result){
                    if(result == 1) {
                        location.href = "/cart/list";
                    } else {
                        alert("삭제 실패");
                    }

                }
            })
        }
    })
</script>

</body>
</html>