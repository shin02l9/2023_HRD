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

<%
	// 여기서 부터 자바 입력하는 곳 !





%>

<%
// 한글 인코딩
request.setCharacterEncoding("UTF-8");

	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");



	System.out.println( "custno : "+custno );
	System.out.println( "custname : "+custname );
	System.out.println( "phone : "+phone );
	System.out.println( "address : "+address );
	System.out.println( "joindate : "+joindate );
	System.out.println( "grade : "+grade );
	System.out.println( "city : "+city );

	// DAO 처리하기
	Dao dao = new Dao();
	dao.join(custno, custname, phone, address, joindate, grade, city);
	
	// 페이지 전환 
	response.sendRedirect("join.jsp");
	
%>







</body>
</html>