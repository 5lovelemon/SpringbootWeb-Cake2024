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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>購物車</title>
    
  <!-- 使用bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
 
  <!-- 共用的CSS -->
  <link rel="stylesheet" href="./css/cake.css">
  <link href="images/CAKE2_logo.png" rel="icon" type="image/x-ico">
</head>

<body data-bs-spy="scroll" data-bs-target="#navbarMenu" data-bs-offset="0">

    <!-- 導航欄 -->
    <header class="navbar navbar-expand-md navbar-dark fixed-top">
        <div class="container-xl">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="./images/CAKE2_logo.png" width="80px" alt="CAKE_LOGO">
            <h1 class="m-0 ms-2">CAKE</h1>
        </a>

        <!-- 漢堡選單按鈕 -->
        <button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
            aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 導航選單 -->
        <nav class="collapse navbar-collapse" id="navbarMenu">
        
            <ul class="navbar-nav ms-auto mb-2 text-center">
            
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="/cake">最新消息</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="/product">全部商品</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link active" href="/shoppingnote">購物須知</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="#">關於我們</a>
            </li>
            
            <!-- 根據登入狀態顯示不同的連結 -->
            <c:if test="${empty sessionScope.loggedInUser}">
                <!-- 未登入時顯示登入連結 -->
                <li class="nav-item">
                <a class="nav-link" href="/login">登入</a>
                </li>
                
            </c:if>
            <c:if test="${not empty sessionScope.loggedInUser}">
                <li class="nav-item">
                <a class="nav-link" href="/cart">購物車</a>
                </li>
                
                <!-- 已登入時顯示登出連結 -->
                <li class="nav-item">
                <a class="nav-link" href="/logout">登出</a>
                </li>
            </c:if>
            </ul>
        </nav>
        </div>
        
    </header>

    <!-- 購物車功能 -->
    <div class="container mt-5">
        <h2 class="my-4">購物車</h2>
        <div style="margin-top: 20px; text-align: center;">
            <h2>購物車</h2>
        </div>
        <c:if test="${empty cartItems}">
            <div class="alert alert-info">
                您的購物車是空的
            </div>
        </c:if>
        <c:if test="${not empty cartItems}">
            <table class="table">
                <thead>
                    <tr>
                        <th>蛋糕編號</th>
                        <th>蛋糕名稱</th>
                        <th>價格</th>
                        <th>數量</th>
                        <th>小計</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.cakeid}</td>
                            <td>${item.cakename}</td>
                            <td>${item.cakeprice}</td>
                            <td>${item.quantity}</td>
                            <td>${item.cakeprice * item.quantity}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/update-quantity" method="post" class="d-inline">
                                    <input type="hidden" name="cakeId" value="${item.cakeid}">
                                    <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control d-inline w-50">
                                    <button type="submit" class="btn btn-primary btn-sm">更新</button>
                                </form>
                                <form action="${pageContext.request.contextPath}/remove-from-cart" method="post" class="d-inline">
                                    <input type="hidden" name="cakeId" value="${item.cakeid}">
                                    <button type="submit" class="btn btn-danger btn-sm">移除</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-between">
                <form action="${pageContext.request.contextPath}/clear-cart" method="post">
                    <button type="submit" class="btn btn-warning">清空購物車</button>
                </form>
                <h4>總金額: ${totalPrice}</h4>
            </div>
            <div class="mt-3">
                <form action="${pageContext.request.contextPath}/checkout" method="post">
                    <button type="submit" class="btn btn-success">結帳</button>
                </form>
            </div>
        </c:if>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>