<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h2>顧客情報管理</h2>
			<p>${message}</p>
			<table class="table">
				<form:form modelAttribute="userModel">
				<tr>
					<th scope="col">状態</th>
					<th scope="col">ユーザー名</th>
					<th scope="col">プラン</th>
					<th scope="col">入会日</th>
					<th scope="col"></th>
				</tr>
				<c:forEach var ="user"  items="${userList}">
					<tr>
						<c:choose>
							<c:when test="${user.activeFlag == true }">
								<td><span class="badge badge-success">有効</span></td>
						  	</c:when>
							<c:when test="${user.activeFlag == false}">
								<td><span class="badge badge-danger">退会済</span></td>
						  	</c:when>
						  	  <c:otherwise>
							   <td> 無料会員</td>
							  </c:otherwise>
						</c:choose>
						<td>${user.userName}</td>
						<td>${user.plan}</td>
						<td>${user.created_at}</td>
						<td>
						<c:choose>
							<c:when test="${user.activeFlag == true }">
								<a class="btn btn-primary" href="quit?userId=${user.userId}">退会</a>
						  	</c:when>
							<c:when test="${user.activeFlag == false}">
								<button class="btn btn-primary disabled" disabled="disabled">退会</button>
						  	</c:when>
						</c:choose>
						<c:if test="${user.activeFlag == false}">

						</c:if>
						</td>
					</tr>
				</c:forEach>
				</form:form>
			</table>
			</div>
		</div>
    </div>
  </div>
</div>
<%@ include file="./layouts/footer.jsp"%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>