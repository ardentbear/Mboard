<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mboard.BoardDBBean" %>    
<%@ page import="mboard.BoardDataBean" %>
<%@ page import="mboard.UserDBBean" %>    
<%@ page import="mboard.UserDataBean" %>
<%@ include file="color.jspf"%>

<html>
<head>
<title>My Page</title>
</head>
<body bgcolor="<%=bodyback_c%>">

   <%
   String id = (String)session.getAttribute("id");
	if(id==null){
		response.sendRedirect("loginForm.jsp");
	}
	
	UserDataBean user = null; 
    
    UserDBBean dbPro = UserDBBean.getInstance();
	user = dbPro.getArticles(id);
	
   %>

      <br><br>
      <b><font size="6" color="gray">My Page</font></b>
      <br><br>
 
      <table>
         <tr>
            <td id="title">아이디 :</td>
            <td><%=user.getId() %></td>
         </tr>
               <%session.setAttribute("pass",user.getPass()); %>
         <tr>
            <td id="title2">이름 :</td>
            <td><%=user.getName() %></td>
         </tr>
               
		<script type="text/javascript">
		function memberout(){
		var returnvalue = confirm("정말 회원탈퇴 하시겠습니까? \n*탈퇴시 내가 작성한글이 모두 삭제됩니다*");
		if(returnvalue){
			location.href="memberoutPro.jsp";
			}
		}
</script>
	<button onclick="memberout()">회원탈퇴</button>
         
      </table>
      
      <br>
      
</body>
</html>