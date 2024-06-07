<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>일정 입력</title>
    <style>
        <%--기본 폼 스타일링--%>
        form { max-width: 500px; margin: 40px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); } 
        .input_wrap { margin-bottom: 20px; } 
        .input_list { display: flex; align-items: center; margin-bottom: 10px; } 
        <%--텍스트 입력 필드 스타일--%>
        .input_list input[type="text"] { padding:0 10px; height: 45px; border: 1px solid #ddd; border-radius: 4px; flex-grow: 1; } 
        <%--추가 버튼 스타일--%>
        .add_field { width: 100%; height: 45px; padding: 0 15px; background-color: #007bff; border: none; border-radius: 4px; color: white; cursor: pointer; transition: background-color 0.3s ease; } 
        .add_field:hover { background-color: #0056b3; } 
        <%--삭제 버튼 스타일--%>
        .remove_field { display: flex; align-items: center; height: 45px; margin-left: 6px; padding:0 15px; background: #ff4d4d; border-radius:4px; color: #fff; cursor: pointer; text-decoration: none; } 
        .remove_field:hover { background: #ff3333; } 
    </style>
</head>
<body>
    <form>
        <div class="input_wrap">
            <%--초기 입력 필드 --%>
            <div class="input_list">
                <input type="text" name="input_array[]" placeholder="입력해주세요." />
            </div>
        </div>
        <%--입력 필드 추가 버튼--%>
        <button class="add_field">추가하기</button>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        <%--필드 컨테이너와 추가 버튼 선택--%>
        const wrapper = $('.input_wrap');
        const addButton = $('.add_field');
        <%--최대 입력 필드 수 설정--%>
        const maxFields = 10;
        <%--현재 입력 필드 수--%>
        let fieldCount = 1;

        <%--'추가하기' 버튼 클릭 이벤트--%>
        addButton.click(function(e) {
            e.preventDefault(); <%--페이지 리로드 방지--%>
            if (fieldCount < maxFields) { <%--최대 필드 수 체크--%>
                fieldCount++; <%--필드 수 증가--%>
                <%--새 입력 필드 추가--%>
                wrapper.append(`
                    <div class="input_list">
                        <input type="text" name="input_array[]" placeholder="입력해주세요." />
                        <a href="javascript:void(0);" class="remove_field">삭제</a>
                    </div>
                `);
            }
        });

        <%--'삭제' 링크 클릭 이벤트--%>
        wrapper.on('click', '.remove_field', function(e) {
            e.preventDefault(); <%--페이지 리로드 방지--%>
            $(this).parent('.input_list').remove(); <%--필드 제거--%>
            fieldCount--; <%--필드 수 감소--%>
        });
    </script>
</body>
</html>
