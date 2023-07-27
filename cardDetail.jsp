<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mboard.BoardDBBean" %>
<%@ page import="mboard.BoardDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="color.jspf"%>
	
<html>
<head>
<title>명함 상세 보기</title>
<style>
	table{
		margin : auto;
		width : 600px;
		border : 1px solid gray;
		text-align: center;
		border-collapse: collapse;
	}
	.table_title{
		font-weight: bold;
		font-size: x-large;
	}
</style>
<script>
</script>
</head>
	<body bgcolor="<%=bodyback_c%>">
	<%
		String card_id = (request.getParameter("card_id")); // card_id 값을 가져오기
		String pageNum = request.getParameter("pageNum"); // pageNum 값을 가져오기
		String id = (String)session.getAttribute("id"); // id 값을 가져오기
		BoardDataBean BoardDataBean = null;
		BoardDBBean cardDB = null;
		  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			BoardDataBean = new BoardDataBean();
			cardDB = BoardDBBean.getInstance();
			
			
			BoardDataBean = cardDB.getCardDetail(card_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	%>
		<table border = "1">
			<tr height="60">
				<td colspan="4" class="table_title">명함 상세 보기</td>
			</tr>
			<tr height="30">
				<td colspan="2">작성자</td>
				<td colspan="2"><%=BoardDataBean.getCard_member_id()%></td>
			</tr>
			<tr height="30">
				<td width="100">조회수</td>
				<td width="200"><%=BoardDataBean.getCard_view_count()%></td>
				<td width="100">등록일</td>
				<td width="200"><%=simpleDateFormat.format(BoardDataBean.getCard_register_date())%></td>
			</tr>
			<tr height="30">
				<td width="100">회사명</td>
				<td width="200"><%=BoardDataBean.getCard_company_name()%></td>
				<td width="100">이름</td>
				<td width="200"><%=BoardDataBean.getCard_employee()%></td>
			</tr>
			<tr height="30">
				<td width="100">연락처</td>
				<td width="200"><%=BoardDataBean.getCard_phone()%></td>
				<td width="100">이메일</td>
				<td width="200"><%=BoardDataBean.getCard_email() != null ? BoardDataBean.getCard_email() : "이메일이 없습니다."%></td>
			</tr>
			<tr height="30">
				<td colspan="4">메모</td>
			</tr>
			<tr height="120">
				<td colspan="4"><%=BoardDataBean.getCard_memo() != null ? BoardDataBean.getCard_memo() : "메모가 없습니다."%></td>
			</tr>
			<tr height="30">
			<% 	if (BoardDataBean.getCard_file_name() == null) { %>
				<td colspan="4">명함 이미지</td>
			<%} else { %>
				<td colspan="2">명함 이미지</td>
				<td colspan="2"><a href="../upload/<%=BoardDataBean.getCard_file_name()%>" download>원본 이미지 다운로드</td>
			<%} %>
			</tr>
			<tr height="300">
			<% 	if (BoardDataBean.getCard_file_name() == null) { %>
					<td colspan="4">이미지가 존재하지 않습니다.</td>
			<%}	else { %>
			<td colspan="4"><img width="590" height="290" src="../upload/<%=BoardDataBean.getCard_file_name()%>"></td>
			<%} %>
			</tr>
			<tr height = "30">
				<form method="POST">
				<input name="card_id" id = "card_id" type="hidden" value="<%=card_id%>"/>
				<input name="id" id = "id" type="hidden" value="<%=id%>"/>
				<input name="pageNum" id ="pageNum" type="hidden" value="<%=pageNum%>"/>
					<td colspan="4">
						<input type="submit" value="명함 목록" formaction="main.jsp"/>
					<% if (id.equals(BoardDataBean.getCard_member_id())) { %>
						<input type="submit" value="명함 수정" formaction="updateForm.jsp"/>
						<input type="submit" value="명함 삭제" formaction="deleteForm.jsp"/>
					<% }%>
				</form>
			</tr>
		</table>
	</body>
</html>