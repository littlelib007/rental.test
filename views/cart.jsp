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
<title>カート</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel.userName}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel.userName}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>


<div class="container">

<div class="p-3">

		<form:form action="/school/rental">
		<table class="table">
			<tr>
				<th scope="col">商品コード</th>
				<th scope="col">商品名</th>
				<th scope="col">枚数</th>
				<th scope="col"></th>
			</tr>
			<c:forEach var="item" items="${cart}">
				<tr>
					<td scope="row"><c:out value="${item.itemCode}" /></td>
					<td><c:out value="${item.itemName}" /></td>
					<td><c:out value="${item.amount}" /></td>
					<td><a href="/school/cancel?itemCode=${item.itemCode}">取消</a></td>
				</tr>
			</c:forEach>

			</table>
			<p>${message }</p>
			<p>レンタル期間　　${returnFrom} ～ ${returnLimit}</p>
			<div class="pb-3"><button type="submit" class="btn btn-warning text-white float-right">レンタル</button></div>
		</form:form>
		 <c:if test="${cart.size() > 0}"><p><a href="item?item=${itemModel.itemCode}">商品画面へ戻る</a></p></c:if>
</div>

</div>
<%@ include file="./layouts/footer.jsp"%>