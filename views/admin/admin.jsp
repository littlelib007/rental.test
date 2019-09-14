<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>従業員ログイン画面</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />">
</head>
<body>
<c:choose >
    <c:when test="${empty userModel.userName}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel.userName}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<div class="container">
	<form:form modelAttribute="adminModel" class="m-3 center">
	  <div class="form-group">
	    <label for="adminId">従業員ID</label>
	    <form:input path="admin" size="50" class="form-control" id="adminId"/>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <form:input type="password" path="adminpass" size="50" class="form-control"/>
	  </div>
	  <button type="submit" class="btn btn-primary">ログイン</button>
	  <div class="errors">${errorMessage}</div>

	</form:form>
</div>
<footer class="mt-3 h-50 bg-info clearfix ">
	<div class="m-1 float-right">
		<a href="/school">TeamBレンタルサイトへ</a>
	</div>
</footer>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>