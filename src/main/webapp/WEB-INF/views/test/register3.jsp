
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .top-box{
            background-color: #58ACFA;
            color: white;
            text-align:center;
        }

        .title_a{
            text-align: center;
        }

        .box_a{
            text-align: center;
        }
    </style>
</head>
<body>

<div class="top-box">
    <h3>현재 <span class="point">0</span>점 <span class="grade"></span><span class="gradenm">등급외</span></h3>
</div>

<h3 class="title_a">신체 기능 파악</h3>

<div class="text_box_a">
    <p>장기요양등급 판정에서 가장 중요한 판단기준입니다.</p>
    <p>장기요양등급은 어르신의 질병 유무보다는 어르신의 일상적인 생활의 유지가 얼마나 가능한지.
    타인의 도움이 필요한 수준이 어느정도인지를 종합적으로 판단하게 됩니다.</p>
    <p>최근 한 달간의 상황을 종합하여 각 동작을 할 때 다른 사람의 도움이 필요한 정도를 평가하여 선택해 주세요</p>
</div>

<div class="box_a">
    <button id="btnNext_a">시작하기</button>
</div>

<div class="physical">
    <div class="question1">
        <p>옷 벗고 입기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question2">
        <p>세수하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question3">
        <p>양치질하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question4">
        <p>목욕하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question5">
        <p>식사하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question6">
        <p>체위 변경하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question7">
        <p>일어나 앉기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question8">
        <p>옮겨 앉기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question9">
        <p>방 밖으로 나오기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question10">
        <p>화장실 사용하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question10">
        <p>대변 조절하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>

    <div class="question10">
        <p>소변 조절하기</p>
        <ul class="q1">혼자서 가능</ul>
        <ul class="q2">일부 도움필요</ul>
        <ul class="q3">완전히 도움 필요</ul>
    </div>
</div>

<div class="recognize">
    <div class="question11">
        <p>해당하는 증상을 모두 선택해주세요</p>
        <ul class="reco1">방금 전에 들었던 이야기나 일을 잊는다</ul>
        <ul>오늘이 몇 월 며칠인지 모른다</ul>
        <ul>자신이 있는 장소를 알지 못한다</ul>
        <ul>자신의 나이와 생일을 모른다</ul>
        <ul>지시를 이해하지 못한다</ul>
        <ul>주어진 상황에 대한 판단력이 떨어져 있다</ul>
        <!-- ㅇㅇ-->
        <ul>의사소통이나 전달에 장애가 있다</ul>
        <ul>계산을 하지 못한다</ul>
        <ul>가족이나 친척을 알아보지 못한다</ul>
    </div>

</div>

<div class="behavior">
    <div class="question12">
        <p>해당하는 증상을 모두 선택해주세요</p>
        <ul>사람들이 무엇을 훔쳤다고 믿거나 자기를 해하려 한다고 잘못 믿고 있다</ul>
        <ul>헛것을 보거나 환청을 듣는다</ul>
        <ul>슬퍼 보이거나 기분이 처져 있으며 때때로 울기도 한다</ul>
        <ul>밤에 자다가 일어나 주위 사람을 깨우거나 아침에 너무 일찍 일어난다.
        또는 낮에는 지나치게 잠을 자고 밤에는 잠을 이루지 못한다</ul>
        <ul>주위사람이 도와주려 할 때 도와주는 것에 저항한다</ul>
        <ul>한군데 가만히 있지 못하고 서성거리거나 왔다 갔다 하며 안절부절 못한다</ul>
        <ul>길을 잃거나 헤맨 적이 있다. 외출하면 집이나 병원, 시설로 혼자 들어올 수 없다</ul>
        <ul>화를 내며 폭언이나 폭행을 하는 등 위협적인 행동을 보인다</ul>
        <ul>혼자서 밖으로 나가려고 해서 눈을 뗄 수가 없다</ul>
        <ul>물건을 망가뜨리거나 부순다</ul>
        <ul>의미가 없거나 부적절한 행동을 자주 보인다</ul>
        <ul>돈이나 물건을 장롱같이 찾기 어려운 곳에 감춘다</ul>
        <ul>옷을 부적절하게 입는다</ul>
        <ul>대소변을 벽이나 옷에 바르는 등의 행위를 한다</ul>
        <!-- ㅇㅇ-->
        <ul>가스불이나 담뱃불, 연탄불과 같은 화기를 관리할 수 없다</ul>
        <ul>혼자 있는 것을 두려워하여 누군가 옆에 있어야 한다</ul>
        <ul>이유 없이 크게 소리치고 고함을 친다</ul>
        <ul>공공장소에서 부적절한 성적 행동을 한다</ul>
        <ul>음식이 아닌 물건 등을 먹는다</ul>
        <ul>쓸데없이 간섭하거나 참견한다</ul>
        <ul>식습관 및 식욕변화를 보이거나 이유 없이 식사를 거부한다</ul>
        <ul>귀찮을 정도로 붙어서 따라 다닌다</ul>
    </div>
</div>

