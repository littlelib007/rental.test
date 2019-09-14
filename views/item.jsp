<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<script src="https://kit.fontawesome.com/8835088005.js"></script>
<title>商品ページ</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel.userName}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel.userName}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<title>商品詳細画面</title>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col">
		<div class="wrappr">
			<div class="main ">

			<div class="itemView d-flex mt-5">
				<div class="itemImage ">
					<img src="<c:url value="resources/img/"/>${item.itemFileName}" alt="${item.itemName}"  width="200" height="250"/>
				</div>
				<div class="itemDetail flex-grow-1 ml-4 mr-4">
				<h2 class="mt-2"><c:out value="${item.itemName}" /></h2>
				<div class="itemDetail">
					<div>商品説明</div>
					<p><c:out value="${item.itemDetail}" /></p>
					<div>監督名</div>
					<p><c:out value="${item.directorName}" /></p>
					<div>収録時間</div>
					<p><c:out value="${item.recTime}" />分</p>
					<div>ジャンル</div>
					<p><c:out value="${item.category}" /></p>
					<div>リリース日</div>
					<p><c:out value="${item.release_at}" /></p>
					<div>入荷日</div>
					<p><c:out value="${item.arrival_at}" /></p>
				</div>
					<!-- <a href="rental"><button type="button" class="btn btn-warning text-white justify-content-end mt-3">レンタル確認画面へ</button></a> -->
				<form:form modelAttribute="cartModel" action="/school/cart" method="post">
 					<select name ="amount" name="レンタル数" >
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>枚
					<input type="hidden" name="itemCode" value="${item.itemCode}" ></input>
					<button type="submit" class="btn btn-warning text-white justify-content-end mt-3">カートに入れる</button>
				</form:form>
				</div>
				<div class="recommend flex-grow-1">
					<div class="reco">おすすめ商品</div>
				<ul class="list-group">
					<li class="list-group-item"><a href="item?item=${iModel1.itemCode}">
					<img src="<c:url value="resources/img/"/>${iModel1.itemFileName}" alt=${iModel1.itemName}  width="100" height="125"/></a></li>
					<li class="list-group-item"><a href="item?item=${iModel2.itemCode}">
					<img src="<c:url value="resources/img/"/>${iModel2.itemFileName}" alt=${iModel2.itemName}  width="100" height="125"/></a></li>
					<li class="list-group-item"><a href="item?item=${iModel3.itemCode}">
					<img src="<c:url value="resources/img/"/>${iModel3.itemFileName}" alt=${iModel3.itemName}  width="100" height="125"/></a></li>
				</ul>
				</div>
			</div>

			</div>
	    </div>
	  </div>
	</div>
</div>

<%@ include file="./layouts/footer.jsp"%>