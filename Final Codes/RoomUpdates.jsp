<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Process Room</title>
</head>
<%
String Reserve_ID = request.getParameter("Reserve_ID");
String Room_No = request.getParameter("Room_No");
String Price = request.getParameter("Price");
String Bed_Qty = request.getParameter("Bed_Qty");
String Availability = request.getParameter("Availability");
String Description = request.getParameter("Description");
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
		String sql="Update roomdet set Reserve_ID=?,Room_No=?,Price=?,Bed_Qty=?,Availability=?,Description=? where Reserve_ID='"+Reserve_ID+"'";;
		ps = con.prepareStatement(sql);
		ps.clearParameters();
		ps.setString(1,Reserve_ID);
		ps.setString(2,Room_No);
		ps.setString(3,Price);
		ps.setString(4,Bed_Qty);
		ps.setString(5,Availability);
		ps.setString(6,Description);
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
<form action="RoomDetailsUpdate.jsp" method="GET"><button class= "button">Back</button></form>

</body>
</html>