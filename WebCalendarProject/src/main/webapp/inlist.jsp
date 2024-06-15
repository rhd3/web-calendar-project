<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <style>
        h2 {
            text-align: center; /* 가운데 정렬 */
            font-size: 32px; /* 글씨 크기 조정 */
        }
        .todo-container {
            text-align: center; /* 내용 가운데 정렬 */
            margin-top: 20px; /* 위 여백 추가 */
        }
        span.alert {
            color: red; /* 경고문 글자색 */
        }
        input[type="text"] {
            width: 300px; /* 입력 박스 너비 조정 */
            padding: 8px; /* 내부 여백 조정 */
            margin-right: 10px; /* 우측 여백 추가 */
            font-size: 16px; /* 입력값 글씨 크기 키우기 */
        }
        button, input[type="button"] {
            padding: 8px 12px; /* 패딩 추가 */
            font-size: 16px; /* 버튼 글씨 크기 조정 */
        }
        /* 체크박스 사용자 정의 스타일 */
        .custom-checkbox {
            display: inline-block;
            width: 20px; /* 체크박스 가로 크기 */
            height: 20px; /* 체크박스 세로 크기 */
            background-color: #fff;
            border: 1px solid #ccc;
            cursor: pointer;
            margin-right: 8px; /* 체크박스 오른쪽 여백 추가 */
            -webkit-appearance: none; /* 기본 체크박스 스타일 제거 (크로스 브라우저) */
            appearance: none; /* 기본 체크박스 스타일 제거 (크로스 브라우저) */
        }
        .custom-checkbox:checked {
            background-color: #007bff; /* 체크됐을 때 배경색 */
            border: 1px solid #007bff;
        }
        .custom-checkbox:checked::after {
            content: '✔'; /* 체크 표시 */
            display: block;
            text-align: center;
            color: white;
            font-size: 16px;
            line-height: 20px; /* 체크박스 크기에 맞춤 */
        }
        /* 체크박스와 텍스트 사이의 간격 조정 */
        label.custom-label {
            display: inline-block;
            vertical-align: middle;
            margin-left: 5px; /* 텍스트와 체크박스 사이의 간격 조정 */
            font-size: 16px; /* 입력값 글씨 크기 키우기 */
        }
        /* 할 일 목록 아래 여백 추가하여 가운데 정렬 */
        #todo-list {
            margin-top: 20px;
            text-align: center; /* 할 일 목록 가운데 정렬 */
        }
        #todo-list div {
            margin-bottom: 10px; /* 할 일 목록 아이템 간격 조정 */
            font-size: 16px; /* 입력값 글씨 크기 키우기 */
        }
    </style>
    <script>
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const input = document.querySelector('#todo');
        const addButton = document.querySelector('#add-button');
        const todoList = document.querySelector('#todo-list');
        const alertSpan = document.querySelector('span.alert');
        const userId = 'user123'; // 현재 사용자 ID (예: 세션 또는 다른 방법으로 가져온 값)

        const createCheckbox = () => {
            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.className = 'custom-checkbox'; // 사용자 정의 클래스 추가
            checkbox.addEventListener('change', handleCheckboxChange);
            return checkbox;
        };

        const createDeleteButton = () => {
            const deleteButton = document.createElement('button');
            deleteButton.textContent = "삭제";
            deleteButton.addEventListener('click', handleDeleteButtonClick);
            return deleteButton;
        };

        const addTodo = () => {
            if (input.value === '') {
                alertSpan.textContent = '할 일을 입력하세요!';
                return;
            }

            const item = document.createElement('div');
            const checkbox = createCheckbox(); // 체크박스 생성
            const text = document.createElement('span');
            text.textContent = input.value;
            text.style.fontSize = '16px'; // 입력값 글씨 크기 키우기

            item.appendChild(checkbox);
            item.appendChild(text);
            item.appendChild(createDeleteButton());

            todoList.appendChild(item);

            saveTodoToDatabase(input.value); // 데이터베이스에 저장

            input.value = '';
            alertSpan.textContent = '';
        };

        const handleCheckboxChange = (event) => {
            const textElement = event.target.nextSibling;
            textElement.style.textDecoration = event.target.checked ? 'line-through' : 'none';
        };

        const handleDeleteButtonClick = (event) => {
            const item = event.target.parentNode;
            todoList.removeChild(item);
            deleteTodoFromDatabase(item.querySelector('span').textContent); // 데이터베이스에서 삭제
        };

        const saveTodoToDatabase = (todoText) => {
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'saveTodo.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = () => {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log('할일이 저장되었습니다.');
                }
            };
            xhr.send(`userId=${encodeURIComponent(userId)}&todo=${encodeURIComponent(todoText)}`);
        };

        const deleteTodoFromDatabase = (todoText) => {
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'deleteTodo.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = () => {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log('할일이 삭제되었습니다.');
                }
            };
            xhr.send(`userId=${encodeURIComponent(userId)}&todo=${encodeURIComponent(todoText)}`);
        };

        addButton.addEventListener('click', addTodo);

        input.addEventListener('keypress', (event) => {
            const ENTER = 13;
            if (event.keyCode === ENTER) {
                addTodo();
            }
        });
    });
</script>

</head>
<body>
    <div class="todo-container">
        <h2>할 일 목록</h2>
        <span class="alert"></span><br>
        <input id="todo" type="text">
        <button id="add-button">+</button>
        <div id="todo-list"></div>
    </div>
</body>
</html>
