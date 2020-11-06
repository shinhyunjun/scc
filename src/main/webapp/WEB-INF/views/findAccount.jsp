<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>

      <style>

         #div1{
             width:80%;
             height:120px;
             background-color: mediumseagreen;
         }
         #div1 p{
             text-align: center;
             color:white;
             font-size: 23px;
         }

         #div2{
             width:80%;

             text-align: center;
         }

         #div2 h4{
             color:#F78181;
         }

        #div3 input{
            width:260px;
            height:45px;
        }
         #div4 input{
             width:260px;
             height:45px;
         }
         button{
             width:260px;
             height:35px;
         }
      </style>


  </head>
  <body>

    <div id="div1">
        <br>
        <p>비밀번호 찾기</p>
    </div>

    <div id="div2">
        <h4>입력된 정보로 임시 비밀번호가 전송됩니다.</h4>
        <hr>
    </div>

    <form action="searchPw.do" method="get">
    <div style="line-height:80%">
    <div id="div3">
        <h4>ID</h4>
        <input type="text" name="id" placeholder="가입시 등록한 아이디를 입력하세요">
    </div>

    <div id="div4">
      <h4>EMAIL</h4>
      <input type="text" name="email" placeholder="가입시 등록한 이메일을 입력하세요">
    </div>


     <br><button type="submit" id="btnRegister">OK</button>
    </div>
    </form>
  </body>
</html>
