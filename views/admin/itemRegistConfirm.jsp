<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>商品登録確認</title>
</head>
<body>
<h1>商品登録確認</h1>
<hr />
<p class="error">${errorMessage}</p>
<form:form modelAttribute="itemModel">
<table>
	<tr>
		<td>商品名</td><td>${itemModel.itemName}</td>
	</tr>
	<tr>
		<td>商品説明</td><td>${itemModel.itemDetail}</td>
	</tr>
	<tr>
		<td>商品イメージ</td><td>${itemModel.itemFileName}</td>
	</tr>
	<tr>
		<td>在庫数</td><td>${itemModel.stock}</td>
	</tr>
	<tr>
		<td>リリース日</td><td>${itemModel.release_at}</td>
	</tr>
	<tr>
		<td>入荷日</td><td>${itemModel.arrival_at}</td>
	</tr>
	<tr>
		<td><input type="submit" value="登録" name="regist"  /></td>
		<td><input type="submit" value="戻る" name="back"  /></td>
	</tr>
</table>
</form:form>
</body>
</html>