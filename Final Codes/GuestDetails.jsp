<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="UpdateTable.css" />
<meta charset="UTF-8">
<title>Update Guest</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}
</script>
</head>

<%
	String guest_id = request.getParameter("guest_id");
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

<div class = "a">
<body>
	<h1>Guest Details</h1>
	<h4>[Click Update to edit guest information]</h4>
	<table border="1">
	<tr align="center">
			<td>First Name</td>
			<td>Last Name</td>
			<td>IC No.</td>
			<td>Passport No.</td>
			<td>Address</td>
			<td>Email</td>
			<td>Mobile No.</td>
			<td>Guest ID</td>
			<td>Update</td>
		</tr>
		<%
		
		int count = 1;
		try{
			/*connection = DriverManager.getConnection(connectionUrl+database, userid, password);*/
			connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
			statement=connection.createStatement();
			String sql ="select * from guest";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
				<tr>
					<td><%=resultSet.getString("first_name") %></td>
					<td><%=resultSet.getString("last_name") %></td>
					<td><%=resultSet.getString("ic_no") %></td>
					<td><%=resultSet.getString("passport_no") %></td>
					<td><%=resultSet.getString("address") %></td>
					<td><%=resultSet.getString("email") %></td>
					<td><%=resultSet.getString("mobile_no") %></td>
					<td><%=resultSet.getString("guest_id") %></td>
					<td><a href="GuestUpdate.jsp?guest_id=<%=resultSet.getString("guest_id")%>">update</a></td>
				</tr>
			<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</table>
			
			<form action="GuestRegister.html" method="GET"><button class= "button" >Back</button></form>
			
</body>
</div>
</html>