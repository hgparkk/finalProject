<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Coding Bamboo - 공지사항 수정</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
html, body {
    min-height: 100%;
    display: flex;
    flex-direction: column;
    margin: 0;
    padding: 0;
    background-color: #f4f7f6;
    font-family: 'Noto Sans KR', sans-serif;
}

.edit-container {
    padding: 50px 20px;
    width: 800px;
    max-width: 800px;
    margin: 0 auto;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    flex-grow: 1;
}

.title-box {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin-bottom: 20px;
    text-align: center;
}

.title-box h1 {
    color: green;
    font-weight: bold;
}

.edit-form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.edit-form input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
}

.edit-form textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
    resize: none;
    height: 300px;
}

.edit-form button {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: white;
    font-size: 1rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.edit-form button:hover {
    background-color: #0056b3;
}
</style>
<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
</head>
<body>
    <!-- Header -->
    <%@ include file="/WEB-INF/inc/top.jsp"%>

    <div class="title-box">
        <h1>공지사항 수정</h1>
        <span style="font-size: 0.7vw;">Coding Bamboo Notice</span>
    </div>

    <!-- 수정 폼 -->
    <div class="edit-container">
        <form action="noticeEditDo" method="post" class="edit-form">
            <!-- 공지사항 번호 (숨겨진 필드) -->
            <input type="hidden" name="noticeNo" value="${notice.noticeNo}" />

            <!-- 제목 -->
            <div>
                <label for="noticeTitle" style="font-weight: bold;">제목</label>
                <input type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}" placeholder="제목을 입력하세요" required>
            </div>

            <!-- 내용 -->
            <div>
                <label for="noticeContent" style="font-weight: bold;">내용</label>
                <textarea id="noticeContent" name="noticeContent" required>${notice.noticeContent}</textarea>
            </div>

            <!-- 수정 버튼 -->
            <button type="submit">수정</button>
        </form>
    </div>

    <script>
        // CKEditor 초기화
        CKEDITOR.replace('noticeContent', {
            height: 400, // 에디터 높이 설정
            toolbar: [
                { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat'] },
                { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Blockquote'] },
                { name: 'insert', items: ['Image', 'Table', 'HorizontalRule'] },
                { name: 'styles', items: ['Format', 'Font', 'FontSize'] },
                { name: 'colors', items: ['TextColor', 'BGColor'] },
                { name: 'tools', items: ['Maximize'] }
            ],
            filebrowserUploadUrl: '/ckeditor/upload', // 파일 업로드 URL
            filebrowserUploadMethod: 'form'
        });
    </script>

    <!-- Footer -->
    <%@ include file="/WEB-INF/inc/footer.jsp"%>
</body>
</html>
