<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<link rel = "stylesheet" type="text/css" href="Colour_Purple.css" />

<title>Search Employee</title>
<body> 
<%

	String dbUser = "D208181";
	String dbPasswd = "208181";
	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";
	String job_ID= request.getParameter("job_ID");
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet resultSet = null;

	try{
		conn=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		stmt=conn.createStatement();
		//String query ="select * from Hotel_Employee where job_ID='"+job_ID+"'";
		String query = "Select job_ID, ID, firstname, phone_num, email from Hotel_Employee where job_ID ='"+ job_ID+ "'";
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
%>
<body>
		
		<form method="post" action="Search_Emp.html"> 
		<table>
			<tr>
				<td>
				<h2>Search Employee</h2>
				<p>by Job ID</p>
				</td>
			</tr>
			<tr>
				<td><strong>Job ID </strong></td><td>:</td>
				<td><input disabled name= "job_ID" type="text" value="<%=rs.getString("job_ID")%>"></td>
			</tr>	
			<tr>
				<td><strong>ID </strong></td><td>:</td>
				<td><input disabled name= "ID" type="text" value="<%=rs.getString("ID")%>"></td>
			</tr>	
			<tr>
				<td><strong>First Name</strong></td><td>:</td>
				<td><input disabled name= "firstname" type="text" value="<%=rs.getString("firstname")%>"></td>
			</tr>	
			<tr>
				<td><strong>Phone Number</strong></td><td>:</td>
				<td><input disabled name= "phone_num" type="text" value="<%=rs.getString("phone_num")%>"></td>
			</tr>	
			<tr>
				<td><strong>Email</strong></td><td>:</td>
				<td> <input disabled name= "email" type="text" value="<%=rs.getString("email")%>"></td>
			</tr>
		</table> 
		
		<p><input type="submit" name="BACK" value="BACK"></p>
		</form>
<%
		}
		conn.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>