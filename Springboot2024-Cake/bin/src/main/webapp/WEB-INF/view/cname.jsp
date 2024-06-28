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
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  <title>會員登入</title>
  
  <!-- 共用css -->
  <link rel="stylesheet" href="./css/login.css">
  <link href="images/CAKE2_logo.png" rel="icon" type="image/x-ico">
  
  <!-- 外部css -->
  <!-- 引入 SweetAlert2 样式 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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
  </style>
</head>

<body>
  <div class="background-container">
    <div class="login-container">
      <h2>會員登入</h2>
      <form id="loginForm" action="/cname" method="post" onsubmit="return validateForm()">
        <div class="form-group">
          <label for="email">帳號：</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="password">密碼：</label>
          <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
          <label for="captcha">驗證碼：</label>
          <input type="text" id="captcha" name="captcha" required>
          <img src="/captcha" alt="Captcha Image">
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
        <div style="clear: both;">
        </div>
      </div>
    </div>
  </div>

  <!-- 引入 SweetAlert2 的 JavaScript 库 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    // 监听表单提交事件
    document.getElementById("loginForm").addEventListener("submit", function(event) {
      event.preventDefault(); // 阻止默认的表单提交行为

      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;
      var captcha = document.getElementById("captcha").value;

      // 进行必要的验证，例如检查邮箱格式等
      if (!email || !password || !captcha) {
        Swal.fire({
          icon: 'warning',
          title: '請填寫完整的帳號、密碼和驗證碼！',
          confirmButtonText: '確定'
        });
        return false;
      }

      // 使用 fetch 发起登录请求
      fetch("/cname", {
        method: "POST",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
          email: email,
          password: password,
          captcha: captcha
        })
      })
      .then(response => {
        if (response.ok) {
          // 登录成功
          Swal.fire({
            icon: 'success',
            title: '登入成功！',
            showConfirmButton: false,
            timer: 1500
          }).then(() => {
            window.location.href = "/cake"; // 跳转到首页
          });
        } else {
          // 登录失败
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