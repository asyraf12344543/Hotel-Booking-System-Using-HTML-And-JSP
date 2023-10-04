<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="BillDet.css" />
<meta charset="UTF-8">
<title>Edit Process Billing</title>

<script type="text/javascript">
	function goBack() {
	  	window.history.back();
	}
	
	function validateForm() {
		if (document.UpdateForm.payment_mode.selectedIndex == 0){
			alert ("Please select your Payment Method");
			return false;
		}
		if ((document.myForm.item_id1.checked == false) && (document.myForm.item_id1.checked == false) && (document.myForm.item_id1.checked == false)){
			alert ("Please check the Item box");
			return false;
		}
	}

	function productDelete(ctl) {
	    $(ctl).parents("tr").remove();
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
		<%
		try{

		connection=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		statement=connection.createStatement();
		String sql ="select * from payment where bill_no='"+bill_no+"'";
		ResultSet rs = statement.executeQuery(sql);
		
		while(rs.next()){
		%>
<body>
	<form name="UpdateForm" action="EditConnect.jsp" method ="post">
	<h2>Update Billing Details</h2>
	<div class="container">

		<table>
		<tr>
			<td><strong>Bill No.:</strong></td>
			<td></td>
			<td><input type="text" name="bill_no" value="<%=rs.getString(1)%>" readonly></td>
			<td><strong>Payment Date:</strong></td>
			<td></td>
			<td><input id= "datee" type="date" name="payment_date" value="<%=rs.getDate(8)%>"></td>
		</tr>
		<tr>
			<td><strong>Reserve ID:</strong></td>
			<td></td>
			<td><input type="text" name="reserve_id" value="<%=rs.getString(2)%>"></td>
			<td><strong>Guest ID:</strong></td>
			<td></td>
			<td><input type="text" name="guest_id" value="<%=rs.getString(3)%>"></td>
		</tr>
		<tr>
			<td id="item"><strong>Item:</strong></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td id="item"><input type="checkbox" name="item_id1" value="<%=rs.getString(4)%>" />01</td>
			<td id="paymentdropdown"><input type="checkbox" name="item_id2" value="<%=rs.getString(5)%>"/>02</td>
			<td><input type="checkbox" name="item_id3" value="<%=rs.getString(6)%>"/>03</td>
		</tr>
		<tr>
			<td colspan="2" id= "paymentmeth"><strong>Payment Method:</strong></td>
			<td></td>
			<td><strong>Discount:</strong></td>
			<td></td>
			<td><input type="text" name="discount" value="<%=rs.getString(7)%>"></td>
		</tr>
				<tr>
			<td colspan="3" id="paymentdropdown"><select name= "payment_mode" value="<%=rs.getString(9)%>">
				<option value="">Select Payment Method</option>
				<option value="Cash">Cash</option>
				<option value="Cheque">Cheque</option>
				<option value="Debit / Credit Card">Debit/Credit Card</option>
				<option value="Online Banking">Online Banking</option>
				<option value="FPX">FPX</option>
				</select></td>
				<td><strong>Total Payment:</strong></td>
				<td></td>
				<td><input type="text" name="total_payment" value="<%=rs.getString(10)%>"></td>
		</tr>
		</table>

</div>
<div class="center">
<p> 
	<input id="buttonbackreset" name="Back" type="button" value="BACK" onclick="goBack()">
	<a href="DeleteBill.jsp?bill_no=<%=rs.getString("bill_no") %>"><button class="buttonn" type="button" onclick="return confirm('Are you sure you want to delete?')">DELETE</button></a>
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