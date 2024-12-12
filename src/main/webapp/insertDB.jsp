<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 유저가 보는 페이지는 아님 DB 회원정보 입력</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String userEmail = request.getParameter("userEmail");
	
		String sql = "INSERT INTO members VALUES (?,?,?)";
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/js_pproject";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			pstmt.setString(3, userEmail);
			
			int resultNum = pstmt.executeUpdate(); // 성공하면 1, 실패하면 0
			
			if (resultNum == 1){
				// 가입 성공하면 signupSuccess로 이동 
				response.sendRedirect("SignupSuccess.jsp");
				
			} else{
				// 실패하면 가입화면으로 이동 
				response.sendRedirect("Signup.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
						
		} finally{
			try{
				if (pstmt != null){
					pstmt.close();
				}
				
				if (conn != null){
					conn.close();
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	
	%>

</body>
</html>