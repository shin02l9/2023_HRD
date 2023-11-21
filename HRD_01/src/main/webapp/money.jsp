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
</head>
<body>

	<%@include file="header.jsp" %>
	<center>
		<h3> 회원매출조회 </h3>

      <table border="1">
         <tr>
            <th>회원번호</th>
            <th>회원성명</th>
            <th>고객등급</th>
            <th>매출</th>
         </tr>
         <% 
            Dao dao = new Dao();
         
         List< Map< String ,String >> list = dao.getMoney();
         
         for( int i = 0; i < list.size(); i++ ){
            Map< String ,String > map = list.get(i);
            
         %>
         <tr>
            <td><%= map.get("custno") %></td>
            <td><%= map.get("custname") %></td>
            <td><%= map.get("grade") %></td>
            <td><%= map.get("sum") %></td>
         </tr>
         <%   
         } // for end
         %>
         
      </table>
	</center>
	<%@include file="footer.jsp" %>
</body>
</html>