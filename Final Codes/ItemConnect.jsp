<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Process Employee</title>
</head>
<%
	String item_id = request.getParameter("item_id");
	String item_name = request.getParameter("item_name");
	String item_price = request.getParameter("item_price");
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
		String sql="Update items set item_id=?,item_name=?,item_price=? where item_id='"+item_id+"'";;
		ps = con.prepareStatement(sql);
		ps.clearParameters();
		ps.clearParameters();
		ps.setString(1, item_id);
		ps.setString(2, item_name);
		ps.setString(3, item_price);
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
<form action="ItemBill.jsp" method="GET"><button class= "buttonn">Back</button></form>

</body>
</html>