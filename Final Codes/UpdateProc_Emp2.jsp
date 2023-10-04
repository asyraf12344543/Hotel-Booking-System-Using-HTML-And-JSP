<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Process Employee</title>
</head>
<%
	String job_ID = request.getParameter("job_ID");
	String ID = request.getParameter("ID");
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String gender = request.getParameter("gender");				
	String phone_num = request.getParameter("phone_num");
	String address = request.getParameter("address");
	String email = request.getParameter("email");	
	String vacc_type = request.getParameter("vacc_type");		
	String vacc_first = request.getParameter("vacc_first");		
	String vacc_second = request.getParameter("vacc_second");	
	String hire_date = request.getParameter("hire_date");
	String salary = request.getParameter("salary");
	String password1 = request.getParameter("password1");
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
		String sql="Update Hotel_Employee set job_ID=?,ID=?,firstname=?,lastname=?,gender=?,phone_num=?,address=?,email=?,vacc_type=?,vacc_first=?,vacc_second=?,hire_date=?,salary=?,password1=? where job_ID='"+job_ID+"'";;
		ps = con.prepareStatement(sql);
		ps.clearParameters();
		ps.setString(1,job_ID);
		ps.setString(2,ID);
		ps.setString(3,firstname);
		ps.setString(4,lastname);
		ps.setString(5,gender);
		ps.setString(6,phone_num);
		ps.setString(7,address);
		ps.setString(8,email);
		ps.setString(9,vacc_type);
		ps.setString(10,vacc_first);
		ps.setString(11,vacc_second);
		ps.setString(12,hire_date);
		ps.setString(13,salary);
		ps.setString(14,password1);
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
<form action="Update_Emp.jsp" method="GET"><button class= "button">Back</button></form>

</body>
</html>