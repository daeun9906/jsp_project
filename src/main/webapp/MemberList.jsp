<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>
</head>
<body>
	<h2>회원 목록</h2>
	<hr>
	
	<%
		String sql = "SELECT * FROM members"; // 전체 목록 가져오는 거니까
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/js_pproject";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String userID = rs.getString("userID");
				String userPW = rs.getString("userPW");
				String userEmail = rs.getString("userEmail");
				
				
				out.println(userID + "/" + userPW + "/" + userEmail);
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