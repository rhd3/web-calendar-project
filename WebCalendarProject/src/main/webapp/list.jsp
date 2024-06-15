<%@ page contentType="text/html; charset=utf-8" %>
<html>

<head>
    <style>
        .todo-container {
            top: 20px;
            left: 700px;
            position: relative;
            margin: 10px;
            padding: 20px;
            width: 500px;
            height: 300px;
            background-color: #3E8DDC;
            font-size: 15px;
            color: white;
            border: 2px bold;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const input = document.querySelector('#todo');
            const addButton = document.querySelector('#add-button');
            const todoList = document.querySelector('#todo-list');
            const alert = document.querySelector('#alert-message'); // Use specific ID to avoid conflicts

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
</head>

<body>
    <div class="todo-container">
        <h3>할 일 목록</h3>
        <span id="alert-message"></span><br> <!-- Use specific ID to avoid conflicts -->
        <input id="todo">
        <button id="add-button">+</button>
        <div id="todo-list"></div>
    </div>
</body>

</html>
