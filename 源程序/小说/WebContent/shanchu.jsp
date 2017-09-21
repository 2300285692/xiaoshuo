<%@ page import="java.sql.*"  language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DBBean" scope="page">
<%
String shuming = request.getParameter("shuming");
int i = db.executeUpdate("delete from shu where shuming='" + shuming+"'");
System.out.println("delete from shu where shuming=" + shuming);
if (i == 1) {
	out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到主页！');</script>");
	response.setHeader("refresh", "1;url=shouye2.jsp");
} else {
	out.println("<script language='javaScript'> alert('删除失败，点击确定后自动跳到主页！');</script>");
	response.setHeader("refresh", "1;url=shouye2.jsp");
}
// 		con.close();
db.close();
%>
</jsp:useBean>

</body>
</html>