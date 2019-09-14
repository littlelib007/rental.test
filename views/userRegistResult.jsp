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
<script src="https://kit.fontawesome.com/8835088005.js"></script>
<title>会員情報登録結果</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<div class="container">
<h1>会員情報登録結果</h1>
<hr />
<p>${message}</p>
<p><a href="usermenu?userId=${user.userId}" class="btn btn-success text-white">マイページへ</a></p>
</div>
<%@ include file="./layouts/footer.jsp"%>