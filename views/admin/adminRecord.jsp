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
			<h2>履歴管理</h2>
			<p>${message}</p>
			<form:form modelAttribute="recodeModel" class="form-inline m-3">
			  <div class="form-group w-50">
				<form:input path="userName" size="50" class="form-control"/>
				<button type="submit" class="btn btn-primary" name="kensaku">検索</button>
				<form:errors path="*" element="div" cssClass="error" />
			  </div>
			</form:form>
			<table class="table">
				<form:form modelAttribute="userModel">
				<tr>
<!-- 					<th scope="col">会員状態</th> -->
<!-- 					<th scope="col">配送状態</th> -->
					<th scope="col">ユーザー名</th>
					<th scope="col">作品名</th>
					<th scope="col">枚数</th>
					<th scope="col">貸出日</th>
					<th scope="col">返却予定日</th>
					<th scope="col"></th>
				</tr>
				<c:forEach var ="recode"  items="${recodeList}">
					<tr>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${recode.status == 1 }"> --%>
<!-- 								<td><span class="badge badge-success">発送</span></td> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${recode.status == 2 }"> --%>
<!-- 								<td><span class="badge badge-success">返却</span></td> -->
<%-- 							</c:when> --%>
<%-- 							<c:when test="${recode.status == 3 }"> --%>
<!-- 								<td><span class="badge badge-success">不良品</span></td> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<td><span class="badge badge-success">その他</span></td> -->
<%-- 							</c:otherwise> --%>
<%-- 							</c:choose> --%>
						<td>${(recode.user).userName}</td>
						<td>${(recode.item).itemName}</td>
						<td>${recode.amount}</td>
						<td>${recode.rental_at}</td>
						<td>${recode.return_at}</td>
						<td>
						<c:choose>
							<c:when test="${user.activeFlag == true }">
								<a class="btn btn-primary" href="quit?userId=${user.userId}">退会</a>
						  	</c:when>
							<c:when test="${user.activeFlag == false}">
								<button class="btn btn-primary disabled">退会</button>
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