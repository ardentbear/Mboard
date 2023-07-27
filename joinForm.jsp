<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="color.jspf"%>

<html>
<head>
<title>명함관리 시스템 회원가입 페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align: center;
	}
	.td_title{
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>
<body bgcolor="<%=bodyback_c%>">
<form name="joinform" action="joinProcess.jsp" method="post">
<table border=1>
	<tr>
		<td colspan="2" class = "td_title">
			회원가입 페이지
		</td>
	</tr>
	<tr>
		<td><label for = "id">아이디 : </label></td>
		<td><input type="text" name="id" id = "id"/></td>
	</tr>
	<tr>
		<td><label for = "pass">비밀번호 : </label></td>
		<td><input type="password" name="pass" id = "pass"/></td>
	</tr>
	<tr>
		<td><label for = "name">이름 : </label></td>
		<td><input type="text" name="name" id = "name"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
			<a href="javascript:joinform.reset()">다시작성</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
