<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

<h3 style="margin-left: 7px;">회원정보 수정</h3>

<form:form modelAttribute="member" action="modify">

    <form:hidden path="user_no"/>
    <form:hidden path="picture_url"/>

    <table>
        <tr>
            <td>프로필사진</td>
            <td><img src="/user/picture?user_no=${member.user_no}" id="thumbnailImg" width="100"/></td>
            <td><form:input path="picture" type="file" id="upImgFile" onchange="uploadImgPreview();"/></td>
        </tr>
        <tr>
            <td width="70">아이디</td>
            <td width="350"><form:input path="user_id" readonly="true"/></td>
        </tr>
        <tr>
            <td width="70">비밀번호</td>
            <td width="350"><form:password path="user_password"/></td>
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

        <tr>
            <td width="70">권한</td>
            <td width="350">
                <form:select path="authList[0].auth">
                    <form:option value="" label="=== 선택해 주세요 ==="/>
                    <form:option value="ROLE_MEMBER" label="회원"/>
                    <form:option value="ROLE_ADMIN" label="관리자"/>
                </form:select>
            </td>
        </tr>

    </table>
</form:form>

<div style="margin-left: 7px;">
    <button type="submit" id="btnModify">정보수정</button>
    <button type="submit" id="btnList">목록</button>
</div>

</body>
<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        var formObj = $("#member");

        $("#btnModify").on("click", function () {
            alert("수정이 완료되었습니다.");
            formObj.submit();
        });

        $("#btnList").on("click", function () {
            self.location = "list";
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
