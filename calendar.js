let currentDate = new Date();
let today = new Date(); // 오늘 날짜 정보 저장

function renderCalendar() {
    const calendar = document.getElementById('calendar');
    calendar.innerHTML = ''; // 이전 캘린더 내용 초기화

    const year = currentDate.getFullYear();
    const month = currentDate.getMonth();
    const todayDate = today.getDate(); // 오늘 날짜

    document.getElementById('month-year').textContent = `${year}년 ${month + 1}월`;

    const firstDay = new Date(year, month, 1);
    const lastDay = new Date(year, month + 1, 0);

    // 달력 시작 전 빈 칸 채우기
    for (let i = 0; i < firstDay.getDay(); i++) {
        calendar.innerHTML += '<div></div>';
    }

    // 현재 달의 날짜를 채움
    for (let day = 1; day <= lastDay.getDate(); day++) {
        if (day === todayDate && month === today.getMonth() && year === today.getFullYear()) {
            // 현재 날짜 강조
            calendar.innerHTML += `<div style="background-color: #ff0;">${day}</div>`;
        } else {
            calendar.innerHTML += `<div>${day}</div>`;
        }
    }
}

// 이전 달 이동
document.getElementById('prev-month').addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() - 1);
    renderCalendar();
});

// 다음 달 이동
document.getElementById('next-month').addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() + 1);
    renderCalendar();
});

// 초기 캘린더 렌더링
renderCalendar();
/**
 * 
 */document.addEventListener('DOMContentLoaded', function () {
    // 캘린더 생성 로직 (이전에 구현한 로직을 여기에 포함)
    renderCalendar();

    // 모달 엘리먼트와 이벤트 요소들을 가져옵니다.
    var modal = document.getElementById("eventModal");
    var btnSave = document.getElementById("saveEvent");
    var spanClose = document.getElementsByClassName("close")[0];

    // 날짜 클릭 이벤트 리스너
    document.getElementById('calendar').addEventListener('click', function (e) {
        if(e.target.tagName === 'DIV') {
            modal.style.display = "block";
        }
    });

    // 모달 닫기 버튼
    spanClose.onclick = function() {
        modal.style.display = "none";
    }

    // 화면 어디든 클릭하면 모달 닫힘
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // 일정 저장 버튼 클릭 이벤트
    btnSave.addEventListener('click', function () {
        var title = document.getElementById('eventTitle').value;
        // 여기에 일정 저장 로직을 구현 
        console.log(title); // 콘솔 로그로 확인
        modal.style.display = "none"; // 모달 닫기
    });
});
