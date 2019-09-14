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
<title>マイページ</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>

<div class="container">
<h1>マイページ</h1>
<c:if test="${!empty infoMessage}"><p class="info">${infoMessage}</p></c:if>
<c:if test="${!empty errorMessage}"><p class="error">${errorMessage}</p></c:if>
<form:form modelAttribute="userModel">
<div id="user_in">
	<ul>
		<li>
			<label>会員番号</label>
			<c:out value="${userModel.userId}" />
			<input type="hidden" value="${userModel.userId}" name="userId" />
		</li>
		<li>
			<label>お名前</label>
			<form:input path="userName" value="${userModel.userName}" size="30" />
			<form:errors path="userName" element="li" cssClass="error" />
		</li>
		<li>
			<label>郵便番号</label>
			<form:input path="zipcode"  value="${userModel.zipcode}" size="10" />
			<form:errors path="zipcode" element="li" cssClass="error" />
		</li>
		<li>
			<label>ご住所</label>
			<form:input path="address"  value="${userModel.address}"  size="50" />
			<form:errors path="address" element="li" cssClass="error" />
		</li>
		<li>
			<label>メールアドレス</label>
			<form:input path="email" value="${userModel.email}"  size="50" />
			<form:errors path="email" element="li" cssClass="error" />
		</li>
		<li>
			<label>携帯電話番号</label>
			<form:input path="tel" value="${userModel.tel}"  size="15" />
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
			<form:input path="birth" value="${userModel.birth}"  size="10" />
			<form:errors path="birth" element="li" cssClass="error" />
		</li>
		<li>
			<label>パスワード</label>
			<form:input type="password"  path="password" value="${userModel.password}"  size="20" />
			<form:errors path="password" element="li" cssClass="error" />
		</li>
		<li>
			<label>レンタルプラン</label>
			<fieldset>
				<form:radiobutton path="plan" label="お試しプラン" value="1" checked="true" />
				<form:radiobutton path="plan" label="Bronzeプラン" value="2" />
				<form:radiobutton path="plan" label="Silverプラン" value="3" />
				<form:radiobutton path="plan" label="Goldプラン" value="4" />
			</fieldset>
		</li>
		<li>
			<input type="submit"  name="userMenuEdit" class="btn btn-warning text-white" value="変更" />
		</li>
	</ul>
</div>
</form:form>
<br />
<h2>レンタル履歴&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/school" class="btn btn-success text-white" >商品検索画面へ</a></h2>
<hr />
<form:errors path="*" element="div" cssClass="error" />
<c:if test="${empty recList}">
	<p>現在のご利用はありません。</p>
</c:if>
<table border="1">
	<c:if test="${not empty recList}">
		<tr>
			<th>商品番号</th>
			<th>商品名</th>
			<th>利用枚数</th>
			<th>&nbsp;</th>
		</tr>
	</c:if>

	<c:forEach var="rec" items="${recList}">
		<form:form modelAttribute="recodeModel">
			<tr>
				<td><c:out value="${rec.itemCode}" /></td>
				<td width="380"><c:out value="${(rec.item).itemName}" /></td>
				<td width="100"><c:out value="${rec.amount}" /></td>
				<td>
					<input type="hidden" value="${rec.id}" name="id"  />
					<input type="submit" name="userItemDelete" class="btn btn-primary" value="取消" />
				</td>
			</tr>
		</form:form>
	</c:forEach>
</table>
<br />


<p><a id="confirm"  href="quit?userId=${userModel.userId}" class="btn btn-info text-white" >退会の方はこちら</a></p>
</div>
<%@ include file="./layouts/footer.jsp"%>