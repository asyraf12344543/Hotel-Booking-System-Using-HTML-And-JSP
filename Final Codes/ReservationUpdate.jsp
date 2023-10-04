<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="UpdateTable.css" />
<meta charset="UTF-8">
<title>Update Reservation Details</title>

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
	<h1>Reservation Details</h1>
	<h4>[Click Update to edit reservation information]</h4>
	<table border="1">
	<tr align="center">
			<td>Reservation ID</td>
			<td>No. of Adult</td>
			<td>No. of Children</td>
			<td>Reservation Date</td>
			<td>Check-in Date</td>
			<td>Check-out Date</td>
			<td>Reservation Time</td>
			<td>Special Request</td>
			<td>Update</td>
		</tr>
		<%
		
		int count = 1;
		try{
			/*connection = DriverManager.getConnection(connectionUrl+database, userid, password);*/
			connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
			statement=connection.createStatement();
			String sql ="select * from reservedetails";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
				<tr>
					<td><%=resultSet.getString("Reserve_ID") %></td>
					<td><%=resultSet.getString("No_Of_Adult") %></td>
					<td><%=resultSet.getString("No_Of_Children") %></td>
					<td><%=resultSet.getString("Reserve_Date") %></td>
					<td><%=resultSet.getString("Checkin_Date") %></td>
					<td><%=resultSet.getString("Checkout_Date") %></td>
					<td><%=resultSet.getString("Reserve_Time") %></td>
					<td><%=resultSet.getString("Special_Req") %></td>
					<td><a href="ReserveUpdate.jsp?Reserve_ID=<%=resultSet.getString("Reserve_ID")%>">update</a></td>
				</tr>
			<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</table>
			
			<form action="ReservationHTML.html" method="GET"><button class= "button" >Back</button></form>
			
</body>
</div>
</html>