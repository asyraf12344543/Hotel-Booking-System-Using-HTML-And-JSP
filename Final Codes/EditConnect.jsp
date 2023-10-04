<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Process Employee</title>
</head>
<%
	String bill_no = request.getParameter("bill_no");
	String reserve_id = request.getParameter("reserve_id");
	String guest_id = request.getParameter("guest_id");
	String item_id1 = request.getParameter("item_id1");
	String item_id2 = request.getParameter("item_id2");
	String item_id3 = request.getParameter("item_id3");
	String discount = request.getParameter("discount");
	String payment_date = request.getParameter("payment_date");
	String payment_mode = request.getParameter("payment_mode");
	String total_payment = request.getParameter("total_payment");
	String dbUser = "D208199";
	String dbPasswd = "208199";
	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";

	Connection con = null;
	PreparedStatement ps = null;
	//int personID = Integer.parseInt(id);
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		String sql="Update payment set bill_no=?,reserve_id=?,guest_id=?,item_id1=?,item_id2=?,item_id3=?,discount=?,payment_date=?,payment_mode=?,total_payment=? where bill_no='"+bill_no+"'";;
		ps = con.prepareStatement(sql);
		ps.clearParameters();
		ps.clearParameters();
		ps.setString(1, bill_no);
		ps.setString(2, reserve_id);
		ps.setString(3, guest_id);
		ps.setString(4, item_id1);
		ps.setString(5, item_id2);
		ps.setString(6, item_id3);
		ps.setString(7, discount);
		ps.setDate(8, java.sql.Date.valueOf(payment_date));
		ps.setString(9, payment_mode);
		ps.setString(10, total_payment);
		int i = ps.executeUpdate();
		if(i > 0)
		{
			out.print("Record Updated Successfully");
		}
		else
		{
			out.print("There is a problem in updating Record.");
		}
	}
	catch(SQLException sql)
	{
		request.setAttribute("error", sql);
	out.println(sql);
	}
//}
%>
<body>
<form action="EditBill.jsp" method="GET"><button class= "buttonn">Back</button></form>

</body>
</html>