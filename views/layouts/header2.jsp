<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ 	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="bg-info clearfix ">
	<a href="/school"><div class="float-left logo"><i class="fas fa-home mr-1"></i>TeamBレンタルサイト</div></a>
	<div class="m-1 float-right d-flex">
		<div class="cartbtn">
			<a href="/school/cart">
				<i class="fas fa-shopping-cart fa-2x text-white m-1 mr-3"></i>
				<c:if test="${cart.size() > 0}"><span class="badge badge-warning count">${cart.size()}</span></c:if>
			</a>
		</div>
		<div class="dropdown mr-2">
 		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    マイページ
		  </button>

		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    <a class="dropdown-item" href="/school/usermenu?userId=${userModel.userId }">マイページ</a>
		    <a class="dropdown-item" href="/school/user/logout">ログアウト</a>
		  </div>
		</div>
	</div>
</header>