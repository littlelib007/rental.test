<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ 	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<script src="https://kit.fontawesome.com/8835088005.js"></script>
<title>トップページ</title>
</head>
<body>
<header class="h-50 bg-info clearfix ">
	<a href="/school"><div class="float-left logo">TeamBレンタルサイト</div></a>
	<div class="m-1 float-right">
		<a href="user"><button type="button" class="btn btn-warning text-white justify-content-end">ログイン</button></a>
		<a href="userRegist"><button type="button" class="btn btn-primary text-white justify-content-end">会員登録</button></a>
	</div>
</header>

<div class="container">
	<div align="center">
		<form:form modelAttribute="itemModel" class="form-inline m-3">
		  <div class="form-group">
			<form:input path="itemName" size="50" class="form-control"/>
			<button type="submit" class="btn btn-primary">検索</button>
			<form:errors path="*" element="div" cssClass="error" />
		  </div>
		</form:form>
	</div>
	<h1>商品一覧</h1>
	<table class="table">
	<tr>
		<th scope="col">商品コード</th>
		<th scope="col">商品名</th>
		<th scope="col">商品説明</th>
		<th scope="col">在庫数</th>
		<th scope="col">リリース日</th>
		<th scope="col">入荷日</th>
	</tr>
	<c:forEach var="itm" items="${itemList}">
	<tr>
		<c:if test="${itm.status == 1}">
		<td scope="row"><c:out value="${itm.itemCode}"></c:out></td>
		<td><a href="/school/item?item=${itm.itemCode}"><c:out value="${itm.itemName}"></c:out></a></td>
		<td><c:out value="${itm.itemDetail}"></c:out></td>
		<td><c:out value="${itm.stock}"></c:out></td>
		<td><c:out value="${itm.release_at}"></c:out></td>
		<td><c:out value="${itm.arrival_at}"></c:out></td>
		</c:if>
	</tr>
	</c:forEach>
	</table>
	<h2>新作</h2>
	<table class="table">
	<tr>
		<th scope="col">商品コード</th>
		<th scope="col">商品名</th>
		<th scope="col">商品説明</th>
		<th scope="col">在庫数</th>
		<th scope="col">リリース日</th>
		<th scope="col">入荷日</th>
	</tr>
	<c:forEach var="itm" items="${itemList}">
	<tr>
	<c:if test="${itm.status == 3}">
	<!-- 新作リスト -->
		<td scope="row"><c:out value="${itm.itemCode}"></c:out></td>
		<td><a href="/school/item?item=${itm.itemCode}"><c:out value="${itm.itemName}"></c:out></a></td>
		<td><c:out value="${itm.itemDetail}"></c:out></td>
		<td><c:out value="${itm.stock}"></c:out></td>
		<td><c:out value="${itm.release_at}"></c:out></td>
		<td><c:out value="${itm.arrival_at}"></c:out></td>
	</c:if>
	</tr>
	</c:forEach>
	</table>
</div>
<%@ include file="./layouts/footer.jsp"%>
