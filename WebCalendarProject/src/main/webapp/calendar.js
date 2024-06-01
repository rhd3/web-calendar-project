document.addEventListener('DOMContentLoaded', function () {
    const calendarContainer = document.getElementById('calendar-container');
    const monthYearDisplay = document.getElementById('month-year');
    const prevMonthBtn = document.getElementById('prev-month');
    const nextMonthBtn = document.getElementById('next-month');
    const calendarDays = document.getElementById('calendar-days');

    const eventModal = document.getElementById('event-modal');
    const closeModalBtn = document.getElementsByClassName('close')[0];
    const modalDateDisplay = document.getElementById('modal-date');
    const eventText = document.getElementById('event-text');
    const saveEventBtn = document.getElementById('save-event');
    const deleteEventBtn = document.getElementById('delete-event');

    let currentDate = new Date();
    let events = JSON.parse(localStorage.getItem('events')) || {};

    function renderCalendar() {
        calendarDays.innerHTML = '';
        let month = currentDate.getMonth();
        let year = currentDate.getFullYear();

        let firstDay = new Date(year, month, 1).getDay();
        let lastDate = new Date(year, month + 1, 0).getDate();

        monthYearDisplay.textContent = new Date(year, month).toLocaleString('ko-KR', { month: 'long', year: 'numeric' });

        for (let i = 0; i < firstDay; i++) {
            calendarDays.innerHTML += '<div></div>';
        }

        for (let date = 1; date <= lastDate; date++) {
            let dayDiv = document.createElement('div');
            dayDiv.textContent = date;
            dayDiv.addEventListener('click', () => openEventModal(date));
            if (events[`${year}-${month + 1}-${date}`]) {
                dayDiv.classList.add('has-event');
            }
            calendarDays.appendChild(dayDiv);
        }
    }

    function openEventModal(date) {
        let month = currentDate.getMonth() + 1;
        let year = currentDate.getFullYear();
        let formattedDate = `${year}-${month}-${date}`;

        modalDateDisplay.textContent = new Date(year, month - 1, date).toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric' });

        eventText.value = events[formattedDate] || '';
        eventModal.style.display = 'block';

        saveEventBtn.onclick = function () {
            events[formattedDate] = eventText.value;
            localStorage.setItem('events', JSON.stringify(events));
            eventModal.style.display = 'none';
            renderCalendar();
        };

        deleteEventBtn.onclick = function () {
            delete events[formattedDate];
            localStorage.setItem('events', JSON.stringify(events));
            eventModal.style.display = 'none';
            renderCalendar();
        };
    }

    closeModalBtn.onclick = function () {
        eventModal.style.display = 'none';
    };

    window.onclick = function (event) {
        if (event.target == eventModal) {
            eventModal.style.display = 'none';
        }
    };

    prevMonthBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar();
    });

    nextMonthBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar();
    });

    renderCalendar();
});
