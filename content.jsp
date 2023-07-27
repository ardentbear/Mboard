<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mboard.BoardDBBean" %>
<%@ page import = "mboard.BoardDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jspf"%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
   int card_id = Integer.parseInt(request.getParameter("card_id"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

   try{
      BoardDBBean dbPro = BoardDBBean.getInstance(); 
      BoardDataBean article =  dbPro.getArticle(card_id);
  
	 
%>

<p>내용 보기</p>

<form>
<table>  
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
    <td align="center" width="125" align="center">
	     <%=article.getCard_id()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getCard_view_count()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
    <td align="center" width="125" align="center">
	     <%=article.getCard_member_id()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>" >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getCard_register_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     [<%=article.getCard_company_name()%>]<%=article.getCard_employee()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">연락처</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getCard_phone()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">E-mail</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getCard_email()%></td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="<%=value_c%>">메모</td>
    <td align="left" width="375" colspan="3">
           <pre><%=article.getCard_memo()%></pre></td>
  </tr>
  <tr>
    <td align="center" width="125" bgcolor="<%=value_c%>">사진</td>
    <td align="left" width="375" colspan="3">
			
			<%if(!(article.getCard_file_name()==null)){ %>
			<a href="./upload/<%=article.getCard_file_name()%>" download> <%=article.getCard_file_name()%></a>
			<% } %><br>
           <img width="590" height="290" src="./upload/<%=article.getCard_file_name()%>">
		   </td>
  </tr>
  <tr height="30">      
    <td colspan="4" bgcolor="<%=value_c%>" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.jsp?card_id=<%=article.getCard_id()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='deleteForm.jsp?card_id=<%=article.getCard_id()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="명함목록" 
       onclick="document.location.href='main.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
 }catch(Exception e){} 
 %>
</form>      
</body>
</html>