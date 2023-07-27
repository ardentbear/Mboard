<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
  int card_id = Integer.parseInt(request.getParameter("card_id"));
  String pageNum = request.getParameter("pageNum");

%>
<script type="text/javascript">
	var returnvalue = confirm("정말 삭제하시겠습니까?");
	if(returnvalue){
	location.href="deletePro.jsp?card_id=<%=card_id%>&pageNum=<%=pageNum%>";
	}else{
	history.back();
	}
</script>
<html>
<head>
<title>삭제</title>


</head>
<body>
</body>
</html>