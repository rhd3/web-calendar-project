<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메뉴추천</title>
    <style>
        body {
            background-color: #ccc;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            font-size: 30pt;
            font-weight: bold;
            margin-bottom: 20px;
        }

        #roulette-container {
            background-color: white;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
        }

        #roulette {
            width: 400px;
            height: 400px;
            border: 10px solid #ccc;
            border-radius: 50%;
            position: relative;
            margin: 0 auto;
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(7200deg); }
        }

        .spinning {
            animation: spin 8s ease-out;
        }

        button {
            margin-top: 10px;
            font-size: 15pt;
        }

        #result {
            font-size: 15pt;
            font-weight: bold;
        }
    </style>
    <script>
        var items = ["마라탕", "치킨", "피자", "국밥", "육회비빔밥", "족발", "삼겹살", "김치찌개"];
        var colors = ["#FF5733", "#33FF57", "#3357FF", "#F333FF", "#FF33A6", "#FF5733", "#33FF57", "#F333FF"];

        function drawRouletteWheel() {
            var canvas = document.getElementById("canvas");
            var ctx = canvas.getContext("2d");
            var outsideRadius = 190;
            var textRadius = 150;
            var insideRadius = 90;

            ctx.clearRect(0, 0, 400, 400);

            ctx.strokeStyle = "black";
            ctx.lineWidth = 2;

            var arc = Math.PI / (items.length / 2);

            for (var i = 0; i < items.length; i++) {
                var angle = i * arc;
                ctx.fillStyle = colors[i];

                ctx.beginPath();
                ctx.arc(200, 200, outsideRadius, angle, angle + arc, false);
                ctx.arc(200, 200, insideRadius, angle + arc, angle, true);
                ctx.stroke();
                ctx.fill();

                ctx.save();
                ctx.fillStyle = "black";
                ctx.font = "bold 16pt Arial";
                ctx.translate(200 + Math.cos(angle + arc / 2) * textRadius,
                    200 + Math.sin(angle + arc / 2) * textRadius);
                ctx.rotate(angle + arc / 2 + Math.PI / 2);
                var text = items[i];
                ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
                ctx.restore();
            }
        }

        function drawCircleOnSelectedItem(index) {
            var canvas = document.getElementById("canvas");
            var ctx = canvas.getContext("2d");
            var outsideRadius = 190;
            var arc = Math.PI / (items.length / 2);
            var angle = index * arc;

            ctx.save();
            ctx.strokeStyle = "red";
            ctx.lineWidth = 5;
            ctx.beginPath();
            ctx.arc(200 + Math.cos(angle + arc / 2) * (outsideRadius - 30),
                    200 + Math.sin(angle + arc / 2) * (outsideRadius - 30),
                    20, 0, 2 * Math.PI);
            ctx.stroke();
            ctx.restore();
        }

        function spinRoulette() {
            var canvas = document.getElementById("canvas");
            var result = document.getElementById("result");
            var angle = Math.random() * 7200;
            canvas.style.transition = "transform 8s ease-out";
            canvas.style.transform = "rotate(" + angle + "deg)";

            setTimeout(function () {
                var actualAngle = angle % 360;
                var arc = 360 / items.length;
                var index = Math.floor((360 - actualAngle + arc / 2) % 360 / arc);
                var selectedItem = items[index];
                result.innerText = "오늘 메뉴: " + selectedItem;
                
              

                // 선택된 항목에 동그라미 표시
                drawCircleOnSelectedItem(index);
            }, 8000);
        }

        function goToCalendar() {
            window.location.href = 'calendar.jsp';
        }

        window.onload = drawRouletteWheel;
    </script>
</head>
<body>
    <h1>메뉴추천</h1>
    <div id="roulette-container">
        <div id="roulette">
            <canvas id="canvas" width="400" height="400"></canvas>
        </div>
        <div>
            <button onclick="spinRoulette()">돌리기</button>
            <button onclick="goToCalendar()">나가기</button>
        </div>
        <p id="result">오늘 메뉴: </p>
    </div>
</body>
</html>
