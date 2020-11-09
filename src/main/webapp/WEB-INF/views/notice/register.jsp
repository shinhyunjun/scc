<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<html>
<head>
    <title>Board</title>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        h1 {
            width: 90px;
            height: 63px;
            text-align: center;
            position:absolute;
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
            color:black;
        }



        input, textarea{
            width:500px;
        }
        textarea{
            height:440px;
        }

        div{
            width:600px;
            text-align: center;

        }

        #btnRegister{
            background-color:#5882FA;
            color:white;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
        }

        #btnList{
            background-color:#5882FA;
            color:white;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
        }

        .uploadedList{
            float:right;
        }
    </style>
</head>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<script>
    $(document).ready(function() {


        var formObj = $("#notice");

        $("#btnRegister").on("click", function() {

            var title = $('#title').val();
            var content = $('#content').val();

            if (title == '') {
                alert('제목을 입력하세요.');
                return false;
            }

            else if (content == '') {
                alert('내용을 입력하세요.');
                return false;
            }

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
        $("#btnList").on("click", function() {
            self.location = "/notice/list";
        });

        $(".uploadedList").on("click", "span", function(event){
            $(this).parent("div").remove();
        });


        function getOriginalName(fileName){
            var idx = fileName.indexOf("_") + 1 ;

            return fileName.substr(idx);
        }

        $("#notice").submit(function(event){
            event.preventDefault();

            var that = $(this);

            var str ="";
            $(".uploadedList a").each(function(index){
                var value = $(this).attr("href");

                console.log("value = " + value);

                value = value.substr(27);

                str += "<input type='hidden' name='files["+index+"]' value='"+ value +"'> ";
            });

            console.log("str = " + str);

            that.append(str);

            that.get(0).submit();
        });

        $("#inputFile").on("change", function(event){

            var files = event.target.files;
            var file = files[0];

            console.log(file);

            var formData = new FormData();
            formData.append("file", file);

            console.log(formData)

            $.ajax({
                url: "/notice/uploadAjax?${_csrf.parameterName}=${_csrf.token}",
                data: formData,
                dataType:"text",
                processData: false,
                contentType: false,
                type: "POST",
                success: function(data){

                    console.log(data);

                    var str = "<div><a href='/notice/downloadFile?fullNa"+data+"'>"
                        + getOriginalName(data)+"</a>" +" <span>X</span></div>";

                    $(".uploadedList").append(str);
                }
            });
        });
    });
</script>

<body>


<h1>  <a href="/">   SCC  </a> </h1>
<nav id="nav_menu">
    <ul>
        <li><h4><a href="/sccSearch">요양시설 찾기</a></h4></li>
        <li><h4><a href="/qa">자주하는 질문</a></h4></li>
        <li><h4><a href="/notice/list">공지사항</a></h4></li>

        <sec:authorize access="!isAuthenticated()">   <!--로그인 하지 않은 경우-->
            <li><h4><a href="/login">회원가입/로그인</a></h4></li>
        </sec:authorize>


        <sec:authorize access="isAuthenticated()">  <!--인증된 경우-->
            <li> <h5> <sec:authentication property="principal.username"/> 님 <a href="/logout">로그아웃</a></h5></li>
        </sec:authorize>
    </ul>
</nav>
<br><br><br>
<hr width="100%">


<br><br>

<h2>공지사항 등록</h2><br>
<form:form modelAttribute="notice" action="register" >
    <table>
        <tr>
            <td width="50" align="center">제목</td>
            <td width="550" align="center"><form:input path="title" id="title"/></td>
            <td><font color="red"><form:errors path="title" /></font></td>
        </tr>
        <tr>
            <td width="50" align="center">작성자</td>
            <td width="550" align="center"><form:input path="writer" /></td>
            <td><font color="red"><form:errors path="writer" /></font></td>
        </tr>
        <tr>
            <td width="50" align="center">내용</td>
            <td width="550" align="center"><form:textarea path="content"  id="content"/></td>
            <td><font color="red"><form:errors path="content" /></font></td>
        </tr>

        <tr>
            <div id="dd">
            <td width="70" align="center">첨부파일</td>
            <td width="100" align="center"><input type="file" id="inputFile" /></td>

            <div class="uploadedList"></div>
            </div>
        </tr>
    </table>
</form:form>

<div>
    <button  type="submit" id="btnRegister">등록</button>
    <button  type="submit" id="btnList">목록</button>
</div>


</body>
</html>
