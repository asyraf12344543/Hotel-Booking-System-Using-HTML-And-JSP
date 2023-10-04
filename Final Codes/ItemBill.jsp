<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="BillDet.css" />
<meta charset="UTF-8">
<title>Edit Item</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}
</script>
</head>
<%
	String item_id = request.getParameter("item_id");
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
	<h2>Item Details</h2>
	<h4>[Edit-Mode Only]</h4>
	<div class="containerUpdate">
	<table border="1">
	<tr align="center">
			<td>ID</td>
			<td>Name</td>
			<td>Price</td>
			<td>Update</td>
		</tr>
		<%
		
		int count = 1;
		try{
			/*connection = DriverManager.getConnection(connectionUrl+database, userid, password);*/
			connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
			statement=connection.createStatement();
			String sql ="select * from items";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
				<tr>
					<td><%=resultSet.getString("item_id") %></td>
					<td><%=resultSet.getString("item_name") %></td>
					<td><%=resultSet.getString("item_price") %></td>
					<td><a href="ItemBill2.jsp?item_id=<%=resultSet.getString("item_id")%>">update</a></td>
				</tr>
			<%
			}
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</table>
			</div>
			<div class="center">
					<form action="Item.html" method="GET">
					<p><button class="buttonn" >ADD NEW ITEM</button></p>
					</form>
					
					<form action="MainBilling.html" method="GET">
					<p><button class="buttonn">BACK</button></p>
					</form>

			</div>	
</body>
</html>