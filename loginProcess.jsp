<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
  		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB2");
  		conn = ds.getConnection();
  		
  		pstmt=conn.prepareStatement("SELECT COUNT(*) FROM member WHERE member_id = ? and member_password = SHA2(?, 256)");
  		pstmt.setString(1,id);
  		pstmt.setString(2,pass);
  		rs=pstmt.executeQuery();
  		
  		if(rs.next()){
			int count=rs.getInt(1);
  			if(count == 1){
  				session.setAttribute("id",id);
  				out.println("<script>");
  		  		out.println("location.href='main.jsp'");
  		  		out.println("</script>");
  			}
  		}

  		out.println("<script>");
		out.println("alert('아이디/비밀번호가 잘못되었습니다.')");
  		out.println("location.href='loginForm.jsp'");
  		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
  		out.println("<script>");
		out.println("alert('아이디/비밀번호가 잘못되었습니다.')");
  		out.println("location.href='loginForm.jsp'");
  		out.println("</script>");

 	}finally{
 		try{
 			rs.close();
 			pstmt.close();
 			conn.close();
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
 	}
%>
