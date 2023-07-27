<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");	
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name"); 
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	
	try {
  		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB2");
  		conn = ds.getConnection();
  		
  		pstmt=conn.prepareStatement("INSERT INTO member VALUES (?,SHA2(?, 256),?)");
  		pstmt.setString(1,id);
  		pstmt.setString(2,pass);
  		pstmt.setString(3,name);
  		
  		int result=pstmt.executeUpdate();
  		
  		if(result == 1){  			
  			out.println("<script>");
  	  		out.println("location.href='loginForm.jsp'");
  	  		out.println("</script>");  		
		}else{
  			out.println("<script>");
			out.println("alert('중복된 아이디가 있습니다.')");
  	  		out.println("location.href='joinForm.jsp'");
  	  		out.println("</script>");  	
  		}
	}catch(Exception e){
		e.printStackTrace();
		out.println("<script>");
		out.println("alert('중복된 아이디가 있습니다.')");
  	  	out.println("location.href='joinForm.jsp'");
  	  	out.println("</script>");  
 	}finally{
 		try{
 			pstmt.close();
 			conn.close();
 		}
 		catch(Exception e){
 			e.printStackTrace();
 		}
 	}
%>
