<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta charset="UTF-8">
  <title>訂單清單</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
</head>

<body>
  <div class="container">
    <h2 class="my-4">訂單清單</h2>
    <c:forEach var="order" items="${orders}">
      <div class="card mb-3">
        <div class="card-header">
          訂單編號: ${order.id} | 訂單時間: ${order.created_at} | 總金額: ${order.total}
        </div>
        <div class="card-body">
          <table class="table">
            <thead>
              <tr>
                <th>蛋糕名稱</th>
                <th>數量</th>
                <th>小計</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${order.items}">
                <tr>
                  <td>${item.cakename}</td>
                  <td>${item.quantity}</td>
                  <td>${item.subtotal}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </c:forEach>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>