<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Process Guest</title>
</head>
<%
	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	String ic_no = request.getParameter("ic_no");
	String passport_no = request.getParameter("passport_no");
	String address = request.getParameter("address");				
	String email = request.getParameter("email");
	String mobile_no = request.getParameter("mobile_no");
	String guest_id = request.getParameter("guest_id");	
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
		String sql="Update guest set first_name=?,last_name=?,ic_no=?,passport_no=?,address=?,email=?, mobile_no=?,guest_id=? where guest_id='"+guest_id+"'";;
		ps = con.prepareStatement(sql);
		ps.clearParameters();
		ps.setString(1,first_name);
		ps.setString(2,last_name);
		ps.setString(3,ic_no);
		ps.setString(4,passport_no);
		ps.setString(5,address);
		ps.setString(6,email);
		ps.setString(7,mobile_no);
		ps.setString(8,guest_id);
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
<form action="GuestDetails.jsp" method="GET"><button class= "button">Back</button></form>

</body>
</html>