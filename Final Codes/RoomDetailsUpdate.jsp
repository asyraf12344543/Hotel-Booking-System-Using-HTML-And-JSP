<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="UpdateTable.css" />
<meta charset="UTF-8">
<title>Update Room Details</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}
</script>
</head>

<%
	String Reserve_ID = request.getParameter("Reserve_ID");
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
	<h1>Room Details</h1>
	<h4>[Click Update to edit room information]</h4>
	<table border="1">
	<tr align="center">
			<td>Reservation ID</td>
			<td>Room number</td>
			<td>Price</td>
			<td>Bed quantity</td>
			<td>Availability</td>
			<td>Description</td>
			<td>Update</td>
		</tr>
		<%
		
		int count = 1;
		try{
			/*connection = DriverManager.getConnection(connectionUrl+database, userid, password);*/
			connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
			statement=connection.createStatement();
			String sql ="select * from roomdet";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
				<tr>
					<td><%=resultSet.getString("Reserve_ID") %></td>
					<td><%=resultSet.getString("Room_No") %></td>
					<td><%=resultSet.getString("Price") %></td>
					<td><%=resultSet.getString("Bed_Qty") %></td>
					<td><%=resultSet.getString("Availability") %></td>
					<td><%=resultSet.getString("Description") %></td>
					<td><a href="RoomUpdate.jsp?Reserve_ID=<%=resultSet.getString("Reserve_ID")%>">update</a></td>
				</tr>
			<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</table>
			
			<form action="RoomHTML.html" method="GET"><button class= "button" >Back</button></form>
			
</body>
</div>
</html>