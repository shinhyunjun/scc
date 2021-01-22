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

<form:form modelAttribute="member" action="modify" enctype="multipart/form-data">



    <form:hidden path="user_no" id="user_no"/>
    <form:hidden path="picture_url"/>

    <sec:authentication property="principal" var="pinfo"/>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
        <c:choose>
            <c:when test="${pinfo.username eq member.user_id}">
                <table>
                    <tr>
                        <td width="100">프로필사진</td>
                        <td><img src="/user/picture?user_no=${member.user_no}" id="thumbnailImg" width="200"/></td>
                        <td><form:input path="picture" type="file" id="upImgFile" onchange="uploadImgPreview();"/></td>
                    </tr><tr></tr>
                    <tr>
                        <td width="100">아이디</td>
                        <td width="350"><form:input path="user_id" readonly="true"/></td>
                    </tr><tr></tr>
                    <tr>
                        <td width="100">이름</td>
                        <td width="350"><form:input path="user_name" readonly="true"/></td>
                    </tr><tr></tr>
                    <tr>
                        <td width="100">전화번호</td>
                        <td width="350"><form:input path="user_phone"/></td>
                    </tr><tr></tr>
                    <tr>
                        <td width="100">이메일</td>
                        <td width="350"><form:input path="user_email"/></td>
                    </tr><tr></tr>
                    <tr>
                        <td width="100">성별</td>
                        <td width="350"><form:input path="user_sex" readonly="true"/></td>
                    </tr><tr></tr>
                    <tr>
                        <td width="100">생일</td>
                        <td width="350"><form:input path="user_birth" readonly="true"/></td>
                    </tr><tr></tr>

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
            var user_phone = $('#user_phone').val();
            var user_email = $('#user_email').val();
            var text = "@";

            if (user_phone == '') {
                alert('전화번호를 입력하세요.');
                return false;
            } else if (user_email.indexOf(text) == -1) {
                alert("이메일을 다시 입력해주세요.");
                return false;
            } else {
                formObj.submit();
                alert("회원 정보가 변경되었습니다");
            }

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
