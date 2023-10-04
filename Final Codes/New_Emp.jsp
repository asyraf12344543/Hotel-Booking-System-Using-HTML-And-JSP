<%@ page contentType="text/html; charset=iso-8859-1" language="java" 
import="java.sql.*" errorPage="" %>
<%
	//Create an empty new variable 
	String message = null;
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
	PreparedStatement stmt = null;
	Connection conn = null; 
	
	try {
		//Connect to the database
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String hostname = "119.40.117.30";
		int port = 1521;
		String sid = "fsktm";
		String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
		String user = "D208181";
		String pass = "208181";
		conn = DriverManager.getConnection(oracleURL, user, pass);
		conn.setAutoCommit(false);

		// Make the query
		stmt=conn.prepareStatement("insert into Hotel_Employee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		stmt.clearParameters();
		stmt.setString(1,job_ID);
		stmt.setString(2,ID);
		stmt.setString(3,firstname);
		stmt.setString(4,lastname);
		stmt.setString(5,gender);
		stmt.setString(6,phone_num);
		stmt.setString(7,address);
		stmt.setString(8,email);
		stmt.setString(9,vacc_type);
		stmt.setString(10,vacc_first);
		stmt.setString(11,vacc_second);
		stmt.setString(12,hire_date);
		stmt.setString(13,salary);
		stmt.setString(14,password1);
	
		//Run the query
		stmt.executeUpdate();
		conn.commit();
		//out.println("<p> <b> You have been registered !</b></p>");
		response.sendRedirect("Update_Emp.jsp");
		//Close the database connection
		stmt.close();
		conn.close();
	} 
	
	catch (SQLException ex) {
		out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
		stmt.close();
		conn.close();
	} 
%>
<html>
<body>
	alert("You have been registered !");
</body>
</html>