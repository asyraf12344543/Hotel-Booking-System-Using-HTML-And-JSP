<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
	<%
	String bill_no=request.getParameter("bill_no");
	String dbUser = "D208181";
	String dbPasswd = "208181";
	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";
	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		Statement st=conn.createStatement();
		
		int i=st.executeUpdate("DELETE FROM payment WHERE bill_no="+bill_no);
		out.println("Data Deleted Successfully!");
		response.sendRedirect("EditBill.jsp");
	}
	catch(Exception e)
	{
		System.out.print(e);
		e.printStackTrace();
	}
	%>
<html>
<body>
	alert("Data Deleted Successfully!");		
</body>
</html>