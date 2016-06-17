<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./include/header.jsp" %>

<div class="container">   
<table class="table table-striped">
<h1>목록</h1>
<h3><a href="/rest/new"> 등록 </a></h3>

<thead>
	<th> NO </th>
	<th> 제목 </th>	
	<th> 이름 </th>
	<th> 작성일 </th>
	<th> 조회수 </th>
</thead>
<tbody>

<c:forEach items="${list}" var="vo">

	<tr>
		<td>${vo.board_no }</td>
		<td><a href="/rest/${vo.board_no }">${vo.title }(${vo.reply_cnt}) </a></td>
		<td>${vo.user_name }</td>
		<td>${vo.regdate }</td>
		<td>${vo.view_cnt }</td>
	</tr>
	
</c:forEach>

</tbody>
</table>
</div>

<%@include file="./include/footer.jsp" %>

 