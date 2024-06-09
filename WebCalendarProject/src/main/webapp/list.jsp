<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <title>To Do List</title>
</head>
<body>
    <button onclick="openNoticePopup()">To do list</button>
    <dialog id="todoPopup">
        <div class="todo-container">
            <h2>할 일 목록</h2>
            <span></span><br>
            <input id="todo">
            <button id="add-button">+</button>
            <div id="todo-list"></div>

            <button onclick="closeNoticePopup()">닫기</button>
        </div>
    </dialog>

    <script>
        function openNoticePopup() {
            document.getElementById('todoPopup').showModal();
        }

        function closeNoticePopup() {
            document.getElementById('todoPopup').close();
        }

        document.addEventListener('DOMContentLoaded', () => {
            const input = document.querySelector('#todo');
            const addButton = document.querySelector('#add-button');
            const todoList = document.querySelector('#todo-list');
            const alert = document.querySelector('span');

            const addTodo = () => {
                if (input.value !== '') {
                    const item = document.createElement('div');
                    const checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    const text = document.createElement('span');
                    const deleteButton = document.createElement('button');
                    deleteButton.textContent = "삭제";

                    text.textContent = input.value;
                    input.value = '';

                    item.appendChild(checkbox);
                    item.appendChild(text);
                    item.appendChild(deleteButton);
                    todoList.appendChild(item);

                    checkbox.addEventListener('change', (event) => {
                        if (event.currentTarget.checked) {
                            text.style.textDecoration = 'line-through';
                        } else {
                            text.style.textDecoration = 'none';
                        }
                    });

                    deleteButton.addEventListener('click', (event) => {
                        todoList.removeChild(event.currentTarget.parentNode);
                    });
                    input.value = '';
                    alert.textContent = '';
                } else {
                    alert.textContent = '할 일을 입력하세요!';
                }
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
</body>
</html>
