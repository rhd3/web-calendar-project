<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*, java.util.*, java.time.*" %>

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

        public int getId() {
            return id;
        }

        public String getTitle() {
            return title;
        }

        public String getDescription() {
            return description;
        }

        public LocalDate getStartDate() {
            return startDate;
        }

        public LocalDate getEndDate() {
            return endDate;
        }

        public String getCategory() {
            return category;
        }
    }

    // Event VO를 반환해서 Calendar에서 활용
    // 필터링 구현하실 때 이 메소드를 수정해서 필터링된 이벤트목록을 반환
    private List<Event> getEvents() {
        List<Event> eventList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CalendarDB", "root", "1111");
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM events";
            ResultSet rs = stmt.executeQuery(sql);

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
            stmt.close();
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
    </style>
    <script>
        // DOM이 로드되면 FullCalendar 초기화
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                editable: true,
                selectable: true,
                selectOverlap: true,
                dayMaxEvents: 5,

                events: [
                    <% List<Event> events = getEvents();
                       for (Event event : events) { %>
                    {
                        id: <%= event.getId() %>,
                        title: '<%= event.getTitle() %>',
                        start: '<%= event.getStartDate() %>',
                        end: '<%= event.getEndDate() %>',
                        description: '<%= event.getDescription() %>',
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

                dateClick: function (info) {
                    $('#eventModal').modal('show');
                    $('#eventModal').find('input[name="start-date"]').val(info.dateStr);
                    $('#eventModal').find('input[name="end-date"]').val(info.dateStr);
                    $('#eventModal').find('input[name="title"]').val('');
                    $('#eventModal').find('textarea[name="description"]').val('');
                    $('#saveEvent').off('click').on('click', function () {
                        var title = $('#eventModal').find('input[name="title"]').val();
                        var startDate = $('#eventModal').find('input[name="start-date"]').val();
                        var endDate = $('#eventModal').find('input[name="end-date"]').val();
                        var description = $('#eventModal').find('textarea[name="description"]').val();
                        if (title && startDate && endDate) {
                            $.ajax({
                                url: 'addEvent.jsp',
                                method: 'POST',
                                data: {
                                    title: title,
                                    start_date: startDate,
                                    end_date: endDate,
                                    description: description
                                },
                                success: function (response) {
                                    calendar.addEvent({
                                        title: title,
                                        start: startDate,
                                        end: endDate,
                                        description: description
                                    });
                                    $('#eventModal').modal('hide');
                                }
                            });
                        }
                    });
                },

                select: function (info) {
                    $('#eventModal').modal('show');
                    $('#eventModal').find('input[name="start-date"]').val(info.startStr);
                    $('#eventModal').find('input[name="end-date"]').val(info.endStr);
                    $('#eventModal').find('input[name="title"]').val('');
                    $('#eventModal').find('textarea[name="description"]').val('');
                    $('#saveEvent').off('click').on('click', function () {
                        var title = $('#eventModal').find('input[name="title"]').val();
                        var startDate = $('#eventModal').find('input[name="start-date"]').val();
                        var endDate = $('#eventModal').find('input[name="end-date"]').val();
                        var description = $('#eventModal').find('textarea[name="description"]').val();

                        //회원에 따라 카테고리를 구분할 수 있도록 수정 
                        const category = "personal";
                        //회원에 따라 studentid를 구분할 수 있도록 수정 
                        const studentid = 123;
                        //회원에 따라 groupid를 구분할 수 있도록 수정 
                        const groupid = 1;

                        if (title && startDate && endDate) {
                            $.ajax({
                                url: 'addEvent.jsp',
                                method: 'POST',
                                data: {
                                    title: title,
                                    start_date: startDate,
                                    end_date: endDate,
                                    description: description,
                                    category: category,
                                    studentid: studentid,
                                    groupid: groupid
                                },
                                success: function (response) {
                                    calendar.addEvent({
                                        title: title,
                                        start: startDate,
                                        end: endDate,
                                        description: description,
                                        category: category,
                                        studentid: studentid,
                                        groupid: groupid
                                    });
                                    $('#eventModal').modal('hide');
                                }
                            });
                        }
                    });
                },

                eventClick: function (info) {
                    $('#eventModal').modal('show');
                    $('#eventModal').find('input[name="start-date"]').val(info.event.startStr);
                    $('#eventModal').find('input[name="end-date"]').val(info.event.endStr || info.event.startStr);
                    $('#eventModal').find('input[name="title"]').val(info.event.title);
                    $('#eventModal').find('textarea[name="description"]').val(info.event.extendedProps.description);
                    $('#eventModal').find('input, textarea').attr('readonly', false);
                    $('#saveEvent').off('click').on('click', function () {
                        var title = $('#eventModal').find('input[name="title"]').val();
                        var startDate = $('#eventModal').find('input[name="start-date"]').val();
                        var endDate = $('#eventModal').find('input[name="end-date"]').val();
                        var description = $('#eventModal').find('textarea[name="description"]').val();
                        if (title && startDate && endDate) {
                            $.ajax({
                                url: 'updateEvent.jsp',
                                method: 'POST',
                                data: {
                                    id: info.event.id,
                                    title: title,
                                    start_date: startDate,
                                    end_date: endDate,
                                    description: description
                                },
                                success: function (response) {
                                    info.event.setProp('title', title);
                                    info.event.setDates(startDate, endDate);
                                    info.event.setExtendedProp('description', description);
                                    $('#eventModal').modal('hide');
                                }
                            });
                        }
                    });
                    $('#deleteEvent').off('click').on('click', function () {
                        if (confirm('삭제하시겠습니까?')) {
                            $.ajax({
                                url: 'deleteEvent.jsp',
                                method: 'POST',
                                data: {
                                    id: info.event.id
                                },
                                success: function (response) {
                                    info.event.remove();
                                    $('#eventModal').modal('hide');
                                }
                            });
                        }
                    });
                }
            });
            calendar.render();
        });
    </script>
</head>
<body>
<div id='calendar'></div>

<!-- 모달 창 -->
<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventModalLabel">상세정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="event-title" class="col-form-label">제목:</label>
                        <input type="text" class="form-control" name="title">
                    </div>
                    <div class="form-group">
                        <label for="event-description" class="col-form-label">내용:</label>
                        <textarea class="form-control" name="description"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="event-start-date" class="col-form-label">시작 날짜:</label>
                        <input type="text" class="form-control" name="start-date">
                    </div>
                    <div class="form-group">
                        <label for="event-end-date" class="col-form-label">종료 날짜:</label>
                        <input type="text" class="form-control" name="end-date">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary" id="saveEvent">저장</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>