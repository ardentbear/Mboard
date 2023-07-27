<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mboard.BoardDBBean" %>    
<%@ page import="mboard.BoardDataBean" %>
<%@ page import="mboard.UserDBBean" %>    
<%@ page import="mboard.UserDataBean" %>

<%
   String id = (String)session.getAttribute("id");
   String pass = (String)session.getAttribute("pass");
	if(id==null){
		response.sendRedirect("loginForm.jsp");
	}
	if(pass==null){
		response.sendRedirect("loginForm.jsp");
	}
	int x=-1;
	int result=-1;
	UserDataBean user = null; 
    
    UserDBBean dbPro = UserDBBean.getInstance();
	user = dbPro.getArticles(id);
    
    BoardDBBean dbPro2 = BoardDBBean.getInstance();
	result = dbPro2.deleteMemberArticle(id);
	x = dbPro.deleteMember(id,pass);
	if(x>0 && result >0){	
   %>
   <script type="text/javascript">
   alert("회원 탈퇴 완료");
   </script>
	<%}%>
<html>
<head>
<title>memberout</title>
</head>
<body>
   <% session.invalidate();
   response.sendRedirect("loginForm.jsp");
   %>
</body>
</html>