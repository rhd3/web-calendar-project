<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.util.*, java.time.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession userSession = request.getSession();
    int studentid = -1;
    if (userSession.getAttribute("studentid") != null) {
        studentid = (int)userSession.getAttribute("studentid");
    }
%>


<%!
		
    public class Event {
        private int id;
        private String title;
        private String description;
        private LocalDate startDate;
        private LocalDate endDate;
        private String category;

        public Event(int id, String title, String description, LocalDate startDate, LocalDate endDate, String category) {
            this.id = id;
            this.title = title;
            this.description = description;
            this.startDate = startDate;
            this.endDate = endDate;
            this.category = category;
        }

        public int getId() { return id; }
        public String getTitle() { return title; }
        public String getDescription() { return description; }
        public LocalDate getStartDate() { return startDate; }
        public LocalDate getEndDate() { return endDate; }
        public String getCategory() { return category; }
    }

    // Event 목록을 반환하는 메소드
    private List<Event> getEvents(int studentid) {
        List<Event> eventList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");

            String sql = "SELECT * FROM events WHERE category IN (SELECT groupid FROM grouplist WHERE studentid = ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, studentid);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                LocalDate startDate = rs.getDate("start_date").toLocalDate();
                LocalDate endDate = rs.getDate("end_date").toLocalDate();
                String category = rs.getString("category");

                Event event = new Event(id, title, description, startDate, endDate, category);
                eventList.add(event);
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return eventList;
    }
%>

<!DOCTYPE html>
<html lang='ko'>
<head>
	<link href="./resource/images/title-logo.png" rel="shortcut icon" type="image/x-icon">
    <meta charset='utf-8'/>
    <title>일정 보기</title>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/main.min.css' rel='stylesheet'/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        #calendar {
            max-width: 1100px;
            margin: 40px auto;
        }

        .fc-col-header-cell-cushion, .fc-daygrid-day-number {
            text-decoration: none;
        }

        .fc-scrollgrid-sync-inner > .fc-col-header-cell-cushion,
        .fc-day-mon .fc-daygrid-day-number,
        .fc-day-tue .fc-daygrid-day-number,
        .fc-day-wed .fc-daygrid-day-number,
        .fc-day-thu .fc-daygrid-day-number,
        .fc-day-fri .fc-daygrid-day-number {
            color: black;
        }

        .fc-day-sun .fc-col-header-cell-cushion,
        .fc-day-sun a {
            color: red;
        }

        .fc-day-sat .fc-col-header-cell-cushion,
        .fc-day-sat a {
            color: blue;
        }
        
        .container {
            display: inline-block;
            vertical-align: top;
            margin: 10px;
        }
    </style>
    <script>
        // DOM이 로드되면 FullCalendar 초기화
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                editable: false,
                selectable: true,
                selectOverlap: true,
                dayMaxEvents: 5,
               
                // 필터링을 구현할 때, getEvents() 함수에서 필터링되게
                events: [
                    <% List<Event> events = getEvents(studentid);
                       for (Event event : events) { %>
                    {
                        id: <%= event.getId() %>,
                        title: '<%= event.getTitle() %>',
                        start: '<%= event.getStartDate() %>',
                        end: '<%= event.getEndDate() %>',
                        description: '<%= event.getDescription() %>',
                        category : '<%= event.getCategory() %>',
                        <% if (event.getCategory().equals("personal")) { %>
                        backgroundColor: 'yellow',
                        textColor: 'black'
                        <% } else if (event.getCategory().equals("course")) { %>
                        backgroundColor: 'blue',
                        textColor: 'white'
                        <% } else if (event.getCategory().equals("club")) { %>
                        backgroundColor: 'green',
                        textColor: 'white'
                        <% } %>
                    },
                    <% } %>
                ],

                // 이벤트 클릭 시 이벤트 핸들러
                eventClick: function (info) {
                    $('#eventModal').modal('show');
                    $('#eventModal').find('input[name="start-date"]').val(info.event.startStr);
                    $('#eventModal').find('input[name="end-date"]').val(info.event.endStr || info.event.startStr);
                    $('#eventModal').find('input[name="title"]').val(info.event.title);
                    $('#eventModal').find('textarea[name="description"]').val(info.event.extendedProps.description);
                    $('#eventModal').find('input[name="category"]').val(info.event.extendedProps.category);
                    $('#saveEvent').off('click').on('click', function () {
                        var title = $('#eventModal').find('input[name="title"]').val();
                        var startDate = $('#eventModal').find('input[name="start-date"]').val();
                        var endDate = $('#eventModal').find('input[name="end-date"]').val();
                        var description = $('#eventModal').find('textarea[name="description"]').val();
                        var category = $('#eventModal').find('textarea[name="category"]').val();
                        if (title && startDate && endDate) {
                            info.event.setProp('title', title);
                            info.event.setDates(startDate, endDate);
                            info.event.setExtendedProp('description', description);
                            info.event.setExtendedProp('category', category);
                            $('#eventModal').modal('hide');
                        }
                    });
                    $('#deleteEvent').off('click').on('click', function () {
                        if (toastr.success('삭제되었습니다.')) {
                            info.event.remove();
                            $('#eventModal').modal('hide');
                        }
                    });
                }
            });
            calendar.render();
        });
    </script>
</head>

<body style="background-color : #E8E8E8;">

<jsp:include page="notice_list.jsp"/>


<div id='calendar'></div>
    





    <!-- 모달 창 -->
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalLabel">상세정보</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="event-title" class="col-form-label">제목:</label>
                            <input type="text" class="form-control" name="title" readonly>
                        </div>
                        <div class="form-group">
                            <label for="event-description" class="col-form-label">내용:</label>
                            <textarea class="form-control" name="description" readonly></textarea>
                        </div>
                        <div class="form-group">
                            <label for="event-start-date" class="col-form-label">시작 날짜:</label>
                            <input type="date" class="form-control" name="start-date" readonly>
                        </div>
                        <div class="form-group">
                            <label for="event-end-date" class="col-form-label">끝나는 날짜:</label>
                            <input type="date" class="form-control" name="end-date" readonly>
                        </div>
                        <div class="form-group">
                            <label for="event-category" class="col-form-label">카테고리:</label>
                            <input type="text" class="form-control" name="category" readonly>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>


<jsp:include page="footer.jsp" />
</body>
</html>
