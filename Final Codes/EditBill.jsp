<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="BillDet.css" />
<meta charset="UTF-8">
<title>Edit Billing</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}
</script>
</head>
<%
	String bill_no = request.getParameter("bill_no");
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

<body>
	<h2 >Billing Details</h2>
	<h4 >[Edit-Mode Only]</h4>
	<div class="containerUpdate">
	<table border="1">
	<tr align="center">
			<td>Bill No.</td>
			<td>Reserve ID</td>
			<td>Guest ID</td>
			<td>Item 1</td>
			<td>Item 2</td>
			<td>Item 3</td>
			<td>Payment Date</td>
			<td>Payment Method</td>
			<td>Discount</td>
			<td>Total Payment</td>
			<td>Update</td>
		</tr>
		<%
		
		int count = 1;
		try{
			/*connection = DriverManager.getConnection(connectionUrl+database, userid, password);*/
			connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
			statement=connection.createStatement();
			String sql ="select * from payment";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
				<tr>
					<td><%=resultSet.getString("bill_no") %></td>
					<td><%=resultSet.getString("reserve_id") %></td>
					<td><%=resultSet.getString("guest_id") %></td>
					<td><%=resultSet.getString("item_id1") %></td>
					<td><%=resultSet.getString("item_id2") %></td>
					<td><%=resultSet.getString("item_id3") %></td>
					<td><%=resultSet.getString("discount") %></td>
					<td><%=resultSet.getString("payment_date") %></td>
					<td><%=resultSet.getString("payment_mode") %></td>
					<td><%=resultSet.getString("total_payment") %></td>
					<td><a href="EditBill2.jsp?bill_no=<%=resultSet.getString("bill_no")%>">update</a></td>
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
					<form action="Billing.html" method="GET">
					<p><button class="buttonn" >ADD NEW BILLING</button></p>
					</form>
					
					<form action="MainBilling.html" method="GET">
					<p><button class="buttonn">BACK</button></p>
					</form>

			</div>	
</body>
</html>