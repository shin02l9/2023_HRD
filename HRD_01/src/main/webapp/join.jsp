<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .joinContentTable {
            margin: 0 auto; /* 가로 가운데 정렬 */
            text-align: center; /* 내용물을 가로로 가운데 정렬 */
        }

        .joinContentTable td {
            vertical-align: middle; /* 세로로 가운데 정렬 */
        }
    </style>
</head>
<body>

	<% 
		Dao dao = new Dao(); 
	
		// 마지막 번호 가져오기 
		int lastno = dao.lastNo();
	
	
	%>
	
		<%@include file="header.jsp" %>
		
		<center>
		<h3> 홈쇼핑 회원 등록 </h3>
		<center>	
		
		
	<div class="joinContent">
		<form name="joinForm" method="post" action="joinLogic.jsp">
		<table class="joinContentTable">
			<tr>
				<th> 회원번호(자동발생) </th> <td>  <input class="custno" name="custno" type="text" value=<%= lastno %> > </td>
			</tr>
			<tr>
				<th> 회원성명 </th> <td>  <input class="custname" name="custname" type="text"/> </td>
			</tr>			
			<tr>
				<th> 회원전화 </th> <td>  <input class="phone" name="phone" type="text"/> </td>
			</tr>
			<tr>
				<th> 회원주소 </th> <td>  <input class="address" name="address" type="text"/> </td>
			</tr>
			<tr>
				<th> 가입일자 </th> <td>  <input class="joindate" name="joindate" type="text"/> </td>
			</tr>
			<tr>
				<th> 고객등급(A:VIP, B:일반, C:직원) </th> <td>  <input class="grade" name="grade" type="text"/> </td>
			</tr>
			<tr>
				<th> 도시코드 </th> <td>  <input class="city" name="city" type="text"/> </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<button onClick="onJoin()" type="submit"> 등록 </button>
					<a href="list.jsp" > <button type="button"> 조회 </button> </a>
				<td> 
			</tr>
		</table>
		</form>
		
	</div>
	
	

		<%@include file="footer.jsp" %>
		
		
	<script type="text/javascript" src="join.js"> </script>
</body>
</html>

<!-- 나) 회원등록 화면
① '회원등록' 화면은 회원번호, 회원성명, 회원전화, 회원주소, 가입일자, 고객등급, 도시코드 입력 항목으로 구성되어 있다. 모든 항목의 정보를 
채우고‘등록’버튼을 클릭하면 회원정보가‘회원정보명세서 테이블’에 
저장된다. 
② 이 때 회원번호는 자동생성 된다. (마지막 번호 + 1)
③ 회원성명 항목의 값이 입력되어 있지 않은 경우에‘등록’버튼을 클릭하면 ‘회원성명이 입력되지 않았습니다.’라는 알림창이 화면에 나타나고 포커스가 
회원성명 항목으로 이동한다.
④ 모든 항목에 대해 데이터 유효성 체크를 실시하며, 유효성 체크에서 통과 하지 
못하면 각 항목별 알림창 화면이 나타난다. 
⑤ 모든 항목을 입력한 후 등록 버튼을 아래와 같이 누르게 된다.
⑥ '회원등록이 완료 되었습니다!' 라는 알림창과 함께 데이터베이스 회원정보 
테이블에 저장된다. 
⑦ 회원등록확인은 다) 회원목록조회/수정 화면에서 확인한다. 
⑧ 등록 화면에서‘조회’버튼을 클릭하면 다)‘회원목록조회/수정’화면으로 이동 
된다. 다) 회원목록조회/수정 화면
① '회원목록조회/수정' 메뉴를 클릭하면 회원정보가 목록으로 조회된다. 가입일자 
데이터는 날짜 형식(YYYY-MM-DD)으로 화면에 나타나도록 한다. -->