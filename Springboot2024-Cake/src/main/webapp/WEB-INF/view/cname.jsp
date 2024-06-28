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
  <link rel="stylesheet" href="./css/login.css">
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
  </style>
</head>

<body>
  <div class="background-container">
    <div class="login-container">
      <h2>會員登入</h2>
      <form action="/cname" method="post" onsubmit="return validateForm()">
        <div class="form-group">
          <label for="email">帳號：</label>
          <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="password">密碼：</label>
          <input type="password" id="password" name="password" required>
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
</body>

	<script>
	function validateForm() {
	  var email = document.getElementById("email").value;
	  var password = document.getElementById("password").value;
	  
	  // 进行必要的验证，例如检查邮箱格式等
	  if (!email || !password) {
	    alert("請填寫完整的帳號和密碼！");
	    return false;
	  }
	  
	  return true;
	}
	</script>

</html>