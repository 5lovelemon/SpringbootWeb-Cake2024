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
    /* #sec2 area */

    /* 系列一設定 */
    .tab-content {
      min-height: 300px;
      background: linear-gradient(var(--c-assist2-01), var(--c-assist2-00) 50%);
      padding: 20px 0 40px; /* 上、左右、下 */
    }

    /* 頁籤底線 */
    .nav-tabs {
      border-bottom: 2px solid var(--c-assist2-03);
    }

    /* 頁籤一般狀態 */
    .nav-tabs .nav-link {
      margin-bottom: -2px;
      border: 2px solid transparent;
      /* border-top-left-radius: .25rem; */
      /* 圓角 */
      /* border-top-right-radius: .25rem; */
      /* 圓角 */
      font-family: var(--f-family-1);
      /* 字體 */
      font-size: 18px;
      /* 文字大小 */
      letter-spacing: 1.5px;
      /* 文字間隔 */
      color: #999;
    }

    /* 頁籤的滑入狀態 */
    .nav-tabs .nav-link:focus,
    .nav-tabs .nav-link:hover {
      border-color: var(--c-assist2-03);
      border-color: transparent;
      /* transparent 透明 */
      font-weight: bold;
      /* 文字加粗 */
      color: #222;
      /* 文字顏色 */
      /* isolation: isolate; */
      /* 圖層混合模式 */
    }

    /* 頁籤的作用中狀態 */
    .nav-tabs .nav-item.show .nav-link,
    .nav-tabs .nav-link.active {
      color: #333;
      background-color: #e1f0ef;
      border-color: var(--c-assist2-03);
      border-bottom: none;
      /* 底線去除 */
      border-bottom-color: #e1f0ef;
    }

    /* 圖片範圍 滑鼠變成手 */
    .tab-content img{
      cursor: pointer;
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
            <a class="nav-link" aria-current="page" href="/cake">最新消息</a>
          </li>

          <li class="nav-item">
            <a class="nav-link active" href="/product">全部商品</a>
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


          <!-- 可以是搜尋用的表單 -->
          <!-- <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form> -->

      </nav>
    </div>

  </header>

  <!-- #sec2區域 (全部蛋糕) -->
  <section id="sec2">
    <h2>全部商品</h2>

    <nav>
      <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
        <button class="nav-link active" id="p1-tab" data-bs-toggle="tab" data-bs-target="#p1" type="button" role="tab"
          aria-controls="p1" aria-selected="true">巧克力系列</button>
        <button class="nav-link" id="p2-tab" data-bs-toggle="tab" data-bs-target="#p2" type="button" role="tab"
          aria-controls="p2" aria-selected="false">草莓系列</button>
        <button class="nav-link" id="p3-tab" data-bs-toggle="tab" data-bs-target="#p3" type="button" role="tab"
          aria-controls="p3" aria-selected="false">抹茶系列</button>
        <button class="nav-link" id="p4-tab" data-bs-toggle="tab" data-bs-target="#p4" type="button" role="tab"
          aria-controls="p4" aria-selected="false">芒果系列</button>
      </div>
    </nav>

    <div class="tab-content" id="nav-tabContent">

      <div class="tab-pane fade show active" id="p1" role="tabpanel" aria-labelledby="p1-tab">
        
        <div class="container-xl">
          <div class="row" data-prod-class="巧克力系列">

            <!-- d-block 文字一定下去,w-100縮小 一定百分百, mw-100 最大寬度百分百 -->
            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal1">
              <img src="../images/sea1.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="榛果巧克力">
              <p class="text-center">榛果巧克力</p>
            </div>


            <div class="modal fade" id="prodModal1" tabindex="-1" aria-labelledby="prodModal1Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal1Label">榛果巧克力</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea1.jpg" class="img-fluid rounded" alt="榛果巧克力">
                      </div>
                      <div class="col-md-6">
                    <p><strong>蛋糕編號：</strong> 01</p>
                    <p><strong>蛋糕名字：</strong> 榛果巧克力</p>
                    <p><strong>蛋糕價格：</strong> $150</p>
                    <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      <input type="hidden" name="cakeId" value="1"> <!-- 設置正確 商品cakeId -->
                      <div class="mb-3">
                        <label for="quantity1" class="form-label">蛋糕數量：</label>
                        <input type="number" class="form-control" id="quantity1" name="quantity" value="1" min="1">
                      </div>
                      <button type="submit" class="btn btn-primary">加入購物車</button>
                    </form>
                  </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal2"> <!-- prodModal? 要改數字  -->
              <img src="../images/sea2.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="告白愛情">
              <p class="text-center">告白愛情</p>
            </div>
            <!-- prodModal? 要改數字  -->
            <div class="modal fade" id="prodModal2" tabindex="-1" aria-labelledby="prodModal2Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal2Label">告白愛情</h5> <!-- prodModal?Label 要改數字  -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea2.jpg" class="img-fluid rounded" alt="告白愛情">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 02</p>
                        <p><strong>蛋糕名字：</strong> 告白愛情</p>
                        <p><strong>蛋糕價格：</strong> $150</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      		<input type="hidden" name="cakeId" value="2"> <!-- 設置正確 商品cakeId -->
                      	<div class="mb-3">
                        	<label for="quantity2" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity2" name="quantity" value="1" min="1">
                      	</div>
                      	<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal3">
              <img src="../images/sea3.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="醇濃巧克力蛋糕">
              <p class="text-center">醇濃巧克力蛋糕</p>
            </div>
            
            <div class="modal fade" id="prodModal3" tabindex="-1" aria-labelledby="prodModal3Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal3Label">醇濃巧克力蛋糕</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea3.jpg" class="img-fluid rounded" alt="醇濃巧克力蛋糕">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 03</p>
                        <p><strong>蛋糕名字：</strong> 醇濃巧克力蛋糕</p>
                        <p><strong>蛋糕價格：</strong> $100</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="3"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity3" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity3" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		
		
			<div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal4">
              <img src="../images/sea4.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="法芙娜焦焦">
              <p class="text-center">法芙娜焦焦</p>
            </div>
            
            <div class="modal fade" id="prodModal4" tabindex="-1" aria-labelledby="prodModal4Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal4Label">法芙娜焦焦</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea4.jpg" class="img-fluid rounded" alt="法芙娜焦焦">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 04</p>
                        <p><strong>蛋糕名字：</strong> 法芙娜焦焦</p>
                        <p><strong>蛋糕價格：</strong> $100</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="4"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity4" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity4" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

		
			<div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal5">
              <img src="../images/sea5.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="費列羅巧克力蛋糕">
              <p class="text-center">費列羅巧克力蛋糕</p>
            </div>
            
            <div class="modal fade" id="prodModal5" tabindex="-1" aria-labelledby="prodModal5Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal5Label">費列羅巧克力蛋糕</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea5.jpg" class="img-fluid rounded" alt="費列羅巧克力蛋糕">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 05</p>
                        <p><strong>蛋糕名字：</strong> 費列羅巧克力蛋糕</p>
                        <p><strong>蛋糕價格：</strong> $100</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="5"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity5" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity5" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal6">
              <img src="../images/sea6.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="濃巧克力天使蛋糕">
              <p class="text-center">濃巧克力天使蛋糕</p>
            </div>
            
            <div class="modal fade" id="prodModal6" tabindex="-1" aria-labelledby="prodModal6Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal6Label">濃巧克力天使蛋糕</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea6.jpg" class="img-fluid rounded" alt="濃巧克力天使蛋糕">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 06</p>
                        <p><strong>蛋糕名字：</strong> 濃巧克力天使蛋糕</p>
                        <p><strong>蛋糕價格：</strong> $150</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="6"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity6" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity6" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

			
			<div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal7">
              <img src="../images/sea7.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="巧克力芝士蛋糕">
              <p class="text-center">巧克力芝士蛋糕</p>
            </div>
            
            <div class="modal fade" id="prodModal7" tabindex="-1" aria-labelledby="prodModal7Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal7Label">巧克力芝士蛋糕</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea7.jpg" class="img-fluid rounded" alt="巧克力芝士蛋糕">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 07</p>
                        <p><strong>蛋糕名字：</strong> 巧克力芝士蛋糕</p>
                        <p><strong>蛋糕價格：</strong> $150</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="7"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity7" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity7" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal8">
              <img src="../images/sea8.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="提拉米蘇">
              <p class="text-center">提拉米蘇</p>
            </div>
            
            <div class="modal fade" id="prodModal8" tabindex="-1" aria-labelledby="prodModal8Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal8Label">提拉米蘇</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea8.jpg" class="img-fluid rounded" alt="提拉米蘇">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 08</p>
                        <p><strong>蛋糕名字：</strong> 提拉米蘇</p>
                        <p><strong>蛋糕價格：</strong> $150</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="8"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity8" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity8" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal9">
              <img src="../images/sea9.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="比利時巧克力蛋糕">
              <p class="text-center">比利時巧克力蛋糕</p>
            </div>
            
            <div class="modal fade" id="prodModal9" tabindex="-1" aria-labelledby="prodModal9Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal9Label">比利時巧克力蛋糕</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sea9.jpg" class="img-fluid rounded" alt="比利時巧克力蛋糕">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 09</p>
                        <p><strong>蛋糕名字：</strong> 比利時巧克力蛋糕</p>
                        <p><strong>蛋糕價格：</strong> $150</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="9"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity9" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity9" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>

      </div>

      <div class="tab-pane fade" id="p2" role="tabpanel" aria-labelledby="p2-tab">

        <div class="container-xl">
          <div class="row" data-prod-class="草莓系列">

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal11">
              <img src="../images/seb1.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="甜蜜約定">
              <p class="text-center">甜蜜約定</p>
            </div>
            
            <div class="modal fade" id="prodModal11" tabindex="-1" aria-labelledby="prodModal11Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal11Label">甜蜜約定</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/seb1.jpg" class="img-fluid rounded" alt="甜蜜約定">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 11</p>
                        <p><strong>蛋糕名字：</strong> 甜蜜約定</p>
                        <p><strong>蛋糕價格：</strong> $200</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="11"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity11" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity11" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal12">
              <img src="../images/seb2.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="草莓慕斯">
              <p class="text-center">草莓慕斯</p>
            </div>
            
            <div class="modal fade" id="prodModal12" tabindex="-1" aria-labelledby="prodModal12Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal12Label">草莓慕斯</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/seb2.jpg" class="img-fluid rounded" alt="草莓慕斯">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 12</p>
                        <p><strong>蛋糕名字：</strong> 草莓慕斯</p>
                        <p><strong>蛋糕價格：</strong> $160</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="12"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity12" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity12" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal13">
              <img src="../images/seb3.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="草莓乳酪慕斯">
              <p class="text-center">草莓乳酪慕斯</p>
            </div>
            
            <div class="modal fade" id="prodModal13" tabindex="-1" aria-labelledby="prodModal13Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal13Label">草莓乳酪慕斯</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/seb3.jpg" class="img-fluid rounded" alt="草莓乳酪慕斯">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 13</p>
                        <p><strong>蛋糕名字：</strong> 草莓乳酪慕斯</p>
                        <p><strong>蛋糕價格：</strong> $160</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="13"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity13" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity13" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal14">
              <img src="../images/seb4.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="草莓甜馨">
              <p class="text-center">草莓甜馨</p>
            </div>
            
            <div class="modal fade" id="prodModal14" tabindex="-1" aria-labelledby="prodModal14Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal14Label">草莓甜馨</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/seb4.jpg" class="img-fluid rounded" alt="草莓甜馨">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 14</p>
                        <p><strong>蛋糕名字：</strong> 草莓甜馨</p>
                        <p><strong>蛋糕價格：</strong> $160</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="14"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity14" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity14" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

          </div>
        </div>

      </div>

      <div class="tab-pane fade" id="p3" role="tabpanel" aria-labelledby="p3-tab">
      
        <div class="container-xl">
          <div class="row" data-prod-class="抹茶系列">

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal21">
              <img src="../images/sec1.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="抹茶千層蛋糕">
              <p class="text-center">抹茶千層蛋糕</p>
            </div>
            
            <div class="modal fade" id="prodModal21" tabindex="-1" aria-labelledby="prodModal21Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal21Label">抹茶千層蛋糕</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sec1.jpg" class="img-fluid rounded" alt="抹茶千層蛋糕">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 21</p>
                        <p><strong>蛋糕名字：</strong> 抹茶千層蛋糕</p>
                        <p><strong>蛋糕價格：</strong> $180</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="21"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity21" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity21" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal22">
              <img src="../images/sec2.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="抹茶四重奏">
              <p class="text-center">抹茶四重奏</p>
            </div>
            
            <div class="modal fade" id="prodModal22" tabindex="-1" aria-labelledby="prodModal22Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal22Label">抹茶四重奏</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sec2.jpg" class="img-fluid rounded" alt="抹茶四重奏">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 22</p>
                        <p><strong>蛋糕名字：</strong> 抹茶四重奏</p>
                        <p><strong>蛋糕價格：</strong> $180</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="22"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity22" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity22" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
         </div>
        </div>     

            

	 <div class="tab-pane fade" id="p4" role="tabpanel" aria-labelledby="p4-tab">
	 
        <div class="container-xl">
          <div class="row" data-prod-class="芒果系列">

            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal31">
              <img src="../images/sed1.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="芒果蛋糕">
              <p class="text-center">芒果蛋糕</p>
            </div>
            
            <div class="modal fade" id="prodModal31" tabindex="-1" aria-labelledby="prodModal31Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal31Label">芒果蛋糕</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sed1.jpg" class="img-fluid rounded" alt="芒果蛋糕">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 31</p>
                        <p><strong>蛋糕名字：</strong> 芒果蛋糕</p>
                        <p><strong>蛋糕價格：</strong> $180</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="31"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity31" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity31" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal32">
              <img src="../images/sed2.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="芒果起司慕斯">
              <p class="text-center">芒果起司慕斯</p>
            </div>
            
            <div class="modal fade" id="prodModal32" tabindex="-1" aria-labelledby="prodModal32Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal32Label">芒果起司慕斯</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sed2.jpg" class="img-fluid rounded" alt="芒果起司慕斯">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 32</p>
                        <p><strong>蛋糕名字：</strong> 芒果起司慕斯</p>
                        <p><strong>蛋糕價格：</strong> $180</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="32"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity32" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity32" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="col-12 com-sm-6 col-md-3 p-4" data-bs-toggle="modal" data-bs-target="#prodModal33">
              <img src="../images/sed3.jpg" class="d-block mw-100 mx-auto rounded mb-2" alt="香橙芒果">
              <p class="text-center">香橙芒果</p>
            </div>
            
            <div class="modal fade" id="prodModal33" tabindex="-1" aria-labelledby="prodModal33Label" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="prodModal33Label">香橙芒果</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col-md-6">
                        <img src="../images/sed3.jpg" class="img-fluid rounded" alt="香橙芒果">
                      </div>
                      <div class="col-md-6">
                        <p><strong>蛋糕編號：</strong> 33</p>
                        <p><strong>蛋糕名字：</strong> 香橙芒果</p>
                        <p><strong>蛋糕價格：</strong> $150</p>
                        <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
                      			<input type="hidden" name="cakeId" value="33"> <!-- 設置正確 商品cakeId -->
                      		<div class="mb-3">
                        	<label for="quantity33" class="form-label">蛋糕數量：</label>
                        	<input type="number" class="form-control" id="quantity33" name="quantity" value="1" min="1">
                      		</div>
                      		<button type="submit" class="btn btn-primary">加入購物車</button>
                    	</form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
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

  <footer>
    
  </footer>

  <!-- Button trigger modal -->
  <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#prodModal">
    Launch demo modal
  </button> --> 

<!-- Modal --> 
<!-- prodModal 介紹商品 -->
<!-- fade 淡入淡出 -->
<div class="modal fade" id="prodModal" tabindex="-1" aria-labelledby="prodModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl"> 
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="prodModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        ...
      </div>
      
    </div>
  </div>
</div>

<footer>By Xiao Ya-Fang @ Cake Web</footer>

</body>

</html>