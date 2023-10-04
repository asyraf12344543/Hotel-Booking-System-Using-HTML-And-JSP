<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Process Reservation</title>
</head>
<%
String Reserve_ID = request.getParameter("Reserve_ID");
String No_Of_Adult = request.getParameter("No_Of_Adult");
String No_Of_Children = request.getParameter("No_Of_Children");
String Reserve_Date = request.getParameter("Reserve_Date");
String Checkin_Date = request.getParameter("Checkin_Date");
String Checkout_Date = request.getParameter("Checkout_Date");
String Reserve_Time = request.getParameter("Reserve_Time");
String Special_Req = request.getParameter("Special_Req");
	String dbUser = "D208181";
	String dbPasswd = "208181";
	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";

	Connection con = null;
	PreparedStatement ps = null;
	//int personID = Integer.parseInt(id);
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		String sql="Update reservedetails set Reserve_ID=?,No_Of_Adult=?,No_Of_Children=?,Reserve_Date=?,Checkin_Date=?,Checkout_Date=?, Reserve_Time=?,Special_Req=? where Reserve_ID='"+Reserve_ID+"'";;
		ps = con.prepareStatement(sql);
		ps.clearParameters();
		ps.setString(1,Reserve_ID);
		ps.setString(2,No_Of_Adult);
		ps.setString(3,No_Of_Children);
		ps.setString(4,Reserve_Date);
		ps.setString(5,Checkin_Date);
		ps.setString(6,Checkout_Date);
		ps.setString(7,Reserve_Time);
		ps.setString(8,Special_Req);
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
<form action="ReservationUpdate.jsp" method="GET"><button class= "button">Back</button></form>

</body>
</html>