<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form modelAttribute="member" action="modify" enctype="multipart/form-data">
        <form:hidden path="user_no" id="user_no"/>
        <form:hidden path="picture_url" />

        <table>
            <tr>
                <td>프로필</td>
                <td><input type="file" name="picture"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><form:input path="user_phone"/></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><form:input path="user_email"/></td>
            </tr>
        </table>
    </form:form>

    <div style="margin-left: 7px;">
        <button type="submit" id="btnModify">수정</button>
        <button type="submit" id="btnList">목록</button>
    </div>

    <script type="text/javascript"

            src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            var formObj = $("#member");

            var userNoVal = $('#user_no').val();

            $("#btnModify").on("click", function () {
                formObj.submit();
            });

        });
    </script>

</body>
</html>
