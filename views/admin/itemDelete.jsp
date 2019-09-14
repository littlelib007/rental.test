<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>削除確認</title>
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
<h1>削除</h1>
<hr />
<p>下記の内容を削除します。</p>
<hr />
<form:form>
<table>
	<tr>
		<td>商品コード</td>
		<td><c:out value="${deleteItemData.itemCode}" /></td>
		<td><input type="hidden" value="${deleteItemData.itemCode}" name="itemCode" /></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>商品名</td>
		<td><c:out value="${deleteItemData.itemName}" /></td>
	</tr>
	<tr>
		<td>残り在庫数</td>
		<td><c:out value="${deleteItemData.stock}" /></td>
	</tr>
	<tr>
		<td><input type="submit" class="btn btn-primary" value="削除" name="delete" /></td>
		<td><input type="submit" class="btn btn-primary" value="キャンセル" name="cancel" /></td>
	</tr>
</table>
</form:form>
<p class="error">${errorMessage}</p>
</div>
		</div>
    </div>
  </div>
</div>
<%@ include file="./layouts/footer.jsp"%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>