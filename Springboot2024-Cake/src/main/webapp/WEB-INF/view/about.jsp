<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  <title>CAKE</title>

  <!-- 使用bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">

  <!-- 共用的CSS -->
  <link rel="stylesheet" href="./cake.css">

  <!-- 專屬頁面的CSS -->
  <style>
    /* #sec4 area */
    /* 上 右 下 左 */
    p {
      padding: 3px 0px 0px 0px;
      letter-spacing: 1px;
    }

    .map-info-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 20px;
    }

    .map {
      width: 100%;
      max-width: 800px;
      border: 2px solid #69aceb;
      margin-bottom: 20px;
    }

    .map iframe {
      display: block;
      width: 100%;
      height: 400px; /* 手机板高度 */
      border: none;
    }

    .info {
      text-align: center;
      padding: 10px;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px; /* 调整这个值以增加标题和内容之间的间距 */
    }

    @media (min-width: 768px) {
      .map iframe {
        height: 600px; /* 桌面版高度 */
      }
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
        <img src="./images/CAKE2_logo.png" width="80px" alt="CAKE_LOGO">

        <!-- 導覽列LOGO文字, m-0 垂直置中, ms-3 與LOGO有距離 -->
        <h1 class="m-0 ms-2">CAKE</h1>
      </a>

      <!-- 手機版的漢堡圖 -->
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

          <!-- 根据登录状态显示不同的链接 -->
    	<c:if test="${empty sessionScope.loggedInUser}">
          <!-- 未登录时显示登录链接 -->
          <li class="nav-item">
            <a class="nav-link" href="/cname">登入</a>
          </li>
          
        </c:if>
        <c:if test="${not empty sessionScope.loggedInUser}">
          <li class="nav-item">
            <a class="nav-link" href="/cart">購物車</a>
          </li>
          
          <!-- 已登录时显示登出链接 -->
          <li class="nav-item">
            <a class="nav-link" href="/logout">登出</a>
          </li>
        </c:if>

		</ul>
      </nav>
    </div>

  </header>

  <!-- #sec4區域 (購物須知) -->
  <section id="sec3">
    <h2>關於我們</h2>
    <div class="container map-info-container">
      <div class="map">
        <!-- Google地圖嵌入代碼 -->
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.0413704224956!2d121.46201311536102!3d25.0110733440945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34681f0e25fbf793%3A0x9e0b1e404ec708a0!2z5paw5YyX5biC5Y2A5ZyL5qiC6LOH5Y2A6KGTMjPomZ8!5e0!3m2!1szh-TW!2stw!4v1627193742071!5m2!1szh-TW!2stw" allowfullscreen="" loading="lazy"></iframe>
      </div>
      <div class="info">
        <p><strong>門市地址:</strong> 新北市板橋區忠孝路23號1樓</p>
        <p><strong>營業時間:</strong> 周一至周日 08:00-21:00</p>
        <p><strong>門市電話:</strong> (02) 1234-5678</p>
        <p><strong>客服電話:</strong> (02) 9876-5432</p>
      </div>
    </div>
  </section>

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

  <footer>
  </footer>

</body>

</html>
