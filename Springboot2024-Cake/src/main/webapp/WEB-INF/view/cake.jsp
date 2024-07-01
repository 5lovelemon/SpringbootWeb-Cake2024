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
  <title>CAKE</title>

  <!-- 使用bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">

  <!-- 共用的CSS -->
  <link rel="stylesheet" href="./css/cake.css">
  <link href="images/CAKE2_logo.png" rel="icon" type="image/x-ico">

  <!-- 專屬頁面的CSS -->
  <style>
    /* #sec1 area */
    .carousel,
    .carousel-inner,
    .carousel-item {
      height: 100vh;
    }

    .carousel-item img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
      object-position: center;
      margin-top: 100px;
      /* object-fit 指定元素物件的內容,應如何適應指定的容器 */
      /* cover 保持原有尺寸的比例, 覆蓋所在的容器, 水平邊或垂直邊100%, 另一邊覆蓋超出 */
    }

  </style>

</head>

<body data-bs-spy="scroll" data-bs-target="#navbarMenu" data-bs-offset="0">

  <!-- navbar 一組導覽列 -->
  <!-- navbar-expand-lg 表示 < 991px 轉手機板, 改成 md 表示 < 767px 轉手機板-->
  <!-- navbar-light 配合亮底版面字為黑色, bg-light 是背景顏色,不需要則刪除,都可以改為 dark -->
  <!-- fixed-top 固定畫面為上方 -->
  <!-- header+(section#sec$>2{標題})*5+footer -->
  <header class="navbar navbar-expand-md navbar-dark fixed-top">

    <!-- 限定顯示的區域容器, container-fluid 永遠百分百, 改為 xl -->
    <div class="container-xl">


      <!-- 表現LOGO連結的區域, 可以加上LOGO圖片 -->
      <!-- d-flex 使CAKE文字放在LOGO旁,align-items-center 文字垂直置中 -->
      <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="../images/CAKE2_logo.png" width="80px" alt="CAKE_LOGO">

        <!-- 導覽列LOGO文字, m-0 垂直置中, ms-3 與LOGO有距離 -->
        <h1 class="m-0 ms-2">CAKE</h1>

      </a>


      <!-- 手機版的漢堡圖 (右側下拉式) -->
      <!-- 注意!! data-bs-target="名字必須與可收合部分的ID相同" -->
      <button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
        aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <nav class="collapse navbar-collapse" id="navbarMenu">

        <!-- 文字按鈕選單的部分 -->
        <!-- me-auto 目前代表是margin-right:auto -->
        <!-- ms-auto 目前代表是margin-left:auto -->
        <!-- mb-2 mb-md-0 ps-5 ps-md-0, ps 目前代表是 padding-left -->
        <!-- 0 = 0, 1 = 0.25倍字, 2 = 0.5倍字, 3 = 1個字大小,4 = 1.5倍字, 5 = 3倍字  -->
        <!-- text-center 為手機板 下拉選單文字置中 -->
        <ul class="navbar-nav ms-auto mb-2 text-center">

          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/cake">最新消息</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/product">全部商品</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/shoppingnote">購物須知</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/about">關於我們</a>
          </li>

          <!-- 根據登入狀態顯示不同的連結 -->
    	<c:if test="${empty sessionScope.loggedInUser}">
          <!-- 未登入時顯示登入連結 -->
          <li class="nav-item">
            <a class="nav-link" href="/cname">會員登入</a>
          </li>
          
        </c:if>
        <c:if test="${not empty sessionScope.loggedInUser}">
          <li class="nav-item">
            <a class="nav-link" href="/cart">購物車</a>
          </li>
          
          <!-- 已登入時顯示登出連結 -->
          <li class="nav-item">
            <a class="nav-link" href="/logout">會員登出</a>
          </li>
        </c:if>

		</ul>
      </nav>
      
        
    </div>

  </header>


  <!-- #sec1區域 (最新消息) -->
  <section id="sec1" class="p-0">
    <div id="topSlider" class="carousel slide" data-bs-ride="carousel">

      <!-- 換頁的指示器 -->
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#topSlider" data-bs-slide-to="0" class="active" aria-current="true"
          aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#topSlider" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#topSlider" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>


      <!-- 輪播呈現的內容 -->
      <div class="carousel-inner">
        <div class="carousel-item active">
          <picture> <!-- 由下往上走,手機為先, -->
            <source media="(min-width: 1000px)" srcset="../images/slide1.jpg"> <!-- 電腦 2000*1000  平板-->
            <img src="../images/slide1s.jpg" class="img-fluid" alt="..."> <!-- 手機 -->
          </picture>

        </div>

        <div class="carousel-item">
          <picture>
            <source media="(min-width: 1000px)" srcset="../images/slide2.jpg"> <!-- 電腦 2000*1000  平板-->
            <img src="../images/slide2s.jpg" class="img-fluid" alt="..."> <!-- 手機 -->
          </picture>
        </div>

        <div class="carousel-item">
          <picture>
            <source media="(min-width: 1000px)" srcset="../images/slide3.jpg"> <!-- 電腦 2000*1000  平板-->
            <img src="../images/slide3s.jpg" class="img-fluid" alt="..."> <!-- 手機 -->
          </picture>
        </div>


      </div>


      <!-- 左右方向鍵按鈕 -->
      <button class="carousel-control-prev" type="button" data-bs-target="#topSlider" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>

      <!-- 左右方向鍵按鈕 -->
      <button class="carousel-control-next" type="button" data-bs-target="#topSlider" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

  </section>
	
	
	<section id="sec1">
    <div class="d-none d-md-block text-center" style="color: rgb(245, 85, 119);">
      <h2 style="font-size: 36px" id="mainContent" tabindex="2">
        最新消息
      </h2>
    </div>

    <nav>
      <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
        <button class="nav-link active" id="p1-tab" data-bs-toggle="tab" data-bs-target="#p1" type="button" role="tab"
          aria-controls="p1" aria-selected="true">活動消息</button>
        <button class="nav-link" id="p2-tab" data-bs-toggle="tab" data-bs-target="#p2" type="button" role="tab"
          aria-controls="p2" aria-selected="false">會員公告</button>
      </div>
    </nav>

    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="p1" role="tabpanel" aria-labelledby="p1-tab">
        <div class="container-xl">
          <section class="row">
            <div class="col-12 col-sm-6 col-md-4 p-3" data-no="1">
              <a href="#" data-bs-toggle="modal" data-bs-target="#prodModel1">
                <p class="text-center"></p>
                <img src="../image/newOpen.png" class="d-block mw-100 mx-auto rounded-2 mb-2" data-bs-toggle="modal"
                  data-bs-target="#prodModel1" alt="">
              </a>
            </div>


  <!--   header============
  當桌機版時....那麼進行以下工作
  當window視窗scroll捲動時
  if判斷捲出的範圍是否大於header的高度
  如果是，則header應該......addClass('fixed')
  安排 .fixed得樣式設定 for CSS 提示：position -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script>
  if ($('.navbar-toggler').is(':hidden')) {
    $(window).on('scroll', function () {
      if ($('html').scrollTop() > $('header').innerHeight()) {
        // console.log('yes');
          $('header').addClass('fixed');
     }
      if ($('html').scrollTop() == 0) {
          $('header').removeClass('fixed');
     }
  });
}

</script>

<footer>By Xiao Ya-Fang @ Cake Web</footer>

</body>

</html>