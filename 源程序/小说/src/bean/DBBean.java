package bean;

import java.sql.*;

public class DBBean {
	private String driverStr = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String connStr = "jdbc:sqlserver://localhost:1433;DatabaseName=xiaoshuo";
	private String dbusername = "sa";
	private String dbpassword = "123";
	private Connection conn = null;
	private Statement stmt = null;

	public DBBean() {
		try {
			Class.forName(driverStr);
			conn = DriverManager.getConnection(connStr, dbusername, dbpassword);
			stmt = conn.createStatement();
			
		} catch (Exception ex) {
			System.out.println("无法同数据库建立连接！");
		}
	}

	public int executeUpdate(String s) {
		int result = 0;
		try {
			result = stmt.executeUpdate(s);
		} catch (Exception ex) {
			System.out.println("执行查询错误！");
		}
		return result;
	}

	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception ex) {
			System.out.println("执行更新错误！");
		}
		return rs;
	}

	public void close() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
		}
	}
}

/*public class DBBean {
	public static void main(String [] args)
	 {
	  String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	  String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=xiaoshuo";
	  String userName="sa";
	  String userPwd="123";
	 try
	{
		Class.forName(driverName);
		System.out.println("加载驱动成功！");
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("加载驱动失败！");
	}
	try{
		Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
			System.out.println("连接数据库成功！");
	}catch(Exception e)
	{
		e.printStackTrace();
		System.out.print("数据库连接失败！");
	}		
	}

}*/
