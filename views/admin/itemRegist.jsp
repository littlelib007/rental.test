<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商品登録</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<style type="text/css">
.error{color:#ff0000;}
</style>
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
<h1>商品登録</h1>
<hr />
<p class="error">${errorMessage}</p>
<form:form modelAttribute="itemModel">
<table>
	<tr>
		<td>商品名</td>
		<td><form:input path="itemName"  size="30" class="form-control"/></td>
		<td><form:errors path="itemName" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>商品イメージ</td>
		<td><form:input path="itemFileName"  size="30" class="form-control"/></td>
		<td><form:errors path="itemFileName" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>商品説明</td>
		<td><form:input path="itemDetail" size="120" class="form-control"/></td>
		<td><form:errors path="itemDetail" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>在庫数</td>
		<td><form:input path="stock"   size="1" class="form-control"/></td>
		<td><form:errors path="stock" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>リリース日</td>
		<td><form:input path="release_at"   size="20" class="form-control"/></td>
		<td><form:errors path="release_at" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>入荷日</td>
		<td><form:input path="arrival_at"   size="20" class="form-control"/></td>
		<td><form:errors path="arrival_at" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>作者</td>
		<td><form:input path="directorName"   size="10" class="form-control"/></td>
		<td><form:errors path="directorName" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>収録時間</td>
		<td><form:input path="recTime"   size="1" class="form-control"/></td>
		<td><form:errors path="recTime" element="div" cssClass="error" /></td>
	</tr>
	<tr>
		<td>カテゴリー</td>
		<td><form:input path="category"   size="10" class="form-control"/></td>
		<td><form:errors path="category" element="div" cssClass="error" /></td>
	</tr>

		<td colspan="2">
			<div align="center"><input type="submit" value="登録確認" name="itemRegistConfirm" class="btn btn-primary"/></div>
		</td>
	</tr>
</table>
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