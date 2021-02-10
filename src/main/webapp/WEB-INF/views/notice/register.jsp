<%@ page import="static org.assertj.core.api.InstanceOfAssertFactories.PATH" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
    <title>Board</title>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .ck-editor__editable {
            min-height: 400px;
            max-width: 580px;
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

        div {
            width: 600px;
            text-align: center;

        }

        button {
            width: 50px;
            background-color: #5858FA;
            color: white;
            border: 0;
            outline: 0;
        }

        .uploadedList {
            float: right;
        }

        .ck-editor__editable {
            min-height: 400px;
        }
    </style>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>


<script>
    $(document).ready(function () {


        var formObj = $("#notice");

        $("#btnRegister").on("click", function () {

            var title = $('#title').val();
            var content = $('#content').val();

            if (title == '') {
                alert('제목을 입력하세요.');
                return false;
            }

                /*
                else if (content == '') {
                    alert('내용을 입력하세요.');
                    return false;
                }*/

            /* else{
                 formObj.attr("action", "/notice/register");
                 formObj.attr("method", "post");
                 formObj.submit();
             }
 */
            else {
                formObj.submit();
            }
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

        $("#notice").submit(function (event) {
            event.preventDefault();

            var that = $(this);

            var str = "";
            $(".uploadedList a").each(function (index) {
                var value = $(this).attr("href");

                console.log("value = " + value);

                value = value.substr(27);

                str += "<input type='hidden' name='files[" + index + "]' value='" + value + "'> ";
            });

            console.log("str = " + str);

            that.append(str);

            that.get(0).submit();
        });

        $("#inputFile").on("change", function (event) {

            var files = event.target.files;
            var file = files[0];

            console.log(file);

            var formData = new FormData();
            formData.append("file", file);

            console.log(formData)

            $.ajax({
                url: "/notice/uploadAjax?${_csrf.parameterName}=${_csrf.token}",
                data: formData,
                dataType: "text",
                processData: false,
                contentType: false,
                type: "POST",
                success: function (data) {

                    console.log(data);

                    var str = "<div><a href='/notice/downloadFile?fullNa" + data + "'>"
                        + getOriginalName(data) + "</a>" + " <span>X</span></div>";

                    $(".uploadedList").append(str);
                }
            });
        });
    });
</script>

<body>

<jsp:include page="../menubar.jsp"/>


<br><br>

<div id="divv"><h3>공지사항 등록</h3></div>
<br>
<form:form modelAttribute="notice" action="register">
    <table>
        <tr>
            <td width="50" align="center">제목</td>
            <td width="550" align="center"><form:input path="title" id="title"/></td>

        </tr>
        <tr>
            <td width="50" align="center">작성자</td>
            <td width="550" align="center"><form:input path="writer"/></td>

        </tr>
        <tr>
            <td width="50" align="center">내용</td>

            <td width="550" align="center"><form:textarea path="content" name="content" id="editor"
                                                          class="ck-editor__editable"/></td>

        <tr>

            <td width="70" align="center">첨부파일</td>
            <td width="100" align="center">
                <input type="file" id="inputFile"/>
                <div class="uploadedList"></div>
            </td>


        </tr>
    </table>
</form:form>

<div>
    <button type="submit" id="btnRegister">등록</button>
    <button type="submit" id="btnList">목록</button>
</div>


</body>

<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor4/build/ckeditor.js"></script>
<script>
    //ckeditor4
    //CKEDITOR.replace('editor',{filebrowserUploadUrl:'/imageUpload'});

    ClassicEditor
        .create(document.querySelector('#editor'), {
            toolbar: {
                items: ['Heading', '|',
                    'fontsize', 'fontcolor', 'fontfamily', 'fontbackgroundcolor', 'bold', 'italic', '|',
                    'blockquote', 'bulletedList', 'numberedlist', 'indent', 'outdent', 'alignment', '|',
                    'CKFinder','link', 'table', 'mediaembed', '|',
                    'undo', 'redo', 'Font'],
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


</html>
