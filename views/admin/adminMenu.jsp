<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ 	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>従業員メニュー</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
</head>
<body>
<%@ include file="./layouts/header.jsp"%>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-3 bg-info">
    	<%@ include file="./layouts/sideMenu.jsp"%>
    </div>
    <div class="col">
		<div class="wrappr">
			<div class="main">
<div class="d-flex">
<div class="card" style="width: 18rem; height:200px; margin:10px;">
  <div class="card-body text-center align-middle">
    <h5 class="card-title  font-weight-bold">総会員数</h5>
    <p class="card-text" style="font-size:50px;">${userCount }名</p>

  </div>
</div>
<div class="card" style="width: 18rem; height:200px; margin:10px;">
  <div class="card-body text-center align-middle">
    <h5 class="card-title  font-weight-bold">総商品数</h5>
    <p class="card-text" style="font-size:50px;">${itemCount}点</p>

  </div>
</div>
<div class="card" style="width: 18rem; height:200px; margin:10px;">
  <div class="card-body text-center align-middle">
    <h5 class="card-title  font-weight-bold">総レンタル数</h5>
    <p class="card-text" style="font-size:50px;">${recodeCount}回</p>

  </div>
</div>
</div>
			</div>
		</div>
    </div>
  </div>
</div>
<%@ include file="./layouts/footer.jsp"%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>