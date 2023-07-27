<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mboard.BoardDBBean" %>
<%@ page import = "mboard.BoardDataBean" %>
<%@ include file="color.jspf"%>
<html>
<head>
<title>명함 관리</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<%
  int card_id = Integer.parseInt(request.getParameter("card_id"));
  String pageNum = request.getParameter("pageNum");
  try{
      BoardDBBean dbPro = BoardDBBean.getInstance(); 
      BoardDataBean article =  dbPro.updateGetArticle(card_id);

%>

<p>명함수정</p>
<br>
<form method="post" name="writeform" id="writeform"
action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
<table align="center" >
	<tr height="30">
		<td align="center" width="125" bgcolor="<%=value_c%>">회사명</td>
		<td align="left" width="70" >
	     <input type="text" size="15" maxlength="15" name="card_company_name" 
			value="<%=article.getCard_company_name()%>" style="ime-mode:active;">
			</td>
		<input type="hidden" name="card_id" value="<%=article.getCard_id()%>">
		<tr>
		<td align="center" width="125" bgcolor="<%=value_c%>">직원이름</td>
		<td align="left" width="125" >
	     <input type="text" size="15" maxlength="15" name="card_employee" 
         value="<%=article.getCard_employee()%>" >
	   </td>
	   </tr>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center">연락처</td>
    <td align="left" width="250">
       <input type="text" size="15" maxlength="15" name="card_phone" 
         value="<%=article.getCard_phone()%>">
		 </td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >Email</td>
    <td align="left" width="250">
       <input type="email" size="20" maxlength="20" name="card_email"
        value="<%=article.getCard_email()%>" style="ime-mode:inactive;"></td>
  </tr>
  <tr>
    <td  width="70"  bgcolor="<%=value_c%>" align="center" >메모</td>
    <td align="left" width="250">
     <textarea name="card_memo" form="writeform" rows="3" cols="20" value="<%=article.getCard_memo()%>"></textarea></td>
  </tr>
  <tr>      
   <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='main.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>
<%
}catch(Exception e){}%>      
      
</body>
</html>