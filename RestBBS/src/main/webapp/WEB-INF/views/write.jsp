<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./include/header.jsp" %>

<form action="/rest" method="post">
<div class="container">    
<table class="table table-striped">
<h1>등록</h1>

	<tr>
		<th>제목</th>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><input type="text" name="content"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="user_name"></td>
	</tr>

	<tr><td><input type="submit" class="btn btn-info" value="등록"/></td></tr>
	
</table>
</div>
</form>

<%@include file="./include/footer.jsp" %>