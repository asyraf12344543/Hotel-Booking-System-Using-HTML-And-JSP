<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="UpdateForm.css" />
<meta charset="UTF-8">
<title>Update Process Guest</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}
	function validateForm(){
		if (document.UpdateForm.password2.value == null || document.UpdateForm.password2.value =="")
		{
			alert("Please confirm password");
			return false;
		} 
		else {
			if (document.UpdateForm.password1.value != document.UpdateForm.password2.value) 
			{
				alert("Password does not match");
				return false;
			}	 
		}
	}
	function productDelete(ctl) {
	    $(ctl).parents("tr").remove();
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
		<%
		try{

		connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		statement=connection.createStatement();
		String sql ="select * from guest where guest_id='"+guest_id+"'";
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()){
		%>
<body>
	<form name ="UpdateForm" action="GuestUpdateSubmit.jsp" method ="post">
	<h2>Update Guest Details</h2>
	<div><table>
	<tr> 
		<th align="left">Guest ID </th>
		<td> <% out.println(guest_id); %>
	
		<input type="hidden" name="guest_id" value="<%=resultSet.getString("guest_id") %>"></td>
	</tr>
	<tr> 
		<th align="left">First Name:</th>
		<td><input type="text" name="first_name" value="<%=resultSet.getString("first_name") %>"></td>
	</tr>
	<tr> 
		<th align="left">Last Name:</th>
		<td><input type="text" name="last_name" value="<%=resultSet.getString("last_name") %>"></td>
	</tr>
	<tr> 
		<th align="left">IC No.:</th>
		<td><input type="text" name="ic_no" value="<%=resultSet.getString("ic_no") %>"></td>
	</tr>
	<tr> 
		<th align="left">Passport No.:</th>
		<td><input type="text" name="passport_no" value="<%=resultSet.getString("passport_no") %>"></td>
 
		<th align="left">Address:</th>
		<td><input type="text" name="address" value="<%=resultSet.getString("address") %>"></td>		
	</tr>
	<tr> 
		<th align="left">Email:</th>
		<td><input type="text" name="email" value="<%=resultSet.getString("email") %>"></td>
	</tr>
	<tr> 
		<th align="left">Mobile No.:</th>
		<td><input type="text" name="mobile_no" value="<%=resultSet.getString("mobile_no") %>"></td>
	</tr>
	<tr> 
		<th align="left">Guest ID:</th>
		<td><input type="text" name="guest_id" value="<%=resultSet.getString("guest_id") %>"></td>
	</tr>
	
	<tr> 
		<td><input class="button_submit" type="submit" value="Submit" onclick="return confirm('Are you sure?')">
		<a href="DeleteGuest.jsp?guest_id=<%=resultSet.getString("guest_id") %>"><button type="button" class="delete" onclick="return confirm('Are you sure you want to delete?')">Delete</button></a>
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