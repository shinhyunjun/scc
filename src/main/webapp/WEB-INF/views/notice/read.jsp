<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notice</title>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<script>
    $(document).ready(function(){

        var formObj = $("#notice");

        console.log(formObj);

        $("#btnList").on("click", function() {
            self.location = "/notice/list";
        });
    })
</script>

<body>

    <h2>READ</h2>

    <form:form modelAttribute="notice">
        <form:hidden path="boardNo"/>

        <table>
            <tr>
                <td>Title</td>
                <td><form:input path="title" readonly="true"/> </td>
            </tr>

            <tr>
                <td>Writer</td>
                <td><form:input path="writer" readonly="true"/> </td>
            </tr>

            <tr>
                <td>Content</td>
                <td><form:input path="content" readonly="true"/> </td>
            </tr>
        </table>
    </form:form>

    <div>
        <button type="submit" id="btnList">List</button>
    </div>
</body>
</html>
