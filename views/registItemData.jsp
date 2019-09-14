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
<style type="text/css">
.error {
	color: #FF0000;
}
</style>
<title>レンタル確認画面</title>
</head>
<body>
<c:choose >
    <c:when test="${empty userModel}"><%@ include file = "./layouts/header.jsp" %></c:when>
    <c:when test="${not empty userModel}"><%@ include file = "./layouts/header2.jsp" %></c:when>
</c:choose>
	<h1>レンタル確認画面</h1>
	<hr />

	<form:form modelAttribute="userModel">
		<table>
			<tr>
				<td>ユーザID</td>
				<td><c:out value="${userModel.userId}" /></td>

			</tr>
		</table>
	</form:form>

	<form:form modelAttribute="recodeModel">
		<table>
			<tr>
				<td>商品名</td>
				<td><c:out value="${itemModel.itemName}" /></td>
			</tr>
			<tr>
				<td>レンタル枚数</td>
				<td>
					<form:select path ="amount" name="レンタル数" >
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</form:select>　枚
				</td>

<!-- 				<td> -->
<%-- 					<form:select path ="amount" name="レンタル数"  > --%>

<%-- 					<%! int abc=10; %> --%>

<%-- 					abc="${recodeModel.getAmount()}" --%>
<%-- 					<% --%>
<!-- // 						//abc=getAttribute(recodeModel.getAmount()); -->
<!-- // 		    			for (int i = 0; i < 10; i++) { -->
<%-- 					%> --%>
<%-- 		        		<option value=<%= i+1 %>><%=i+1 %></option> --%>
<%-- 					<% --%>
<!-- // 		    		} -->
<!-- 					%> -->
<%-- 					</form:select>　枚</td> --%>
<!-- 				</td> -->



			</tr>

			<tr>
				<td>レンタル期間</td>
					<td><c:out value="${recodeModel.getRental_at()}"/></td>
					<td><c:out value="～" /></td>
					<td><c:out value="${recodeModel.getReturn_at()}"/></td>
				</td>
			</tr>

			<tr>
				<td colspan="3">
					<input type="submit" value="確定" name="regist" />
					<p><a href="item?item=${itemModel.itemCode}">商品画面へ戻る</a></p>
				</td>
			</tr>
		</table>
	</form:form>
	<p class="error">${errorMessage}</p>
	<%@ include file="./layouts/footer.jsp"%>
</body>
</html>