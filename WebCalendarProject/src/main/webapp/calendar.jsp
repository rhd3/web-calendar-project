<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>������� ����</title>
    <link rel="stylesheet" href="calendar.css">
</head>
<body>
    <div id="calendar-container">
        <header>
            <button id="prev-month">&lt;</button>
            <h2 id="month-year"></h2>
            <button id="next-month">&gt;</button>
        </header>
        <div id="weekdays">
            <div>Sun</div>
            <div>Mon</div>
            <div>Tue</div>
            <div>Wed</div>
            <div>Thu</div>
            <div>Fri</div>
            <div>Sat</div>
        </div>
        <div id="calendar-days"></div>
    </div>
    <div id="event-modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="modal-date"></h2>
            <textarea id="event-text" placeholder="���� ������ �Է��ϼ���"></textarea>
            <button id="save-event">����</button>
            <button id="delete-event">����</button>
        </div>
    </div>
    
    <script src="calendar.js"></script>
</body>
</html>
//