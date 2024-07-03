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
  <link rel="stylesheet" href="./css/each.css">

  <!-- 專屬頁面的CSS -->
  <style>
    /* #sec4 area */
    /* 上 右 下 左*/
    p {
      padding:  3px 0px 0px 30px;
      letter-spacing: 1px;
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

	  <!-- 導覽選單 -->
      <nav class="collapse navbar-collapse" id="navbarMenu">

        <!-- 文字按鈕選單的部分 -->
        <!-- me-auto 目前代表是margin-right:auto -->
        <!-- ms-auto 目前代表是margin-left:auto -->
        <!-- mb-2 mb-md-0 ps-5 ps-md-0, ps 目前代表是 padding-left -->
        <!-- 0 = 0, 1 = 0.25倍字, 2 = 0.5倍字, 3 = 1個字大小,4 = 1.5倍字, 5 = 3倍字  -->
        <!-- text-center 為手機板 下拉選單文字置中 -->
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


  <!-- #sec4區域 (購物須知) -->
  <section id="sec3">
    <h2>購物須知</h2>
    <div class="container-xl">
      <div class="row">
        <div class="col-12 col-md-16">

          <h3>蛋糕購物須知</h3>

          <div class="accordion accordion-flush" id="accordionQA">

            <div class="accordion-item">
              <h3 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapse1" aria-expanded="false" aria-controls="flush-collapse1">
                  訂購注意事項
                </button>
              </h3>

              <!-- 控制名稱 flush-collapse1 -->
              <div id="flush-collapse1" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
              data-bs-parent="#accordionQA">
                
                <p>1.訂購流程：<br>線上挑選您喜歡的商品→ 放入購物車→ 完成付款→ 製作生產→ 出貨 <br>商品皆為新鮮製作，訂單『完成付款』後才算成立，正式進入生產製作流程。</p>
                <p>2.提醒您，在按下『確認訂購』前，請再次確認商品口味、數量、總金額是否正確。</p>
                <p>3.如需查詢單狀態，請至『會員中心』→『訂單查詢』查詢。</p>
                <p>4.請務必選擇"配送日期"(即到貨日期)，如您無法選擇配送日期，系統會自動選擇最快到貨日，如無法選擇日期則代表該日期無法到貨。</p>
                <p>5.由於星期天黑貓宅急便沒有收送貨的服務，所以我們日、一兩天都會無法配送，還請您見諒!!</p>
                <p>6.您會收到出貨通知是因為我們會將黑貓託運單號列印下來以利作業，但是黑貓後台會直接顯示已出貨(此為黑貓系統問題，我們無法更改)。</p>
                <p>7.出貨通知表示已您的訂單進入排單流程，非實際出貨日，實際出貨日為您選定的配送日期前一天。</p>
              </div>
            </div>

            <div class="accordion-item">
              <h3 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapse2" aria-expanded="false" aria-controls="flush-collapse2">
                  商品食用、保鮮與保存說明
                </button>
              </h3>

              <!-- 控制名稱 flush-collapse2 -->
              <div id="flush-collapse2" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                data-bs-parent="#accordionQA">
                <p>1.蛋糕商品均為新鮮製作生產，含有新鮮水果之商品，建議於當日內食用完畢風味較佳。</p>
                <p>2.未食用完畢之商品請妥善存放於封閉的蛋糕盒內，避免因冰箱冷藏空氣帶走蛋糕水分，影響甜點口感。</p>
                <p>3.產品的保存方式與期限請詳見包裝盒面標示，新鮮享用美味不流失。</p>
              </div>
            </div>

            <div class="accordion-item">
              <h3 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapse3" aria-expanded="false" aria-controls="flush-collapse3">
                  配送服務相關注意事項
                </button>
              </h3>

              <!-- 控制名稱 flush-collapse3 -->
              <div id="flush-collapse3" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                data-bs-parent="#accordionQA">
                <p>1.蛋糕秉持新鮮生產安心出貨原則，若於運送過程中，因路面狀況導致位移(3~5cm)、變形或盒內四周沾到奶油/裝飾品，水果、巧克力裝飾片脫落等不可抗拒之情況，恕不在退貨及退款之範圍。</p>
                <p>2.配送方式：<br>全程採用黑貓冷凍宅配。</p>
                <p>3.配送時間：<br>物流無法指定時間，配送時段僅為希望時段，上午時段有可能延遲至下午送達，下午時段有可能提前送達，不便之處還請您見諒!!</p>
                <p>4.訂單成立後，您可於『會員中心→ 訂單查詢→ 查看詳情』中查詢『出貨資料』隨時追蹤物流出貨狀態。</p>
              </div>
            </div>

            <div class="accordion-item">
              <h3 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapse4" aria-expanded="false" aria-controls="flush-collapse4">
                  貨故退換貨說明
                </button>
              </h3>

              <!-- 控制名稱 flush-collapse4 -->
              <div id="flush-collapse4" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                data-bs-parent="#accordionQA">
                <p>1.如遇商品有重大瑕疵、到貨毀損、數量及品項與訂購不符須辦理退換貨者，請維持商品及包裝的完整，不接受部分退貨，請將收到之全數包裝與配件，於24小時內辦理退款，逾期恕無法受理。</p>
                <p>2.缺件、口味錯誤、商品毀損等，請保持商品、數量及包裝的完整，請先協助拍照存證，並連繫線上客服。</p>
                <p>3.線上客服服務時間:星期一至星期五AM09:30-PM05:30。</p>
              </div>
            </div>

            <div class="accordion-item">
              <h3 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapse5" aria-expanded="false" aria-controls="flush-collapse5">
                  線上付款方式
                </button>
              </h3>

              <!-- 控制名稱 flush-collapse5 -->
              <div id="flush-collapse5" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                data-bs-parent="#accordionQA">
                <p>1.信用卡付款(可接受VISA、JBC、MasterCard)。</p>
                <p>2.ATM轉帳付款。</p>
              </div>
            </div>

<!--             <div class="accordion-item">
              <h3 class="accordion-header" id="flush-headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#flush-collapse6" aria-expanded="false" aria-controls="flush-collapse6">
                  Accordion Item #1
                </button>
              </h3>

              控制名稱 flush-collapse6
              <div id="flush-collapse6" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                data-bs-parent="#accordionQA">
                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the
                  <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
              </div>
            </div> -->

          </div>

        </div>
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

<footer>By Xiao Ya-Fang @ Cake Web</footer>

</body>

</html>