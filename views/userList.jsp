<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ 	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>個人情報一覧</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<h1>個人情報一覧</h1>
<p>${message}</p>
<table>
	<form:form modelAttribute="userModel">
	<c:forEach var ="user"  items="${userList}">
		<tr>
			<td>${user.userName}</td>
			<td>${user.plan}</td>
			<td>${user.created_at}</td>
			<td>${user.activeFlag}</td>
			<td>
			<a href="quit?userId=${user.userId}">退会</a>
			</td>
		</tr>
	</c:forEach>
	</form:form>
</table>

<p><a href="/school/admin/menu">メニューへ戻る</a></p>
<%@ include file="./layouts/footer.jsp"%>
</body>
</html>