<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="BillDet.css" />
<meta charset="UTF-8">
<title>Edit Process Item</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}
	
	/*function validateForm() {
		if (document.UpdateForm.payment_mode.selectedIndex == 0){
			alert ("Please select your Payment Method");
			return false;
		}
	}*/
	/*function validateForm(){
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
	}*/
	function productDelete(ctl) {
	    $(ctl).parents("tr").remove();
	}
</script>

</head>
<%
	String item_id = request.getParameter("item_id");
	String dbUser = "D208199";
	String dbPasswd = "208199";
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
		String sql ="select * from items where item_id='"+item_id+"'";
		ResultSet rs = statement.executeQuery(sql);
		
		while(rs.next()){
		%>
<body>
	<form action="ItemConnect.jsp" method ="post">
	<h2>Update Item Details</h2>
	<div class="container">

		<table>
		<tr>
			<td><strong>ID:</strong></td>
			<td><input type="text" name="item_id" value="<%=rs.getString(1)%>"></td>
		</tr>
		<tr>
			<td><strong>NAME:</strong></td>
			<td><input type="text" name="item_name" value="<%=rs.getString(2)%>"></td>
		</tr>
		<tr>
			<td><strong>PRICE:</strong></td>
			<td><input type="text" name="item_price" value="<%=rs.getString(3)%>"></td>
		</tr>
		</table>

</div>
<div class="center">
<p> 
	<input id="buttonbackreset" name="Back" type="button" value="BACK" onclick="goBack()">
	<a href="DeleteItem.jsp?item_id=<%=rs.getString("item_id") %>"><button class="buttonn" type="button" onclick="return confirm('Are you sure you want to delete?')">DELETE</button></a>
	<input id="buttonsave" type="submit" value="SAVE" onclick="return confirm('Are you sure?')">
</div>
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