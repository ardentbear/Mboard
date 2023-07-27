<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mboard.BoardDataBean" %>
<%@ page import = "mboard.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
	BoardDataBean article = new BoardDataBean();
	article.setCard_id(Integer.parseInt(request.getParameter("card_id")));
	article.setCard_company_name(request.getParameter("card_company_name"));
	article.setCard_employee(request.getParameter("card_employee"));
	article.setCard_phone(request.getParameter("card_phone"));
	article.setCard_email(request.getParameter("card_email"));
	article.setCard_memo(request.getParameter("card_memo"));
    String pageNum = request.getParameter("pageNum");

	BoardDBBean dbPro = BoardDBBean.getInstance();
    int check = dbPro.updateArticle(article); 

    if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=main.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
      <script type="text/javascript">      
      <!--      
        alert("실패했습니다");
        history.go(-1);
      -->
     </script>
<%
  }
%> 