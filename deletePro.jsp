<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mboard.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  int card_id = Integer.parseInt(request.getParameter("card_id"));
  String pageNum = request.getParameter("pageNum");

  BoardDBBean dbPro = BoardDBBean.getInstance(); 
  int check = dbPro.deleteArticle(card_id);

  if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=main.jsp?pageNum=<%=pageNum%>">
<%}else{%>
    <script type="text/javascript">      
       <!--      
         alert("삭제실패");
         history.go(-2);
       -->
   </script>
<%} %>