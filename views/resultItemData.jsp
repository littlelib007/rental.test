<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
<title>レンタル情報登録結果</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<h1>レンタル登録結果</h1>
<hr />
<p>${message}</p>
<p>登録完了！！</p>

<!-- 	ユーザIDの確認用コード ここから -->
	<form:form modelAttribute="userModel">
		<table>
			<tr>
				<td>ユーザID</td>
				<td><c:out value="${userModel.userId}" /></td>

			</tr>
		</table>
	</form:form>
<!-- 	ユーザIDの確認用コード ここまで （削除予定）-->

<p><a href="usermenu?userId=${userModel.userId}#rental">マイページへ</a></p>
<%@ include file="./layouts/footer.jsp"%>
</body>
</html>