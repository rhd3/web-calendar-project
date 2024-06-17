<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <style>
        .notice {
        	position: relative;
            margin-left: 15%;
            width: 500px;
            height: 300px;
            font-size: 20px;
            background-color: white; 
        }
        .notice-header {
            height: 25%;
            background-color: #328DDC;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 0;
            padding: 0;
        }
        .notice button {
            padding: 5px 10px;
            font-size: 20px;
            background-color: #3E8DDC;
            color: #FFFFFF;
            border: none;
            cursor: pointer;
        }
        .notice button:hover {
            background-color: #3E8DDC;
        }
            .todo-container {
 			position: relative;
            margin-right: 15%;
            padding: 20px;
            width: 500px;
            height: 300px;
            font-size: 15px;
            background-color: white;
            
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

    <div style="display: flex; justify-content: space-between;">
        <div class="notice">
            <div class="notice-header">
                <span>공지사항</span>
                <button onclick="location.href='notice_list.jsp'">+</button>
            </div>
                <li>제목(title) 작성일(regtime)만 뜨도록. 제목 클릭시 해당 페이지(view.jsp)로 이동</li>
        </div>

        <div class="todo-container">
            <h3>할 일 목록</h3>
            <span id="alert-message"></span><br> <!-- Use specific ID to avoid conflicts -->
            <input id="todo">
            <button id="add-button">+</button>
            <div id="todo-list"></div>
        </div>
    </div>

</body>

</html>
