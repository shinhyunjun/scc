<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notice</title>
    <style>

        input, textarea{
            width:500px;
        }

        textarea{
            height:440px;
        }

    </style>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<body>

    <h2>공지사항</h2>

    <form:form modelAttribute="notice" action="modify" enctype="multipart/form-data">
        <form:hidden path="boardNo"/>

        <!-- 현재 페이지 번호, 페이징 크기, 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달-->
        <input type="hidden" name="page" value="${pgrq.page}">
        <input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
        <input type="hidden" name="searchType" value="${pgrq.searchType}">
        <input type="hidden" name="keyword" value="${pgrq.keyword}">

        <table>
            <tr>
                <td width="50" align="center">제목</td>
                <td width="550" align="center"><form:input path="title" readonly="true"/> </td>
            </tr>

            <tr>
                <td width="50" align="center">작성자</td>
                <td width="550" align="center"><form:input path="writer" readonly="true"/> </td>
            </tr>

            <tr>
                <td width="50" align="center">내용</td>
                <td width="550" align="center"><form:textarea path="content" readonly="true"/> </td>
            </tr>

            <tr>
                <td width="70" align="center">첨부파일</td>
                <td width="100" align="center">
                    <div class="uploadedList"></div>
                </td>
            </tr>
        </table>
    </form:form>

    <div>


        <button type="submit" id="btnList">목록</button>

        <sec:authorize access="hasRole('ROLE_ADMIN')">
             <button type="submit" id="btnEdit">편집</button>
             <button type="submit" id="btnRemove">삭제</button>
        </sec:authorize>


    </div>

    <script src="http://code.jquery.com/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function(){

            var formObj = $("#notice");

            // 현재 페이지 번호와 페이징 크기
            var pageObj = $("#page");
            var sizePerPageObj = $("#sizePerPage");


            var pageVal = pageObj.val();
            var sizePerPageVal = sizePerPageObj.val();


            $("#btnList").on("click", function() {
                self.location = "/notice/list";
            });

            $("#btnEdit").on("click", function() {

                var boardNo = $("#boardNo");
                var boardNoVal = boardNo.val();

                self.location = "/notice/modify?boardNo="+boardNoVal;
            });


            $("#btnRemove").on("click", function() {
                formObj.attr("action", "/notice/remove");
                formObj.submit();
            });
        })
    </script>

    <script type="text/javascript">
        $(document).ready(function() {

            function getOriginalName(fileName){
                var idx = fileName.indexOf("_") + 1;
                return fileName.substr(idx);
            }

            var boardNo = ${notice.boardNo};

            console.log("boardNo : " + boardNo);

            //첨부파일 목록 조회
            $.getJSON("/notice/getAttach/"+boardNo,function(list){
                $(list).each(function(){

                    console.log("data : " + this);

                    var data = this;

                    console.log("data : " + data);
                    console.log("getOriginalName(data) : " + getOriginalName(data));

                    var str = "<div><a href='/notice/downloadFile?fullName="+data+"'>" + getOriginalName(data) + "</a></div>";

                    $(".uploadedList").append(str);
                });
            });

        });
    </script>
</body>
</html>
