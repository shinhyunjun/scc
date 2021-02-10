
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .text-box{
            border: 1px solid black;
        }

        #btnNext{
            background-color: cadetblue;
            color: white;
            font-size: 20px;
        }

        .area{
            text-align: center;
        }
    </style>
</head>
<body>
    <h3 align="center">노인장기요양등급판정 예상점수란?</h3>

    <div class="text-box">
        <p>장기요양등급 판정은 어르신의 질병 유무 보다는 현재 상태에서 일상적인 생활의 유지가 얼마나 가능하신지, 타인의 도움이 필요한 수준이 어느 정도인지를 종합적으로 판단하게 됩니다.

        실제 등급판정전에 예상되는 노인장기요양등급을 알아보시고, 어떤 문항이 등급 점수에 가장 영향을 주는지 확인해 보시기 바랍니다. 등급 신청전에 요양원과 요양병원 중 고민 하고 계시다면, 요양등급 1,2 등급이 가능한지 우선 알아보시는데도 도움이 될 수 있습니다.

        본 테스트는 실제 건강보험공단의 평가사가 어르신을 방문하여 작성하는 장기요양인정조사표의 설문을 기반으로 하였으며, 등급판정 기준에 대한 고시를 바탕으로 평가방법이 만들어져서, 최대한 실제 조사결과와 유사하도록 제작되었습니다.

        평가를 받으실 때 중요한 항목과 조사에 필요한 정보를 미리 알아 보셔서 원하시는 등급 받으시길 바랍니다.
        </p>
    </div>

    <div class="precaution">
        <p style="color: lightpink">****주의사항****</p>
        <p>SCC에서 제공하는 노인장기요양등급판정 예상점수는 정부에서 고시한 장기요양등급판정기준에 관한 고시자료를 근거로 만들어 졌으며, 해당 알고리즘을 그대로 구현하기 위해서 최대한의 노력을 하였습니다.

            다만 실제 평가사가 판단하는 어르신의 증세가 본인이 느끼거나 보호자가 알고 있는 것과 다를 수 있기 때문에 실제 등급과는 일치하지 않을 수 있습니다.</p>
        <br>
        <p>이는 참고용으로 어떠한 법적 구속력도 없으며, SCC는 이 결과에 대해서 책임이 없으며 고객이 요양방법을 정할 수 있도록 도움을 주는 참고용으로 제작되었습니다.</p>
    </div>

    <div class="area">
        <button id="btnNext">예상점수 알아보기</button>
    </div>


    <script type="text/javascript"

            src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(function(){
            $("#btnNext").on("click", function(){
                self.location="/test/register3"
            })
        })
    </script>
</body>
</html>
