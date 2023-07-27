<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mboard.BoardDBBean" %>
<%@ page import = "mboard.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jspf"%>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<%
    String pageNum = request.getParameter("pageNum");
	String search = (String)request.getParameter("search");
	String scope = request.getParameter("scope");
    if (pageNum == null) {
        pageNum = "1";
    }
	String id = (String)session.getAttribute("id");
	if(id==null){
		response.sendRedirect("loginForm.jsp");
	}
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<BoardDataBean> articleList = null; 
    
    BoardDBBean dbPro = BoardDBBean.getInstance();
    
    if(search==null || search=="")
		count = dbPro.getArticleCount();
	else
		count = dbPro.getSearchArticleCount(search, scope);
	
    if (count > 0) {
		if(search==null || search=="")
			articleList = dbPro.getArticles(startRow, pageSize);
		else
			articleList = dbPro.getArticles(startRow, pageSize, search, scope);
    }

	number = count-(currentPage-1)*pageSize;
%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<title>명함관리</title>
</head>
<body bgcolor="<%=bodyback_c%>">
<p>명함목록(전체 명함수:<%=count%>)</p>

<table>
  <tr>
	<td bgcolor="<%=value_c%>"> *<%=dbPro.getMember_name(id)%> 님* 
	<a href="mypage.jsp?pageNum=<%=pageNum%>">마이페이지</a>
    </td>
	<td bgcolor="<%=value_c%>">
	<script type="text/javascript">
	function logout(){
	var returnvalue = confirm("로그아웃 하시겠습니까?");
		if(returnvalue){
			location.href="logoutPro.jsp";
		}
	}
</script>
	<button onclick="logout()">로그아웃</button>
    </td>
  </tr>
</table>
<table align="center">
<tr>
<td align="center" bgcolor="<%=value_c%>">
       <a href="registerCard.jsp">명함등록</a>
    </td>
	</tr>
</table>
<% if (count == 0) { %>


<table align="center">
<tr>
    <td align="center">
				<%if(search!=null){%>
				검색결과가 없습니다.
				<%}else{%>
				게시판에 저장된 글이 없습니다.
				<%}%>
    </td>
</table>

<% } else {%>
<br>
<br>
<table align="center"> 
    <tr height="30" bgcolor="<%=value_c%>"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
<%  
   for (int i = 0; i<articleList.size(); i++) {
       BoardDataBean article = articleList.get(i);
%>
   <tr height="30">
    <td  width="50" align="center"> <%=number--%></td>
    <td  width="250" align="left">
      <a href="cardDetail.jsp?card_id=<%=article.getCard_id()%>&pageNum=<%=currentPage%>">
           [<%=article.getCard_company_name()%>]<%=article.getCard_employee()%></a> 
		   <% if((article.getCard_file_name()!=null)){%>
         <img src="img.png" border="0" height="16"><%}%> 
	</td>
    <td width="100" align="center"> 
    <%=dbPro.getMember_name(article.getCard_member_id())%>
	</td>
    <td width="150"><%= sdf.format(article.getCard_register_date())%></td>
    <td width="50" align="center"><%=article.getCard_view_count()%></td>
    <td width="100" ><%=article.getCard_ip()%></td>
  </tr>
<%}%>
</table>
<%}%>

<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage =1;
		
		if(currentPage % 10 != 0)
           startPage = (int)(currentPage/10)*10 + 1;
		else
           startPage = ((int)(currentPage/10)-1)*10 + 1;

		int pageBlock = 10;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {
			if (search==null || search=="") {%>
				<a href="main.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%		 	} else { %>
				<a href="main.jsp?scope=<%=scope%>&pageNum=<%= startPage - 10 %>&search=<%=search%>">[이전]</a>
<%			} 
		} %>
        
<%      for (int i = startPage ; i <= endPage ; i++) {
			if (search==null || search=="") {%>
				<a href="main.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		 	} else { %>
				<a href="main.jsp?scope=<%=scope%>&pageNum=<%= i %>&search=<%=search%>">[<%= i %>]</a>
<%			} %>
<%      }
        
        if (endPage < pageCount) {  
			if (search==null || search=="") {%>
				<a href="main.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		 	} else { %>
				<a href="main.jsp?scope=<%=scope%>&pageNum=<%= startPage + 10 %>&search=<%=search%>">[다음]</a>
<%			}
		} %>
		
		<br> 
		
		
		<form name="searchform" action="main.jsp" method="get">
			<table style="margin:auto">
				<tr>
					<td><select class="form-control" name="scope">
					<option value="all">전체</option>
					<option value="company_name">회사명</option>
					<option value="member_id">작성자</option>
					<option value="memo">메모</option>
					<option value="employee">사원명</option>
					</select></td>
					<td><input name="pageNum" id ="pageNum" type="hidden" value="1"/></td>
					<% if (search == null || search == "") { %>
						<td><input type="text" name="search" id = "search"/></td>
					<% } else { %>
						<td><input type="text" name="search" id = "search" value="<%=search%>"/></td>
					<% } %>
					<td><button type="submit">검색</button></td>
				</tr>
			</table>
		</form>
		<%
    }
%>

</body>
</html>