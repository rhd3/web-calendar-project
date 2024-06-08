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
   <jsp:include page="notice.jsp" />
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          // 초기 보여줄 뷰를 설정합니다.
          // 지원하는 뷰는 month, week, dayGridMonth, dayGridWeek, dayGridDay 등이 있습니다.
          initialView: 'dayGridMonth',
          
          // 일정을 수정할 수 있는지 여부를 설정합니다.
          editable: true,
          
          // 일정을 선택할 수 있는지 여부를 설정합니다.
          selectable: true,
          
          // 겹치는 일정을 선택할 수 있는지 여부를 설정합니다.
          selectOverlap: true,
          
          // 한 날에 최대 표시할 이벤트 수를 설정합니다.
          dayMaxEvents: 5,
          
          // 초기에 표시할 일정 데이터를 설정합니다.
          events: [],
          
          
          /*
           * 사용자가 날짜를 클릭했을 때 일정을 추가하는 함수입니다.
           * 모달 창을 띄우고, 시작 날짜와 종료 날짜, 제목을 입력받습니다.
           * 입력받은 값을 사용하여 일정을 추가하고, 모달 창을 닫습니다.
           */
          dateClick: function(info) {
            $('#eventModal').modal('show'); // 모달 창을 띄웁니다.
            $('#eventModal').find('input[name="start-date"]').val(info.dateStr); // 시작 날짜를 입력받습니다.
            $('#eventModal').find('input[name="end-date"]').val(info.dateStr); // 종료 날짜를 입력받습니다.
            $('#eventModal').find('input[name="title"]').val(''); // 제목을 비웁니다.
            $('#saveEvent').off('click').on('click', function() { // 저장 버튼을 클릭했을 때 실행되는 이벤트 핸들러입니다.
              var title = $('#eventModal').find('input[name="title"]').val(); // 제목을 입력받습니다.
              var startDate = $('#eventModal').find('input[name="start-date"]').val(); // 시작 날짜를 입력받습니다.
              var endDate = $('#eventModal').find('input[name="end-date"]').val(); // 종료 날짜를 입력받습니다.
              if (title && startDate && endDate) { // 모든 값이 입력되었으면,
                calendar.addEvent({ // 일정을 추가합니다.
                  title: title,
                  start: startDate,
                  end: endDate
                });
                $('#eventModal').modal('hide'); // 모달 창을 닫습니다.
              }
            });
          },


          /**
           * 사용자가 일정을 선택했을 때 일정을 추가하는 함수입니다.
           * 모달 창을 띄우고, 시작 날짜와 종료 날짜, 제목을 입력받습니다.
           * 입력받은 값을 사용하여 일정을 추가하고, 모달 창을 닫습니다.
           * @param {Object} info - 선택된 일정에 대한 정보
           */
          select: function(info) {
            // 모달 창을 띄웁니다.
            $('#eventModal').modal('show'); 
            
            // 시작 날짜와 종료 날짜를 입력받습니다.
            $('#eventModal').find('input[name="start-date"]').val(info.startStr);
            $('#eventModal').find('input[name="end-date"]').val(info.endStr);
            
            // 제목을 비웁니다.
            $('#eventModal').find('input[name="title"]').val('');
            
            // 저장 버튼을 클릭했을 때 실행되는 이벤트 핸들러입니다.
            $('#saveEvent').off('click').on('click', function() { 
              // 제목을 입력받습니다.
              var title = $('#eventModal').find('input[name="title"]').val();
              
              // 시작 날짜와 종료 날짜를 입력받습니다.
              var startDate = $('#eventModal').find('input[name="start-date"]').val();
              var endDate = $('#eventModal').find('input[name="end-date"]').val();
              
              // 모든 값이 입력되었으면, 일정을 추가합니다.
              if (title && startDate && endDate) { 
                calendar.getApi().addEvent({
                  title: title,
                  start: startDate,
                  end: endDate
                });
                
                // 모달 창을 닫습니다.
                $('#eventModal').modal('hide');
              }
            });
          },


          /**
           * 이벤트가 클릭되었을 때 호출되는 콜백 함수입니다.
           * 이벤트의 모달 창을 표시하고, 이벤트의 시작 날짜, 끝 날짜, 제목을 입력 필드에 설정합니다.
           *
           * @param {Object} info - 클릭된 이벤트에 대한 정보
           */
          eventClick: function(info) {
            // 모달 창을 표시합니다.
            $('#eventModal').modal('show');
            
            // 이벤트의 시작 날짜를 입력 필드에 설정합니다.
            $('#eventModal').find('input[name="start-date"]').val(info.event.startStr);
            
            // 이벤트의 끝 날짜를 입력 필드에 설정합니다.
            // 만약 끝 날짜가 없으면 시작 날짜를 사용합니다.
            $('#eventModal').find('input[name="end-date"]').val(info.event.endStr || info.event.startStr);
            
            // 이벤트의 제목을 입력 필드에 설정합니다.
            $('#eventModal').find('input[name="title"]').val(info.event.title);
            
            // 저장 버튼에 클릭 이벤트를 설정합니다.
            $('#saveEvent').off('click').on('click', function() {
              var title = $('#eventModal').find('input[name="title"]').val();
              var startDate = $('#eventModal').find('input[name="start-date"]').val();
              var endDate = $('#eventModal').find('input[name="end-date"]').val();
              
              // 모든 값이 입력되었으면 이벤트의 제목과 날짜를 업데이트합니다.
              if (title && startDate && endDate) {
                info.event.setProp('title', title);
                info.event.setDates(startDate, endDate);
                $('#eventModal').modal('hide');
              }
            });
            
            // 삭제 버튼에 클릭 이벤트를 설정합니다.
            $('#deleteEvent').off('click').on('click', function() {
            	// 삭제 알림을 표시합니다.
            	if (toastr.success('삭제되었습니다.')) {
            		// 이벤트를 삭제하고 모달 창을 닫습니다.
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


    <%@ include file="notice.jsp" %>

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

