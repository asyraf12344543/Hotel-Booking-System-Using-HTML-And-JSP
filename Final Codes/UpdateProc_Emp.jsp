<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type="text/css" href="Colour_Purple.css" />
<meta charset="UTF-8">
<title>Update Process Employee</title>

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
	String job_ID = request.getParameter("job_ID");
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
		String sql ="select * from Hotel_Employee where job_ID='"+job_ID+"'";
		resultSet = statement.executeQuery(sql);
		
		while(resultSet.next()){
		%>
<body>
	<form name ="UpdateForm" action="UpdateProc_Emp2.jsp" method ="post">
	<h2>Update Employee Details</h2>
	<div><table>
	<tr> 
		<th align="left">Job ID </th>
		<td> <% out.println(job_ID); %>
	
		<input type="hidden" name="job_ID" value="<%=resultSet.getString("job_ID") %>"></td>
	</tr>
	<tr> 
		<th align="left">ID:</th>
		<td><input type="text" name="ID" value="<%=resultSet.getString("ID") %>"></td>
	</tr>
	<tr> 
		<th align="left">First Name:</th>
		<td><input type="text" name="firstname" value="<%=resultSet.getString("firstname") %>"></td>
	</tr>
	<tr> 
		<th align="left">Last Name:</th>
		<td><input type="text" name="lastname" value="<%=resultSet.getString("lastname") %>"></td>
	</tr>
	<tr> 
		<th align="left">Gender:</th>
		<td><input type="text" name="gender" value="<%=resultSet.getString("gender") %>"></td>
 
		<th align="left">Phone Number:</th>
		<td><input type="text" name="phone_num" value="<%=resultSet.getString("phone_num") %>"></td>		
	</tr>
	<tr> 
		<th align="left">Address:</th>
		<td><input type="text" name="address" value="<%=resultSet.getString("address") %>"></td>
	</tr>
	<tr> 
		<th align="left">Email:</th>
		<td><input type="email" name="email" value="<%=resultSet.getString("email") %>"></td>
	</tr>
	<tr> 
		<th align="left">Vaccine Type:</th>
		<td><input type="text" name="vacc_type" value="<%=resultSet.getString("vacc_type") %>"></td>
	</tr>
	<tr> 
		<th align="left">First Dose:</th>
		<td><input type="text" name="vacc_first" value="<%=resultSet.getString("vacc_first") %>"></td>
 
		<th align="left">Second Dose:</th>
		<td><input type="text" name="vacc_second" value="<%=resultSet.getString("vacc_second") %>"></td>
	</tr>
	<tr> 
		<th align="left">Hire Date:</th>
		<td><input type="text" name="hire_date" value="<%=resultSet.getString("hire_date") %>"></td>
 
		<th align="left">Salary:</th>
		<td><input type="text" name="salary" value="<%=resultSet.getString("salary") %>"></td>
	</tr>
	<tr> 
		<th align="left">Account Password:</th>
		<td><input type="text" name="password1" value="<%=resultSet.getString("password1") %>"></td>
	</tr>
	<tr> 
		<td><input class="button_submit" type="submit" value="submit" onclick="return confirm('Are you sure?')">
		<a href="Delete.jsp?job_ID=<%=resultSet.getString("job_ID") %>"><button type="button" class="delete" onclick="return confirm('Are you sure you want to delete?')">Delete</button></a>
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

	<input class="button" name = "Back" type="button" value="Back" onclick="goBack()">
</body>
</html>