<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <style>
        table {
            margin-left: 7px;
            background-color: #E6E6E6;
            padding: 15px;
        }

        input {
            width: 260px;
            height: 30px;
        }
    </style>
</head>

<body>

<jsp:include page="../menubar.jsp"/>
<br>

<form:form modelAttribute="member" action="modify" enctype="multipart/form-data">
    <sec:authentication property="principal" var="pinfo"/>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
        <c:choose>
            <c:when test="${pinfo.username eq member.user_id}">

            <h3 style="margin-left: 7px;">회원정보 수정</h3>
    <form:hidden path="user_no" id="user_no"/>
    <form:hidden path="picture_url"/>


    <table>
        <tr>
            <td width="80">프로필사진</td>
            <td><img src="/user/picture?user_no=${member.user_no}" id="thumbnailImg" width="100"/></td>
            <td><form:input path="picture" type="file" id="upImgFile" onchange="uploadImgPreview();"/></td>
            <!--
            <td><input type="file" name="picture" onchange="uploadImgPreview();"></td>
            -->
        </tr>
        <tr>
            <td width="70">아이디</td>
            <td width="350"><form:input path="user_id" readonly="true"/></td>
        </tr>
        <tr>
            <td width="70">이름</td>
            <td width="350"><form:input path="user_name" readonly="true"/></td>
        </tr>
        <tr>
            <td width="70">전화번호</td>
            <td width="350"><form:input path="user_phone"/></td>
        </tr>
        <tr>
            <td width="70">이메일</td>
            <td width="350"><form:input path="user_email"/></td>
        </tr>
        <tr>
            <td width="70">성별</td>
            <td width="350"><form:input path="user_sex" readonly="true"/></td>
        </tr>
        <tr>
            <td width="70">생일</td>
            <td width="350"><form:input path="user_birth" readonly="true"/></td>
        </tr>
    </table>
            </c:when>
            <c:otherwise>
                <h3>접근권한이 없습니다!</h3>
            </c:otherwise>
        </c:choose>

    </sec:authorize>

</form:form>

<sec:authentication property="principal" var="pinfo"/>
<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
    <c:if test="${pinfo.username eq member.user_id}">
        <div style="margin-left: 7px;">
            <button type="submit" id="btnModify">수정</button>
            <button type="submit" id="btnList">목록</button>
        </div>
    </c:if>
</sec:authorize>


<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        var formObj = $("#member");

        var userNoVal = $('#user_no').val();

        $("#btnModify").on("click", function () {
            formObj.submit();
            alert("회원 정보가 변경되었습니다");
        });

        $("#btnList").on("click", function () {
            self.location = "/user/read?user_no=" + userNoVal;
        });

    });
</script>

<script type="text/javascript">

    function uploadImgPreview() {

        let fileInfo = document.getElementById("upImgFile").files[0];
        let reader = new FileReader();

        reader.onload = function () {

            document.getElementById("thumbnailImg").src = reader.result;

        };


        if (fileInfo) {

            reader.readAsDataURL(fileInfo);
        }

        var img = document.getElementById('thumbnailImg')
        var width = img.width;

    }

</script>

</body>
</html>
