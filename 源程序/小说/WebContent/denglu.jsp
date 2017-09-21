<%@ page import="java.sql.*" import ="java.util.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
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
<body background="lop.jpg">
    <form action="denglu.jsp" method="post">
		<table>
			<caption>登录界面</caption>
			<tr>
				<th width="30%">账号：</th>
				<td width="70%"><input name="zhanghao" type="text"  onkeydown="checkUsername()"><span id="usernameMsg"></span></td>
			</tr>
			<tr>
				<th>密码：</th>
				<td><input type="password" name="mima" type="text"></td>
			</tr>
			
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="登录">
					<input type="button" name="jump" value= "注册" onclick="location.href='zhuce.jsp'"/>
					</th>
			</tr>
		</table>
		
	</form>
    <jsp:useBean id="db" class="bean.DBBean" scope="page" />
		 <%
			request.setCharacterEncoding("UTF-8");
			String submit = request.getParameter("submit");
			boolean accounttf=false;
			boolean passtf=false;
			String shengfen=null;
			try{
			if (submit != null && !submit.equals("")) {
				String zhanghao = request.getParameter("zhanghao");
				String mima = request.getParameter("mima");
				if (zhanghao.equals("1") && mima.equals("123"))
					response.setHeader("refresh", "1;url=shouye2.jsp");
				else {
					String sql = "select * from yonghu where zhanghao='" + zhanghao + "' and mima='" + mima
							+ "'";
					ResultSet rs = db.executeQuery(sql);
					int flag = 0;

					while (rs.next()) {
						flag = 1;
						response.setHeader("refresh", "3;url=shouye1.jsp");
					}
					if (flag == 0) {
						out.println("<script language='javaScript'> alert('登录失败,请重新登录!');</script>");
						response.setHeader("refresh", "1;url=denglu.jsp");
					}
				}
			}}
			catch(Exception e)
			{
				System.out.println("数据库操作错误");
			}
	%>		
			
</body>
</html>