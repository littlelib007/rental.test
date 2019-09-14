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
<title>会員情報確認</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<div class="container">
<h1>会員情報確認</h1>
<hr />
<c:if test="${!empty message}"><p class="info">${message}</p></c:if>
<c:if test="${!empty errorMessage}"><p class="error">${errorMessage}</p></c:if>
<form:form modelAttribute="userModel">
<div id="user_in">
	<ul>
		<li>
			<label>お名前：</label>${userModel.userName}
		</li>
		<li>
			<label>郵便番号：</label>${userModel.zipcode}
		</li>
		<li>
			<label>ご住所：</label>${userModel.address}
		</li>
		<li>
			<label>メールアドレス：</label>${userModel.email}
		</li>
		<li>
			<label>携帯電話番号：</label>${userModel.tel}
		</li>
		<li>
			<label>性別：</label>
			<c:if test="${userModel.gender=='man'}">男性</c:if>
			<c:if test="${userModel.gender=='woman'}">女性</c:if>
		</li>
		<li>
			<label>生年月日：</label>${userModel.birth}
		</li>
		<li>
			<label>パスワード：</label>${userModel.password}
		</li>
		<li>
			<label>レンタルプラン：</label>
			<c:if test="${userModel.plan=='1'}">お試しプラン</c:if>
			<c:if test="${userModel.plan=='2'}">Bronzeプラン</c:if>
			<c:if test="${userModel.plan=='3'}">Silverプラン</c:if>
			<c:if test="${userModel.plan=='4'}">Goldプラン</c:if>
		</li>
		<p>
			<input type="submit" name="regist" class="btn btn-warning text-white" value="登録" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" name="back" class="btn btn-primary" value="戻る" />
		</p>
		<form:input path="activeFlag" type="hidden" value="true" />
	</ul>
</div>
</form:form>
</div>
<%@ include file="./layouts/footer.jsp"%>