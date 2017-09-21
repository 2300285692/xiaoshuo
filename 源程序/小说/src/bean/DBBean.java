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
			System.out.println("�޷�ͬ���ݿ⽨�����ӣ�");
		}
	}

	public int executeUpdate(String s) {
		int result = 0;
		try {
			result = stmt.executeUpdate(s);
		} catch (Exception ex) {
			System.out.println("ִ�в�ѯ����");
		}
		return result;
	}

	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception ex) {
			System.out.println("ִ�и��´���");
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
		System.out.println("���������ɹ���");
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("��������ʧ�ܣ�");
	}
	try{
		Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
			System.out.println("�������ݿ�ɹ���");
	}catch(Exception e)
	{
		e.printStackTrace();
		System.out.print("���ݿ�����ʧ�ܣ�");
	}		
	}

}*/
