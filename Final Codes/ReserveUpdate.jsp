<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="UpdateForm.css" />
<meta charset="UTF-8">
<title>Update Process Reservation</title>

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
		String sql ="select * from reservedetails where Reserve_ID='"+Reserve_ID+"'";
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()){
		%>
<body>
	<form name ="UpdateForm" action="ReservationUpdateSubmit.jsp" method ="post">
	<h2>Update Reservation Details</h2>
	<div><table>
	<tr> 
		<th align="left">Reservation ID: </th>
		<td> <% out.println(Reserve_ID); %>
	
		<input type="hidden" name="Reserve_ID" value="<%=resultSet.getString("Reserve_ID") %>"></td>
	</tr>
	<tr> 
		<th align="left">No. of adults:</th>
		<td><input type="text" name="No_Of_Adult" value="<%=resultSet.getString("No_Of_Adult") %>"></td>
	</tr>
	<tr> 
		<th align="left">No. of children:</th>
		<td><input type="text" name="No_Of_Children" value="<%=resultSet.getString("No_Of_Children") %>"></td>
	</tr>
	<tr> 
		<th align="left">Reservation date:</th>
		<td><input type="text" name="Reserve_Date" value="<%=resultSet.getString("Reserve_Date") %>"></td>
	</tr>
	<tr> 
		<th align="left">Check-in Date:</th>
		<td><input type="text" name="Checkin_Date" value="<%=resultSet.getString("Checkin_Date") %>"></td>
 
		<th align="left">Check-out Date:</th>
		<td><input type="text" name="Checkout_Date" value="<%=resultSet.getString("Checkout_Date") %>"></td>		
	</tr>
	<tr> 
		<th align="left">Reservation time:</th>
		<td><input type="text" name="Reserve_Time" value="<%=resultSet.getString("Reserve_Time") %>"></td>
	</tr>
	<tr> 
		<th align="left">Special Request:</th>
		<td><input type="text" name="Special_Req" value="<%=resultSet.getString("Special_Req") %>"></td>
	</tr>
	
	<tr> 
		<td><input class="button_submit" type="submit" value="Submit" onclick="return confirm('Are you sure?')">
		<a href="DeleteReservation.jsp?Reserve_ID=<%=resultSet.getString("Reserve_ID") %>"><button type="button" class="delete" onclick="return confirm('Are you sure you want to delete?')">Delete</button></a>
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