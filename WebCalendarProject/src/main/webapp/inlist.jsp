<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const input = document.querySelector('#todo');
            const addButton = document.querySelector('#add-button');
            const todoList = document.querySelector('#todo-list');
            const alertSpan = document.querySelector('span');

            const createCheckbox = () => {
                const checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
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
                const text = document.createElement('span');
                text.textContent = input.value;

                item.appendChild(createCheckbox());
                item.appendChild(text);
                item.appendChild(createDeleteButton());

                todoList.appendChild(item);

                input.value = '';
                alertSpan.textContent = '';
            };

            const handleCheckboxChange = (event) => {
                const textElement = event.target.nextSibling;
                textElement.style.textDecoration = event.target.checked ? 'line-through' : 'none';
            };

            const handleDeleteButtonClick = (event) => {
                todoList.removeChild(event.target.parentNode);
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
        <span></span><br>
        <input id="todo">
        <button id="add-button">+</button>
        <div id="todo-list"></div>
    </div>
</body>
</html>
