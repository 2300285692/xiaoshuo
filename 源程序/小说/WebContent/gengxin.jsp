<%@ page import="java.sql.*" pageEncoding="UTF-8" errorPage="error.jsp"%>
<html>
<head>
<title>修改完成</title>
</head>
<body>
	<jsp:useBean id="db" class="bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String leibie = request.getParameter("leibie");
		String shuhao = request.getParameter("shuhao");
		String shuming = request.getParameter("shuming");
		String zuozhe = request.getParameter("zuozhe");

		String sql = "update shu set leibie='" + leibie + "',zuozhe='" + zuozhe+ "',shuhao='" + shuhao
				+ "' where shuming='" + shuming+"'";
		int i = db.executeUpdate(sql);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('修改成功，点击确定后自动跳到主页。');</script>");
			response.setHeader("refresh", "1;url=shouye2.jsp");
		}
		db.close();
		// 		con.close();
	%>
</body>
</html>