<div class="nursing">
    <div class="question12">
        <p>현재 어르신이 받고 계시거나 필요한 모든 전문적인 의료, 간호 처치를 선택해주세요</p>
        <ul>기관지 절개관: 기관지를 절개하여 인공기도를 확보하는 간호</ul>
        <ul>흡인: 카테터 등으로 인위적으로 분비물을 제거하여 기도유지</ul>
        <ul>산소요법: 저산소증이나 저산소혈증을 치료, 감소 시키기 위해 산소공급장치를 통해 추가적인 산소 공급</ul>
        <ul>욕창간호: 장기적인 고정체위로 인해 압박 부위의 피부와 하부조직 손상되어 지속적인 드레시와 체위변경 처치</ul>
        <ul>경관 영양: 구강으로 음식첩취가 어려워 관을 통해서 위, 십이지장 등에 직접 영양을 공급해야 하는 경우</ul>
        <ul>암성통증: 암의 진행을 억제하지 못하여 극심한 통증에 발생</ul>
        <ul>도뇨관리: 배뇨가 자율적으로 관리가 불가능하여 인위적으로 방광을 비우거나 관리</ul>
        <ul>장루: 인공항문을 통해 체외로 대변을 배설 시킴으로 부착장치의 지속적인 관리</ul>
        <ul>투석: 장기적인 신부전증으로 인해 혈액 투석이 필요한 경우</ul>
    </div>
</div>

<div class="physic">
    <div class="question1">
        <p>오른쪽 상지(손, 팔, 어깨)가 의지대로 움직이시나요?</p>
        <ul>운동장애 없음</ul>
        <ul>불완전 운동장애</ul>
        <ul>완전 운동장애</ul>
    </div>

    <div class="question1">
        <p>오른쪽 하지(발, 다리)가 의지대로 움직이시나요?</p>
        <ul>운동장애 없음</ul>
        <ul>불완전 운동장애</ul>
        <ul>완전 운동장애</ul>
    </div>

    <div class="question1">
        <p>왼쪽 상지(손, 팔, 어깨)가 의지대로 움직이시나요?</p>
        <ul>운동장애 없음</ul>
        <ul>불완전 운동장애</ul>
        <ul>완전 운동장애</ul>
    </div>

    <div class="question1">
        <p>왼쪽 하지(발, 다리)가 의지대로 움직이시나요?</p>
        <ul>운동장애 없음</ul>
        <ul>불완전 운동장애</ul>
        <ul>완전 운동장애</ul>
    </div>

    <div class="question2">
        <p>어깨관절이 자유롭게 움직이시나요?</p>
        <ul>제한 없음</ul>
        <ul>한쪽관절제한</ul>
        <ul>양쪽관절제한</ul>
    </div>

    <div class="question2">
        <p>팔꿈치관절이 자유롭게 움직이시나요?</p>
        <ul>제한 없음</ul>
        <ul>한쪽관절제한</ul>
        <ul>양쪽관절제한</ul>
    </div>

    <div class="question2">
        <p>손목 및 손관절이 자유롭게 움직이시나요?</p>
        <ul>제한 없음</ul>
        <ul>한쪽관절제한</ul>
        <ul>양쪽관절제한</ul>
    </div>

    <div class="question2">
        <p>고관절(엉덩이관절)이 자유롭게 움직이시나요?</p>
        <ul>제한 없음</ul>
        <ul>한쪽관절제한</ul>
        <ul>양쪽관절제한</ul>
    </div>

    <div class="question2">
        <p>무릎관절이 자유롭게 움직이시나요?</p>
        <ul>제한 없음</ul>
        <ul>한쪽관절제한</ul>
        <ul>양쪽관절제한</ul>
    </div>

    <div class="question2">
        <p>발목관절이 자유롭게 움직이시나요?</p>
        <ul>제한 없음</ul>
        <ul>한쪽관절제한</ul>
        <ul>양쪽관절제한</ul>
    </div>
</div>

<div class="dino">
    <div class="question11">
        <p>현재 앓고 있는 질병 또는 증상을 선택해주세요</p>
        <ul>치매</ul>
        <ul>중풍(뇌졸중)</ul>
        <ul>고혈압</ul>
        <ul>당뇨병</ul>
        <ul>관절염(퇴행성, 류마티스)</ul>
        <ul>요통, 좌골통(디스크탈출증, 척수관협착증)</ul>
        <ul>일상생활에 지장이 있을 정도의 호흡곤란(심부전, 만성폐질환, 천식)</ul>
        <ul>난청</ul>
        <ul>백내장, 녹내장 등 시각 장애</ul>
        <ul>골절, 탈골 등 사고로 인한 후유증</ul>
        <ul>암</ul>
        <ul>신부전</ul>
    </div>
</div>
<script>
    $(document).ready(function(){
        var class_a = document.getElementsByClassName("title_a");
        var class_b = document.getElementsByClassName("text_box_a");
        var class_c = document.getElementsByClassName("box_a");


        $("#btnNext_a"). on("click", function (){

        })
    })
</script>

</body>
</html>
