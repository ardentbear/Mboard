<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf"%>
	
<% String id = (String)session.getAttribute("id");%>
<% if(id!=null){%>
<% }else{ %>
<% response.sendRedirect("loginForm.jsp"); } %>
<html>
<head>
<title>명함 정보 입력</title>
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
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}
</script>
</head>
	<body bgcolor="<%=bodyback_c%>">
		<form action="registerCardPro.jsp" name="member" method="POST" enctype="multipart/form-data">
		<table border=1>
			<tr height="60">
				<td colspan="2" class = "table_title">명함 정보 입력</td>
			</tr>
			<tr>
				<td width="150"><label for="card_company_name">회사명</label></td>
				<td><input name="card_company_name" id="card_company_name" type="text" style="width:100%; border:0;" required/></td>
			</tr>
			<tr>
				<td><label for="card_employee">이름</label></td>
				<td><input name="card_employee" id="card_employee" type="text" style="width:100%; border:0;" required/></td>
			</tr>
			<tr>
				<td><label for="card_phone">연락처</label></td>
				<td><input name="card_phone" id="card_phone" type="tel" style="width:100%; border:0;" required/></td>
			</tr>
			<tr>
				<td><label for="card_email">이메일</label></td>
				<td><input name="card_email" id="card_email" type="email" style="width:100%; border:0;"/></td>
			</tr>
			<tr>
				<td><label for="card_memo">메모</label></td>
				<td><input name="card_memo" id="card_memo" type="text" style="width:100%; border:0;"/></td>
			</tr>
			<tr>
				<td><label for="card_file_name">명함 이미지</label></td>
				<td><input name="card_file_name" id="card_file_name" type="file" style="width:100%" onchange="readURL(this);"/>
					<img id="preview" height="300" width="450"/></td>
			</tr>
			<input type="hidden" name="card_member_id" value="<%=id%>">
			<input type="hidden" name="card_ip" value="<%=request.getRemoteAddr()%>">
			<tr>
				<td colspan="2"><input type="submit" value="명함 추가"<br></td>
			</tr>
		</table>
		</form>
	</body>
</html>