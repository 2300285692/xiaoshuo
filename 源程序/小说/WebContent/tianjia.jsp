<%@ page import ="java.sql.*" contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" %>
<html>
<head>
<title>小说管理</title>
<style type="text/css">
table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 400px;
}
th, td {
	border: solid #333 1px;
	height: 20px;
}
div {
	text-align: center;
}
</style>
</head>
<body background="lk.jpg">
	<form action="tianjia.jsp" method="post">
		<table>
			<caption>添加小说信息</caption>
			<tr>
				<th width="30%">类别：</th>
				<td width="70%"><input name="leibie" type="text"></td>
			</tr>
			<tr>
				<th width="30%">书号：</th>
				<td width="70%"><input name="shuhao" type="text"></td>
			</tr>
			<tr>
				<th>书名：</th>
				<td><input name="shuming" type="text"></td>
			</tr>
			<tr>
				<th>作者：</th>
				<td><input name="zuozhe" type="text"></td>
			</tr>
			
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="添加">
					<input type="reset" value="重置"></th>
			</tr>
		</table>
	</form>
	<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String submit = request.getParameter("submit");
		if (submit != null && !submit.equals("")) {
			String shuhao = request.getParameter("shuhao");
			String shuming = request.getParameter("shuming");
			String zuozhe = request.getParameter("zuozhe");
			String leibie = request.getParameter("leibie");
			String sql = "insert into shu(leibie,shuhao,shuming,zuozhe) values('" + leibie + "','" + shuhao + "','" + shuming + "','" + zuozhe + "')";
			System.out.println(sql);
			int i = db.executeUpdate(sql);
			if (i == 1) {
				out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
				response.setHeader("refresh", "1;url=shouye2.jsp");
			} else {
				out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
				response.setHeader("refresh", "1;url=shouye2.jsp");
			}
			db.close();
		}
	%>
</body>
</html>
