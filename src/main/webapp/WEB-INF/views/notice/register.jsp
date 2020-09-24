<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<html>
<head>
    <title>Board</title>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<script>
    $(document).ready(function() {

        var formObj = $("#notice");

        $("#btnRegister").on("click", function() {
            formObj.attr("action", "/notice/register");
            formObj.attr("method", "post");
            formObj.submit();
        });

        $("#btnList").on("click", function() {
            self.location = "/notice/list";
        });

    });
</script>

<body>

<h2>REGISTER</h2>

<form:form modelAttribute="notice" action="register">
    <table>
        <tr>
            <td>Title</td>
            <td><form:input path="title" /></td>
            <td><font color="red"><form:errors path="title" /></font></td>
        </tr>
        <tr>
            <td>Writer</td>
            <td><form:input path="writer" /></td>
            <td><font color="red"><form:errors path="writer" /></font></td>
        </tr>
        <tr>
            <td>Content</td>
            <td><form:textarea path="content" /></td>
            <td><font color="red"><form:errors path="content" /></font></td>
        </tr>
    </table>
</form:form>

<div>
    <button type="submit" id="btnRegister">Register</button>
    <button type="submit" id="btnList">List</button>
</div>

</body>
</html>
