<%@ page import="java.sql.*" pageEncoding="UTF-8" %>
<html>
<head>
<title>修改小说信息</title>
</head>
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
<body background="op.jpg">
	<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
		String shuming = request.getParameter("shuming");
		ResultSet rs = db.executeQuery("select * from shu where shuming='" + shuming+"'");
		rs.next();
	%>
	<form action="gengxin.jsp" method="post">
		<table>
			<caption>修改图书信息</caption>
			<tr>
				<th>类别：</th>
				<td><input name="leibie" type="text"
					value="<%=rs.getString(1)%>"></td>
			</tr>
			<tr>
				<th>作者：</th>
				<td><input name="zuozhe" type="text"
					value="<%=rs.getString(4)%>"></td>
			</tr>
			<tr>
				<th>书号：</th>
				<td><input name="shuhao" type="text"
					value="<%=rs.getString(2)%>"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="hidden" name="shuming" value="<%=shuming%>">
					<input type="submit" value="修改"> <input type="reset"
					value="重置"></th>
			</tr>
		</table>
	</form>
	<%
		rs.close();
		db.close();
	%>
</body>
</html>
