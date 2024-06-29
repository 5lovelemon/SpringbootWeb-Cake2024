<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  
  <title>註冊新會員</title>
  
  <!-- 外部 CSS -->
  <!-- sweetalert2  -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.min.css">
  
  <!-- 共用 CSS -->
  <link rel="stylesheet" href="./css/account.css">
  <link href="images/CAKE2_logo.png" rel="icon" type="image/x-ico">

</head>

<body>
  <div class="background-container">
    <div class="register-container">
      <h2>註冊新會員</h2>
      <form id="registerForm" action="/register" method="post">
        <div class="form-group">
          <label for="username">姓名：</label>
          <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
          <label for="email">電子郵件：</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="phone">手機：</label>
          <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-group">
          <label for="birthday">生日：</label>
          <input type="date" id="birthday" name="birthday" required>
        </div>
        <div class="form-group">
          <label for="password">密碼：</label>
          <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
          <label for="confirmPassword">確認密碼：</label>
          <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <button type="submit">註冊</button>
      </form>
      <div class="register-link">
        已經有帳號？<a href="/cname">立即登入</a>
      </div>
    </div>
  </div>
  
  <!-- 引入 SweetAlert2 的 JavaScript 庫 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.all.min.js"></script>
  
  <script>
    // 監聽表單提交事件
    document.getElementById('registerForm').addEventListener('submit', function(event) {
      event.preventDefault();

      const formData = new FormData(this);
      const jsonData = Object.fromEntries(formData.entries());

      fetch('/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(jsonData)
      })
      .then(response => response.json().then(data => ({ status: response.status, body: data })))
      .then(({ status, body }) => {
        if (status === 200) {
          window.location.href = '/cname';
        } else {
          Swal.fire({
            icon: 'error',
            title: '註冊失敗',
            text: body.message
          });
        }
      })
      .catch(error => {
        Swal.fire({
          icon: 'error',
          title: '註冊失敗',
          text: '發生未知錯誤，請稍後再試'
        });
        console.error('Error:', error);
      });
    });
  </script>
  
</body>

</html>