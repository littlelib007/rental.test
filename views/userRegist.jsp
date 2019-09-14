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
<title>会員情報</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel.userName}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel.userName}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
<div class="container">
<h1>会員情報</h1>
<hr />
<p class="error">${errorMessage}</p>
<form:form modelAttribute="userModel">
<div id="user_in">
	<ul>
		<li>
			<label>お名前</label>
			<form:input path="userName" value="${userName}" size="30" />
			<form:errors path="userName" element="li" cssClass="error" />
		</li>
		<li>
			<label>郵便番号</label>
			<form:input path="zipcode"  value="${zipcode}" size="10" />
			<form:errors path="zipcode" element="li" cssClass="error" />
		</li>
		<li>
			<label>ご住所</label>
			<form:input path="address"  value="${address}"  size="50" />
			<form:errors path="address" element="li" cssClass="error" />
		</li>
		<li>
			<label>メールアドレス</label>
			<form:input path="email" value="${email}"  size="50" />
			<form:errors path="email" element="li" cssClass="error" />
		</li>
		<li>
			<label>携帯電話番号</label>
			<form:input path="tel" value="${tel}"  size="15" />
			<form:errors path="tel" element="li" cssClass="error" />
		</li>
		<li>
			<label>性別</label>
			<fieldset>
				<form:radiobutton path="gender" label="男性" value="man" checked="true" />
				<form:radiobutton path="gender" label="女性" value="woman" />
			</fieldset>
		</li>
		<li>
			<label>生年月日</label>
			<form:input path="birth" value="${birth}"  size="10" />
			<form:errors path="birth" element="li" cssClass="error" />
		</li>
		<li>
			<label>パスワード</label>
			<form:input type="password"  path="password" value="${password}"  size="20" />
			<form:errors path="password" element="li" cssClass="error" />
		</li>
		<li>
			<label>レンタルプラン</label>
			<fieldset>
				<form:radiobutton path="plan" label="お試しプラン" value="1" checked="true" />
				<form:radiobutton path="plan" label="Bronzeプラン" value="2" disabled="true" />
				<form:radiobutton path="plan" label="Silverプラン" value="3" disabled="true" />
				<form:radiobutton path="plan" label="Goldプラン" value="4" disabled="true" />
			</fieldset>

		</li>
		<li class="info">プランの変更をご希望の方は、マイページよりお申し込みいただけます。</li>
		<p>
			<input type="submit"  class="btn btn-warning text-white" value="確認" />
		</p>
	</ul>
</div>
</form:form>
</div>
<%@ include file="./layouts/footer.jsp"%>