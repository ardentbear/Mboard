<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="mboard.BoardDBBean"%>
<%@page import="mboard.BoardDataBean"%>
<%@ include file="color.jspf"%>

	
<html>
<head></head>
	<body bgcolor="<%=bodyback_c%>">
		<% 
			BoardDataBean BoardDataBean = new BoardDataBean();
			String uploadPath = request.getRealPath("/upload");
			int size = 1024 * 1024 * 5;
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			BoardDBBean carddb = BoardDBBean.getInstance();
			try {
				Enumeration files = multi.getFileNames();
				String fileName = (String)files.nextElement();
				BoardDataBean.setCard_company_name(multi.getParameter("card_company_name"));
				BoardDataBean.setCard_employee(multi.getParameter("card_employee"));
				BoardDataBean.setCard_phone(multi.getParameter("card_phone"));
				BoardDataBean.setCard_ip(multi.getParameter("card_ip"));
				BoardDataBean.setCard_member_id(multi.getParameter("card_member_id"));
				BoardDataBean.setCard_file_name(multi.getFilesystemName(fileName));
				if (!multi.getParameter("card_email").equals(""))
					BoardDataBean.setCard_email(multi.getParameter("card_email"));
				if (!multi.getParameter("card_memo").equals(""))
					BoardDataBean.setCard_memo(multi.getParameter("card_memo"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			String result = carddb.registerCard(BoardDataBean);
			
			if (result.equals("success")) 
				response.sendRedirect("main.jsp");
			else { // 실패하면 알림 창 띄우고 이전 페이지로 이동%> 
				<script>
				alert("추가하지 못했습니다.");
				history.back();
				</script>	
		<%	} %>
	</body>
</html>