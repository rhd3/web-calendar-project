<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/main.min.css' rel='stylesheet' />
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
.fc-day-sun a{
    color : red;
}

.fc-day-sat .fc-col-header-cell-cushion,
.fc-day-sat a {
    color : blue;
}
    </style>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          editable: true,
          selectable: true,
          selectOverlap: false,
          dayMaxEvents: 5,
          events: [],

          dateClick: function(info) {
            $('#eventModal').modal('show');
            $('#eventModal').find('input[name="start-date"]').val(info.dateStr);
            $('#eventModal').find('input[name="end-date"]').val(info.dateStr);
            $('#eventModal').find('input[name="title"]').val('');
            $('#saveEvent').off('click').on('click', function() {
              var title = $('#eventModal').find('input[name="title"]').val();
              var startDate = $('#eventModal').find('input[name="start-date"]').val();
              var endDate = $('#eventModal').find('input[name="end-date"]').val();
              if (title && startDate && endDate) {
                calendar.addEvent({
                  title: title,
                  start: startDate,
                  end: endDate
                });
                $('#eventModal').modal('hide');
              }
            });
          },

          select: function(info) {
            $('#eventModal').modal('show');
            $('#eventModal').find('input[name="start-date"]').val(info.startStr);
            $('#eventModal').find('input[name="end-date"]').val(info.endStr);
            $('#eventModal').find('input[name="title"]').val('');
            $('#saveEvent').off('click').on('click', function() {
              var title = $('#eventModal').find('input[name="title"]').val();
              var startDate = $('#eventModal').find('input[name="start-date"]').val();
              var endDate = $('#eventModal').find('input[name="end-date"]').val();
              if (title && startDate && endDate) {
                calendar.addEvent({
                  title: title,
                  start: startDate,
                  end: endDate
                });
                $('#eventModal').modal('hide');
              }
            });
          },

          eventClick: function(info) {
            $('#eventModal').modal('show');
            $('#eventModal').find('input[name="start-date"]').val(info.event.startStr);
            $('#eventModal').find('input[name="end-date"]').val(info.event.endStr || info.event.startStr);
            $('#eventModal').find('input[name="title"]').val(info.event.title);
            $('#saveEvent').off('click').on('click', function() {
              var title = $('#eventModal').find('input[name="title"]').val();
              var startDate = $('#eventModal').find('input[name="start-date"]').val();
              var endDate = $('#eventModal').find('input[name="end-date"]').val();
              if (title && startDate && endDate) {
                info.event.setProp('title', title);
                info.event.setDates(startDate, endDate);
                $('#eventModal').modal('hide');
              }
            });
            $('#deleteEvent').off('click').on('click', function() {
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
  <body>
    <div id='calendar'></div>

    <!-- Modal -->
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="eventModalLabel">일정 추가/수정</h5>
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
                <input type="text" class="form-control" name="start-date" readonly>
              </div>
              <div class="form-group">
                <label for="event-end-date" class="col-form-label">종료 날짜:</label>
                <input type="text" class="form-control" name="end-date" readonly>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
            <button type="button" class="btn btn-primary" id="saveEvent">저장</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
