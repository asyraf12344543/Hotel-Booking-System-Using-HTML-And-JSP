<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="Colour_Purple.css" />
<meta charset="UTF-8">
<title>View Employee</title>

</head>
<%
	String dbUser = "D208181";
	String dbPasswd = "208181";
	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<body>
	<h2>Employee Details</h2>
	<h4>[View-Mode Only]</h4>
	<table border="1">
	<tr align="center">
			<td>Job ID</td>
			<td>ID</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Gender</td>
			<td>Phone Number</td>
			<td>Address</td>
			<td>Email</td>
			<td>Vaccine Type</td>
			<td>First Dose</td>
			<td>Second Dose</td>
			<td>Hire Date</td>
			<td>Salary</td>
			<td>Password</td>
		</tr>
		<%

		int count = 1;
		try{
			/*connection = DriverManager.getConnection(connectionUrl+database, userid, password);*/
			connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
			statement=connection.createStatement();
			String sql ="select * from Hotel_Employee";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
				<tr>
					<td><%=resultSet.getString("job_ID") %></td>
					<td><%=resultSet.getString("ID") %></td>
					<td><%=resultSet.getString("firstname") %></td>
					<td><%=resultSet.getString("lastname") %></td>
					<td><%=resultSet.getString("gender") %></td>
					<td><%=resultSet.getString("phone_num") %></td>
					<td><%=resultSet.getString("address") %></td>
					<td><%=resultSet.getString("email") %></td>
					<td><%=resultSet.getString("vacc_type") %></td>
					<td><%=resultSet.getString("vacc_first") %></td>
					<td><%=resultSet.getString("vacc_second") %></td>
					<td><%=resultSet.getString("hire_date") %></td>
					<td><%=resultSet.getString("salary") %></td>
					<td><%=resultSet.getString("password1") %></td>
				</tr>
			<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</table>	
<form action="Update_Emp.jsp" method="GET"><button class= "button">Edit Employee</button></form>					
<form action="MainEmployee.html" method="GET"><button class= "button" >Back</button></form>
</body>
</html>