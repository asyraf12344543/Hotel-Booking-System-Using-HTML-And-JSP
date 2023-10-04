<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="UpdateForm.css" />
<meta charset="UTF-8">
<title>Update Process Room</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}

	function productDelete(ctl) {
	    $(ctl).parents("tr").remove();
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
		<%
		try{

		connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		statement=connection.createStatement();
		String sql ="select * from roomdet where Reserve_ID='"+Reserve_ID+"'";
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()){
		%>
<body>
	<form name ="UpdateForm" action="RoomUpdates.jsp" method ="post">
	<h2>Update Room Details</h2>
	<div><table>
	<tr> 
		<th align="left">Reservation ID: </th>
		<td> <% out.println(Reserve_ID); %>
	
		<input type="hidden" name="Reserve_ID" value="<%=resultSet.getString("Reserve_ID") %>"></td>
	</tr>
	
	<tr> 
		<th align="left">Room number:</th>
		<td><input type="text" name="Room_No" value="<%=resultSet.getString("Room_No") %>"></td>
	</tr>
	<tr> 
		<th align="left">Price:</th>
		<td><input type="text" name="Price" value="<%=resultSet.getString("Price") %>"></td>
	</tr>
	<tr> 
		<th align="left">Bed quantity:</th>
		<td><input type="text" name="Bed_Qty" value="<%=resultSet.getString("Bed_Qty") %>"></td>
	</tr>
	<tr> 
		<th align="left">Availability:</th>
		<td><input type="text" name="Availability" value="<%=resultSet.getString("Availability") %>"></td>
 
		<th align="left">Description:</th>
		<td><input type="text" name="Description" value="<%=resultSet.getString("Description") %>"></td>		
	</tr>
	
	<tr> 
		<td><input class="button_submit" type="submit" value="Submit" onclick="return confirm('Are you sure?')">
		<a href="DeleteRoom.jsp?Reserve_ID=<%=resultSet.getString("Reserve_ID") %>"><button type="button" class="delete" onclick="return confirm('Are you sure you want to delete?')">Delete</button></a>
		<input class="button" name = "Back" type="button" value="Back" onclick="goBack()">
		</td>		
	</tr>
	</table></div>
	</form>
	

<%
		}
		connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
%>

	
</body>
</html>