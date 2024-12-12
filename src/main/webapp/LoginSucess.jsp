<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 성공 </title>
</head>
<body>
	<h2>관리자 로그인</h2>
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
	
	
		String adminID = request.getParameter("adminID");
		String adminPW = request.getParameter("adminPW");
		
		// 아이디: space, 비밀번호: 123456일 경우만 로그인 성공 
		if (adminID.equals("space") && adminPW.equals("123456")){
			session.setAttribute("admin", "yes");
			out.println("새로운 세션 생성 성공!" + "<br>");
			out.println("관리자" + adminID + "님이 입장하셨습니다.");
			
		} else {
			response.sendRedirect("LoginErr.jsp");
		}
	%>
	
	<table>
		<tr>
			<td>
				<form action="MemberList.jsp">
					<input type="submit" value="◀ 등록 회원 관리하기">
				</form>
			
			
			</td>
			<td>
				<form action="Logout.jsp">
					<input type="submit" value="로그 아웃 ▶">
				</form>
			
			
			</td>
			
		
		
			</tr>
	</table>

</body>
</html>