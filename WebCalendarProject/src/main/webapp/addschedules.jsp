<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<<<<<<<<<<<<<<  ✨ Codeium Command ⭐ >>>>>>>>>>>>>>>>
    <script>
    document.addEventListener('DOMContentLoaded', function() {

        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: [ 'dayGrid', 'interaction' ],
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            defaultDate: '2023-01-01',
            editable: true,
            dateClick: function(info) {
                alert('date clicked' + info.dateStr);
            },
            eventClick: function(info) {
                alert('event clicked ' + info.event.title);
            }
        });

        calendar.render();
    });
    </script>

    <div id='calendar'></div>
<<<<<<<  b40be5ce-025c-4c4e-a7de-3fe53436b9c5  >>>>>>>
</body>
</html>