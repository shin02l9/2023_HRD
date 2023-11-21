<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .listContentTable {
            margin: 0 auto; /* 가로 가운데 정렬 */
            text-align: center; /* 내용물을 가로로 가운데 정렬 */
            
        }

        .listContentTable td {
            vertical-align: middle; /* 세로로 가운데 정렬 */
        }
    </style>
</head>
<body>
	<%@include file="header.jsp" %>

	
		<center>
			<h3> 회원 목록 </h3>
		</center>
		
		
		<table class="listContentTable" border="1">
			<tr>
				<th> 회원번호(자동발생) </th> 
				<th> 회원성명 </th> 
				<th> 회원전화 </th> 
				<th> 회원주소 </th> 
				<th> 가입일자 </th> 
				<th> 고객등급 </th> 
				<th> 도시코드 </th> 
			</tr>
				<%
					Dao dao = new Dao();
					List< Map< String, String >> list = dao.getMemberList();
				
					for( int i = 0; i < list.size(); i++ ){
						Map< String, String > map = list.get(i);
						
						// 1. 날짜 시간 중에 날짜만 추출 [ 공백 기준으로 짜르기 ]
						String date = map.get("joindate").split(" ")[0];
						
						// 2. 등급에 따른 출력
						String price = map.get("grade").equals("A") ? "VIP" : 
										map.get("grade").equals("B") ? "일반" : "직원";						
				
				%>
					<tr>	
						<td> <a href="update.jsp?custno=<%= map.get("custno") %>">
							<%= map.get("custno") %> </a>
						</td>
						<td> <%= map.get("custname") %> </td>
						<td> <%= map.get("phone") %> </td>
						<td> <%= map.get("address") %> </td>
						<td> <%= date %> </td>
						<td> <%= price %> </td>
						<td> <%= map.get("city") %> </td>
					</tr>
						
				<%
				}
				%>
					
		</table>
	
	
	
	<%@include file="footer.jsp" %>
</body>
</html>