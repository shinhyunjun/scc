<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


<form:form modelAttribute="member">

    <sec:authentication property="principal" var="pinfo"/>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
        <c:choose>
            <c:when test="${pinfo.username eq member.user_id}">
                <table>
                    <h3 style="margin-left: 7px;">프로필</h3>
                    <tr>
                        <td>프로필사진</td>
                        <td><img src="/user/picture?user_no=${member.user_no}" width="100"/></td>
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
                        <td width="350"><form:input path="user_phone" readonly="true"/></td>
                    </tr>
                    <tr>
                        <td width="70">이메일</td>
                        <td width="350"><form:input path="user_email" readonly="true"/></td>
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
                            <form:select path="authList[0].auth" disabled="true">
                                <form:option value="" label="=== 선택해 주세요 ==="/>
                                <form:option value="ROLE_MEMBER" label="회원"/>
                                <form:option value="ROLE_ADMIN" label="관리자"/>
                            </form:select>
                        </td>
                    </tr>

                </table>
            </c:when>
            <c:otherwise>
                <h3>접근권한이 없습니다!</h3>
            </c:otherwise>
        </c:choose>

    </sec:authorize>

    <form:hidden path="user_no"/>
    <form:hidden path="picture_url"/>



</form:form>

<sec:authentication property="principal" var="pinfo"/>
<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
    <c:if test="${pinfo.username eq member.user_id}">
        <div style="margin-left: 7px;">
            <button type="submit" id="btnEdit">정보수정</button>
            <button type="submit" id="btnPwd">비밀번호 변경</button>
            <button type="submit" id="btnRemove">회원탈퇴</button>
            <sec:authorize access="hasRole('ROLE_ADMIN')"> <!--인증된 경우-->
                <button type="submit" id="btnList">목록</button>
            </sec:authorize>
        </div>
    </c:if>
</sec:authorize>

</body>

<script type="text/javascript"

        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("#member");
        var userNo = $("#user_no");
        var userNoVal = userNo.val();

        $("#btnEdit").on("click", function () {

            self.location = "/user/modify?user_no=" + userNoVal;
        });

        $("#btnRemove").on("click", function () {
            self.location = "/user/remove?user_no=" + userNoVal;
        });

        $("#btnList").on("click", function () {
            self.location = "list";
        });

        $("#btnPwd").on("click", function () {
            self.location = "modifyPwd?user_no=" + userNoVal;
        });


    })
</script>
</html>

