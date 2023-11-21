


function onJoin (){
	//let custname = document.querySelector(".custname").value;
	// 다른 방법 document.폼name.인풋name
	let joinForm = document.joinForm;

	// 1. 유효성 검사 ( 회원 성명 입력 여부 )
	if( joinForm.custname.value == '' ) { alert("회원성명이 입력되지 않았습니다."); joinForm.custname.focus();  return false; }
	if( joinForm.phone.value == '' )	{ alert("회원전화가 입력되지 않았습니다."); joinForm.phone.focus();  return false; }
	if( joinForm.address.value == '' )	{ alert("회원주소가 입력되지 않았습니다."); joinForm.address.focus();  return false; }
	if( joinForm.joindate.value == '' )	{ alert("가입일자가 입력되지 않았습니다."); joinForm.joindate.focus();  return false; }
	if( joinForm.grade.value == '' )	{ alert("고객등급이 입력되지 않았습니다."); joinForm.grade.focus();  return false; }
	if( joinForm.city.value == '' )		{ alert("도시코드가 입력되지 않았습니다."); joinForm.city.focus();  return false; }

	alert("회원 등록이 완료되었습니다. ")
	
	
	// 2. 폼 전송하기 
	joinForm.submit();
	
}


/*
	submit() : 폼 전송
	reset()  : 폼 입력값 초기화  
	focus(); : 해당 위치로 마우스 커서 이동 
	
	JSP내에 사용하는 태그
		<%@ %> : 옵션 태그 
		<%  %> : 스크립트 태그 ( 자바코드 입력 가능 )
		<%= %> : 표현식 태그 ( 변수를 HTML로 반환 가능 )

*/