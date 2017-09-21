<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>小说查找</title>
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
<body background="kk.jpg">
    <form action="chazhao.jsp" method="post">
		<table>
			<caption>查找界面</caption>
			<tr>
				<th>书名：</th>
				<td><input name="shuming" type="text"></td>
			</tr>
			
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="查找">
					</th>
			</tr>
		</table>
		
	</form>
  <jsp:useBean id="db" class="bean.DBBean" scope="page"/>

        <%
		request.setCharacterEncoding("UTF-8");
        String submit = request.getParameter("submit");
        try{
			if (submit != null && !submit.equals("")) {
				String shuming = request.getParameter("shuming");
				String sql = "select * from shu where shuming='" + shuming + "'";
				ResultSet rs = db.executeQuery(sql);
				int flag = 0;

				while (rs.next()) {
						flag = 1;
						out.println("<tr>");
						out.println("类型：");
						out.println("<td>"+rs.getString(1)+"</td>");
						out.println("</br>");
						out.println("书号：");
						out.println("<td>"+rs.getString(2)+"</td>");
						out.println("</br>");
						out.println("书名：");
						out.println("<td>"+rs.getString(3)+"</td>");
						out.println("</br>");
						out.println("作者：");
						out.println("<td>"+rs.getString(4)+"</td>");
					}
					if (flag == 0) {
						out.println("<script language='javaScript'> alert('未收录这本书!');</script>");
						response.setHeader("refresh", "1;url=chazhao.jsp");
					}
				}
			}
			catch(Exception e)
			{
				System.out.println("数据库操作错误");
			}
		
			%>
			
</body>
</html>