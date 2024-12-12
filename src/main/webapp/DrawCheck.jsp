<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String userID = request.getParameter("userID"); // 아이디만 입력할 거니까
	
		String sql = "DELETE FROM members WHERE userID = ?";
	
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
			
			int resultNum = pstmt.executeUpdate(); // 성공하면 1, 실패하면 0
			
			if (resultNum == 1){
				// 성공하면 탈퇴성공으로 이동 
				response.sendRedirect("DrawSucess.jsp");
				
			} else{
				// 실패하면 탈퇴 에러로 이동 
				response.sendRedirect("DrawErr.jsp");
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