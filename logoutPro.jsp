<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mboard.BoardDBBean" %>    
<%@ page import="mboard.BoardDataBean" %>

<html>
<head>
<title>logout</title>
</head>
<body>
   <% session.invalidate();
   response.sendRedirect("loginForm.jsp");
   %>
</body>
</html>