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
  <style>
    .background-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      padding: 0;
      background-color: #6fb5f3; /* 淺藍色背景 */
      font-family: Arial, sans-serif; /* 使用常見的 sans-serif 字體 */
    }
    .register-container {
      width: 100%;
      max-width: 400px; /* 最大寬度為 400px */
      padding: 40px;
      background-color: #f9f9f9;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .register-container h2 {
      margin-bottom: 20px;
      text-align: center; /* 文字置中 */
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    .form-group input {
      width: 100%;
      padding: 12px;
      border: 1px solid #eaeaea;
      border-radius: 5px;
      box-sizing: border-box;
      font-size: 16px; /* 字體大小 */
    }
    .form-group p {
      font-size: 12px; /* 小文字體 */
      color: #777; /* 灰色文字 */
      margin-top: 5px;
    }
    .register-container button {
      width: 100%;
      padding: 12px;
      background-color: #0086e8;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px; /* 字體大小 */
    }
    .register-container button:hover {
      background-color: #005d8c;
    }

    /* 增加一些響應式的調整 */
    @media (max-width: 480px) {
      .register-container {
        padding: 20px;
      }
      .register-container input,
      .register-container button {
        font-size: 14px; /* 小一點的字體大小 */
      }
    }

    /* 使用來自原始CSS的特定樣式 */
    .register-link {
      margin-left: auto;
      text-align: center;
    }
    .register-link a {
      color: #0086e8;
      text-decoration: none;
    }
    .register-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
  <div class="background-container">
    <div class="register-container">
      <h2>註冊新會員</h2>
      <form action="/register" method="post">
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
  
	<!-- JavaScript 提示框 -->
	<!-- 引入 SweetAlert2 的 JavaScript 库 -->
  	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.all.min.js"></script>
  	
  	<!-- JavaScript 提示框 -->
	  <script th:inline="javascript">
    /*<![CDATA[*/
    var message = /*[[${message}]]*/ null;
    
    // 根据后端传递的消息弹出 SweetAlert 提示框
    if (message !== null && message !== "") {
      if (message === "會員註冊成功") {
        Swal.fire({
          icon: "success",
          title: "會員註冊成功",
          showConfirmButton: false,
          timer: 5000, // 5秒后自动关闭
          timerProgressBar: true,
          didOpen: () => {
            // 倒计时结束后跳转到登入页面
            Swal.showLoading();
            setTimeout(() => {
              window.location.href = "/cname";
            }, 5000);
          }
        });
      } else if (message === "該郵箱已經被註冊") {
        Swal.fire({
          icon: "error",
          title: "註冊失敗",
          text: "Email重複註冊"
        });
      } else if (message === "該手機號碼已經被註冊") {
        Swal.fire({
          icon: "error",
          title: "註冊失敗",
          text: "Phone重複註冊"
        });
      } else {
        Swal.fire({
          icon: "error",
          title: "註冊失敗",
          text: "Something went wrong!",
          footer: '<a href="#">Why do I have this issue?</a>'
        });
      }
    }
    /*]]>*/
  </script>
</body>

</html>