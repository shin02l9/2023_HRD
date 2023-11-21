<%@page import="java.util.Map"%>
<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .updateContentTable {
            margin: 0 auto; /* 가로 가운데 정렬 */
            text-align: center; /* 내용물을 가로로 가운데 정렬 */
        }

        .updateContentTable td {
            vertical-align: middle; /* 세로로 가운데 정렬 */
        }
    </style>
    
</head>
<body>

	<%@include file="header.jsp" %>
	
	<center>
		<h3> 회원수정 </h3>
	</center>
		
		<%
			Dao dao = new Dao();
			System.out.println(request.getParameter("custno"));
			int custno = Integer.parseInt(request.getParameter("custno"));
			Map<String,String> r = dao.getMember(custno);
		
		%>
		
		<script>
			function onUpdate(){ document.updateForm.submit(); alert("회원 수정이 완료되었습니다. ") }
		</script>		
		
			<div class="updateContent">
		<form name="updateForm" method="post" action="updateLogic.jsp">
		<table class="updateContentTable">
			<tr>
				<th> 회원번호(자동발생) </th> 
				<td>  <input class="custno" name="custno" type="text" value="<%= r.get("custno") %>" > </td>
			</tr>
			<tr>
				<th> 회원성명 </th> 
				<td>  <input class="custname" name="custname" type="text" value="<%= r.get("custname") %>"/> </td>
			</tr>			
			<tr>
				<th> 회원전화 </th> 
				<td>  <input class="phone" name="phone" type="text" value="<%= r.get("phone") %>"/> </td>
			</tr>
			<tr>
				<th> 회원주소 </th> 
				<td>  <input class="address" name="address" type="text" value="<%= r.get("address") %>"/> </td>
			</tr>
			<tr>
				<th> 가입일자 </th> 
				<td>  <input class="joindate" name="joindate" type="text" value="<%= r.get("joindate") %>"/> </td>
			</tr>
			<tr>
				<th> 고객등급(A:VIP, B:일반, C:직원) </th> 
				<td>  <input class="grade" name="grade" type="text" value="<%= r.get("grade") %>"/> </td>
			</tr>
			<tr>
				<th> 도시코드 </th> 
				<td>  <input class="city" name="city" type="text" value="<%= r.get("city") %>"/> </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<button onClick="onUpdate()" type="submit"> 수정 </button>
					<a href="list.jsp" > <button type="button"> 조회 </button> </a>
				<td> 
			</tr>
		</table>
		</form>
		
	</div>
	

	<%@include file="footer.jsp" %>

</body>
</html>