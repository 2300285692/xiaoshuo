<%@ page import ="java.sql.*" contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" %>
<html>
<head>
<title>注册</title>
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
<body background="lpp.jpg">
	<form action="zhuce.jsp" method="post">
		<table>
			<caption></caption>
			<tr>
				<th width="30%">账号：</th>
				<td width="70%"><input name="zhanghao" type="text"></td>
			</tr>
			<tr>
				<th width="30%">密码：</th>
				<td width="70%"><input name="mima" type="text"></td>
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
			String zhanghao = request.getParameter("zhanghao");
			String mima = request.getParameter("mima");
			String sql = "insert into yonghu(zhanghao,mima) values('" + zhanghao + "','" + mima + "')";
			System.out.println(sql);
			int i = db.executeUpdate(sql);
			if (i == 1) {
				out.println("<script language='javaScript'> alert('注册成功,点击确定跳转到登录界面!');</script>");
				response.setHeader("refresh", "1;url=denglu.jsp");
			} else {
				out.println("<script language='javaScript'> alert('注册失败，点击确定返回注册页面！');</script>");
				response.setHeader("refresh", "1;url=zhuce.jsp");
			}
			db.close();
		}
	%>
</body>
</html>
