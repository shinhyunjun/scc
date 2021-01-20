<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
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
    </style>
</head>
<body>

<jsp:include page="../menubar.jsp"/>

<br>
<div id="divv"><h3>공지사항</h3></div>
<br>

<form:form modelAttribute="notice" action="modify">
    <form:hidden path="boardNo"/>

    <!-- 현재 페이지 번호, 페이징 크기, 검색유형, 검색어를 숨겨진 필드 요소를 사용하여 전달-->
    <input type="hidden" name="page" value="${pgrq.page}">
    <input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">
    <input type="hidden" name="searchType" value="${pgrq.searchType}">
    <input type="hidden" name="keyword" value="${pgrq.keyword}">

    <table>
        <tr>
            <td width="50" align="center">제목</td>
            <td width="550" align="center"><form:input path="title"/></td>

        </tr>
        <tr>
            <td width="50" align="center">작성자</td>
            <td width="550" align="center"><form:input path="writer"/></td>

        </tr>
        <tr>
            <td width="50" align="center">내용</td>
            <td width="550" align="center"><form:textarea path="content" id="editor"/></td>

        </tr>
        <tr>
            <td width="70" align="center">첨부파일</td>
            <td width="50" align="center">
                <input type="file" id="inputFile"/>
                <div class="uploadedList"></div>
            </td>


        </tr>
    </table>
</form:form>

<div>
    <sec:authentication property="principal" var="pinfo"/>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <button type="submit" id="btnModify">수정</button>
        <button type="submit" id="btnList">목록</button>
    </sec:authorize>
</div>

<script type="text/javascript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        var formObj = $("#notice");

        $("#btnModify").on("click", function () {
            formObj.submit();
        });

        $("#btnList").on("click", function () {
            self.location = "/notice/list";
        });


        $(".uploadedList").on("click", "span", function (event) {
            $(this).parent("div").remove();
        });

        function getOriginalName(fileName) {
            var idx = fileName.indexOf("_") + 1;
            return fileName.substr(idx);
        }

        var boardNo = ${notice.boardNo};

        //첨부파일 목록 조회
        $.getJSON("/notice/getAttach/" + boardNo, function (list) {
            $(list).each(function () {

                console.log("data : " + this);

                var data = this;

                console.log("data : " + data);
                console.log("getOriginalName(data) : " + getOriginalName(data));

                var str = "<div><a href='/notice/downloadFile?fullName=" + data + "'>" + getOriginalName(data) + "</a>"
                    + "<span>X</span></div>";

                $(".uploadedList").append(str);
            });
        });

        $("#notice").submit(function (event) {

            event.preventDefault();

            var that = $(this);

            var str = "";

            $(".uploadedList a").each(function (index) {

                var value = $(this).attr("href");
                value = value.substr(27);

                str += "<input type='hidden' name='files[" + index + "]' value='" + value + "'> ";
            });

            that.append(str);

            that.get(0).submit();
        });

        $("#inputFile").on("change", function (event) {

            var files = event.target.files;
            var file = files[0];

            console.log(file);

            var formData = new FormData();

            formData.append("file", file);

            $.ajax({
                url: "/notice/uploadAjax?${_csrf.parameterName}=${_csrf.token}",
                data: formData,
                dataType: "text",
                processData: false,
                contentType: false,
                type: "POST",
                success: function (data) {
                    var str = "<div><a href='/notice/downloadFile?fullName=" + data + "'>"
                        + getOriginalName(data) + "</a>" + "<span> &nbsp; X </span></div></div>";

                    $(".uploadedList").append(str);
                }
            });
        });
    });
</script>

<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor4/build/ckeditor.js"></script>
<script>

    ClassicEditor
        .create(document.querySelector('#editor'), {
            toolbar: {
                items: ['Heading', '|',
                    'fontsize', 'fontcolor', 'fontfamily', 'fontbackgroundcolor', 'bold', 'italic', '|',
                    'blockquote', 'bulletedList', 'numberedlist', 'indent', 'outdent', 'alignment', '|',
                    'CKFinder', 'link', 'table', 'mediaembed', '|',
                    'undo', 'redo'],
                shouldNotGroupWhenFull: true,
                viewportTopOffset: 30

            },
            ckfinder: {
                uploadUrl: '/ck/fileupload'
            }
        })
        .then(editor => {
            console.log(editor);
        })
        .catch(error => {
            console.error(error);
        });

</script>
</body>
</html>