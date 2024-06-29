<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Tomcat 10.x JSTL -->    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  <title>會員登入</title>
  
  <!-- 外部 CSS -->
  <!-- sweetalert2  -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.min.css">
  
  <!-- 共用 CSS -->
  <link rel="stylesheet" href="./css/cname.css">
   <link href="images/CAKE2_logo.png" rel="icon" type="image/x-ico">
  <style>
  
    .form-group-checkbox {
      display: flex;
      align-items: center;
    }

    .form-group-checkbox label {
      margin-right: 10px;
    }

    .form-group-checkbox .forgot-password {
      margin-left: auto;
    }
    
    .swal2-container {
      position: fixed !important;
      top: 50% !important;
      left: 50% !important;
      transform: translate(-50%, -50%) !important;
      z-index: 9999 !important; /* 保證彈窗在最上層 */
      width: 100vw;
      height: 100vh;
    }
    
    .login-container {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
  </style>
</head>

<body>
  <div class="background-container">
    <div class="login-container">
      <h2>會員登入</h2>
      <form id="loginForm" action="/cname" method="post">
        <div class="form-group">
          <label for="email">帳號：</label>
          <input type="email" id="email" name="email" placeholder="請輸入信箱" required>
        </div>
        <div class="form-group">
          <label for="password">密碼：</label>
          <input type="password" id="password" name="password" placeholder="請輸入密碼" required>
        </div>
        <div class="form-group-checkbox">
          <input type="checkbox" id="keep-login" name="keep-login">
          <label for="keep-login">保持登入</label>
          <a href="#" class="forgot-password">忘記密碼？</a>
        </div>
        <button type="submit">登入</button>
      </form>
      <div class="register-link">
        <div style="float: left;">
          還不是會員？<a href="/account">註冊會員</a>
        </div>
        <div style="float: right;">
          <a href="/cake">返回首頁</a>
        </div>
        <div style="clear: both;"></div>
      </div>
    </div>
  </div>

  <!-- 引入 SweetAlert2 的 JavaScript 庫 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.all.min.js"></script>
  
  <script>
    // 監聽表單提交事件
    document.getElementById("loginForm").addEventListener("submit", function(event) {
      event.preventDefault(); // 阻止默認的表單提交行為

      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;

      // 進行必要的驗證，例如檢查郵箱格式等
      if (!email || !password) {
        alert("請填寫完整的帳號和密碼！");
        return false;
      }

      // 使用 fetch 發起登入請求
      fetch("/cname", {
        method: "POST",
        body: new URLSearchParams({
          email: email,
          password: password
        })
      })
      .then(response => {
        if (response.ok) {
          // 登入成功
          Swal.fire({
            icon: 'success',
            title: '登入成功！',
            showConfirmButton: false,
            timer: 1500
          }).then(() => {
            window.location.href = "/cake"; // 跳轉到首頁
          });
        } else {
          // 登入失敗
          Swal.fire({
            icon: 'error',
            title: '登入失敗',
            text: '用戶名或密碼錯誤',
            confirmButtonText: '確定'
          });
        }
      })
      .catch(error => {
        console.error('Error:', error);
        Swal.fire({
          icon: 'error',
          title: '登入失敗',
          text: '發生錯誤，請稍後再試',
          confirmButtonText: '確定'
        });
      });
    });
  </script>

</body>

</html>