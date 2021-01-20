<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notice</title>
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

        #divv {
            width: 100%;
            text-align: center;
        }

        table {
            border-collapse: collapse;
        }

        td {
            border: 1px solid #A4A4A4;
            padding: 7px;
        }


        input, textarea {
            width: 600px;
            border: none;
        }

        textarea {
            height: 440px;
        }

        button {
            width: 50px;
            background-color: #5858FA;
            color: white;
            border: 0;
            outline: 0;
        }

        .ck-editor__editable {
            min-height: 400px;
        }
    </style>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<body>
<jsp:include page="../menubar.jsp"/>


<br>
<div id="divv"><h3>공지사항</h3></div>
<br>

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
            <td width="550" align="center"><form:input path="title" readonly="true"/></td>
        </tr>

        <tr>
            <td width="50" align="center">작성자</td>
            <td width="550" align="center"><form:input path="writer" readonly="true"/></td>
        </tr>

        <tr>
            <td width="50" align="center">내용</td>
            <td width="550" align="center"><form:textarea path="content" id="editor" readonly="true"
                                                          class="ck-editor__editable"/></td>
        </tr>

        <tr>
            <td width="70" align="center">첨부파일</td>
            <td width="100" align="center">
                <div class="uploadedList"></div>
            </td>
        </tr>
    </table>
</form:form>
<br>
<div>


    <button type="submit" id="btnList">목록</button>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <button type="submit" id="btnEdit">편집</button>
        <button type="submit" id="btnRemove">삭제</button>
    </sec:authorize>


</div>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script>
    $(document).ready(function () {

        var formObj = $("#notice");

        // 현재 페이지 번호와 페이징 크기
        var pageObj = $("#page");
        var sizePerPageObj = $("#sizePerPage");


        var pageVal = pageObj.val();
        var sizePerPageVal = sizePerPageObj.val();


        $("#btnList").on("click", function () {
            self.location = "/notice/list";
        });

        $("#btnEdit").on("click", function () {

            var boardNo = $("#boardNo");
            var boardNoVal = boardNo.val();

            self.location = "/notice/modify?boardNo=" + boardNoVal;
        });


        $("#btnRemove").on("click", function () {
            formObj.attr("action", "/notice/remove");
            formObj.submit();
        });
    })
</script>

<script type="text/javascript">
    $(document).ready(function () {

        function getOriginalName(fileName) {
            var idx = fileName.indexOf("_") + 1;
            return fileName.substr(idx);
        }

        var boardNo = ${notice.boardNo};

        console.log("boardNo : " + boardNo);

        //첨부파일 목록 조회
        $.getJSON("/notice/getAttach/" + boardNo, function (list) {
            $(list).each(function () {

                console.log("data : " + this);

                var data = this;

                console.log("data : " + data);
                console.log("getOriginalName(data) : " + getOriginalName(data));

                var str = "<div><a href='/notice/downloadFile?fullName=" + data + "'>" + getOriginalName(data) + "</a></div>";

                $(".uploadedList").append(str);
            });
        });

    });
</script>

<script src="${pageContext.request.contextPath}/ckeditor4/build/ckeditor.js"></script>
<script>

    ClassicEditor
        .create(document.querySelector( '#editor'), {
            toolbar: [ ],
        } )
        .then(editor => {
            console.log(editor);
            editor.isReadOnly = true;
        })
        .catch(error => {
            console.error(error);
        });



</script>
</body>
</html>
