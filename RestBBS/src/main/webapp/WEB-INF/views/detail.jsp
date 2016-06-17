<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./include/header.jsp" %>

	<script>
		function w(){
			location.href="/rest";
		}
	</script>
	
<div class="container">    
<table class="table table-striped">
<h1>${vo.title}</h1>

	
	<tr>
		<th>글쓴이</th>
		<td>${vo.user_name}</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td>${vo.regdate}</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td><c:out value="${vo.content}" escapeXml="false"></c:out></td>
	</tr>
		
	
</table>

	<form action="/rest/${vo.board_no}" method="post">
		<input type="hidden" id="_method" name="_method" value="delete"/>
		<input type="submit" class="btn btn-info" value="삭제"/>
		<input type="button" id="btn" name="btn" class="btn btn-info" value="목록" onclick="w()" />
	</form>


	
	<h3>댓글</h3>
	
	<div id="reply_list"></div>
	<div id="reply_page"></div>
	
	<form id="reply">
		<input type="text" id="content" name="content" size="50"/>
		작성자 : <input type="text" id="user_name" name="user_name" size="10"/>
		<input type="button" id="btm" class="btn btn-info" value="등록" onclick="insertReply()"/>
	</form>
	
	<script type="text/javascript">
	
		var bno = '${vo.board_no}';
	
		function deleteReply(rno){
			$.ajax({
				type:'delete',
				url:'/reply/'+rno,
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE",
				},
				data : '',
				dataType:'text',
				success : function(result){
					if(result == "SUCCESS"){
						getReplyList();
					}
				}
			});
		}
		
		
		function insertReply(){
					
			var reply_content = $("#content").val();
			
			var reply_user =  $("#user_name").val();
			
			$.ajax({
				type:'post',
				url:'/reply/'+bno,
				headers:{"Content-Type" : "application/json"},
				data : '{"content":"'+reply_content+'", "user_name":"'+reply_user+'"}',
				
				dataType:'text',
				success : function(result){
					
					if(result == "SUCCESS"){
						getReplyList();
					}
				}
			});
		}
		
		
		function setReplyLIst(data){
			
			var result = "<ul>";
			
			$(data).each(function(){
				result += "<li>" 
				+ this.content + "(" + this.user_name + ")"
				+ "<input type='button' id='btn_del' name='btn_del' value='삭제' class='btn btn-info' onclick='deleteReply(" + this.reply_no +")'/>"
				+ "</li>";
			});
			
			result += "</ul>";
			document.getElementById("reply_list").innerHTML = result;
		}
		
		
		function getReplyList(page){
			
			if(page == null)
				page = currentPage;
			
			$.ajax({
				type:'get',
				url:'/reply/'+bno+'/'+page,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET",
				},
				dataType:'json',
				data : '',
				success : function(result){
					
					setReplyLIst(result.l);
					setPagePrint(result.p);
				}
			});
			currentPage = page;
		}
		
		function setPagePrint(pm){
			var str = "<ul class='pagination'>";
			
			if(pm.prev)
				str += "<li><a onclick='getReplyList("+(pm.startPage-1)+" )'>&lt;</a></li>";
			
			for(var i = pm.startPage; i<=pm.endPage; i++){
				if(i == pm.criteria.page){
					str += "<li class='active'><a href='#'>" + i + "</a></li>";
				}else{
					str += "<li><a onclick='getReplyList("+i+")' style='cursor:hand'>" + i + "</a></li>";
				}
			}
				
			if(pm.next)
				str += "<li> <a onclick='getReplyList("+(pm.endPage+1)+")'> &gt;</a></li>";
				
			str +="</ul>"
			document.getElementById("reply_page").innerHTML = str;	
		}
		
		getReplyList(1);
	</script>
</div>
	
<%@include file="./include/footer.jsp" %>
 