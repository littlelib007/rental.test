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
				<h2>在庫管理</h2>

			<p>${message}</p>
			<div class="clearfix align-middle">
				<form:form modelAttribute="itemModel" class="form-inline p-2 float-left">
				  <div class="form-group ">
					<form:input path="itemName" class="form-control"/>
					<button type="submit" class="btn btn-primary" name="search">検索</button>
					<form:errors path="*" element="div" cssClass="error" />
				  </div>
				</form:form>
				<div class="float-right"style="margin-top: 10px;">
				<a href ="/school/admin/itemList/new" class="btn btn-warning text-white  ">新規登録</a>
				</div>

			</div>
			<table class="table mt-1">
				<tr>
					<th scope="col">商品一覧</th>
					<th scope="col">在庫数</th>
					<th scope="col">リリース日</th>
					<th scope="col">入荷日</th>
					<th scope="col">ステータス</th>
					<th scope="col">変更</th>
					<th scope="col">削除</th>
					<th scope="col"></th>
				</tr>
		<form:form modelAttribute="itemModel" >

			<c:forEach var="item" items="${itemList}" >
				<tr>
					<td ><c:out value="${item.itemName}" /></td>
					<td ><c:out value="${item.stock}" /></td>
					<td ><c:out value="${item.release_at}" /></td>
					<td ><c:out value="${item.arrival_at }" /></td>
					<c:choose>
						<c:when test="${item.status == 1 }">
							<td><span class="badge badge-success">在庫あり</span></td>
					  	</c:when>
						<c:when test="${item.status == 2}">
							<td><span class="badge badge-danger">削除</span></td>
					  	</c:when>
						<c:when test="${item.status == 3}">
							<td><span class="badge badge-warning">新作</span></td>
					  	</c:when>
						<c:when test="${item.status == 4}">
							<td><span class="badge badge-primary">新入荷</span></td>
					  	</c:when>
					  	  <c:otherwise>
						   <td> 無料会員</td>
						  </c:otherwise>
					</c:choose>
					<td class="d-flex">
						<a class="btn btn-warning text-white " href="edit?paramId=${item.itemCode}" style="margin-right: 2px;">変更</a>
						<a class="btn btn-primary " href="delete?paramId=${item.itemCode}">削除</a>
					</td>
				</tr>
			</c:forEach>
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