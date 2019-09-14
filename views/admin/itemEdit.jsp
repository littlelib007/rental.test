<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商品変更画面</title>
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
<h1>商品変更画面</h1>
<form:form modelAttribute="itemModel" >
<hr />
<p class="errors">${errorMessage}</p>
<div class="form-group">
<table>
	<tr>
		<td>商品コード</td>
		<td><c:out value="${itemModel.itemCode}" /></td>
		<td><input type="hidden" value="${itemModel.itemCode}" name="itemCode" /></td>
	</tr>
	<tr>
		<td>商品名</td>
		<td><form:input path="itemName" class="form-control"/></td>
	</tr>
	<tr>
		<td>商品イメージ</td>
		<td><form:input path="itemFileName" value="1.jpg" class="form-control"/></td>
	</tr>
	<tr>
		<td>商品説明</td>
		<td><form:input path="itemDetail"  class="form-control"/></td>
	</tr>
	<tr>
		<td>在庫数</td>
		<td><form:input path="stock"  class="form-control"/></td>
	</tr>
	<tr>
		<td>リリース日</td>
		<td><form:input path="release_at"  class="form-control"/></td>
	</tr>
	<tr>
		<td>入荷日</td>
		<td><form:input path="arrival_at"  class="form-control"/></td>
	</tr>
	<tr>
		<td>作者</td>
		<td><form:input path="directorName"  class="form-control"/></td>
	</tr>
	<tr>
		<td>recTime</td>
		<td><form:input path="recTime"  class="form-control"/></td>
	</tr>
	<tr>
		<td>カテゴリー</td>
		<td><form:input path="category"  class="form-control"/></td>
	</tr>
	<tr>
		<td align="center"><input type="submit" class="btn btn-primary" value="確定" name="edit" /></td>
		<td align="center"><input type="submit" class="btn btn-primary" value="キャンセル" name="cancel" /></td>
</tr>
</table>
</div>
</form:form>
</div>
		</div>
    </div>
  </div>
</div>
<%@ include file="./layouts/footer.jsp"%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>