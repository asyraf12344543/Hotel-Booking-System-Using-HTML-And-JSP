<%@ page contentType="text/html; charset=iso-8859-1" language="java" 
import="java.sql.*" errorPage="" %>
<%

//Create an empty new variable 
String message = null;
String first_name = request.getParameter("first_name");
String last_name = request.getParameter("last_name");
String ic_no = request.getParameter("ic_no");
String passport_no = request.getParameter("passport_no");
String address = request.getParameter("address");
String email = request.getParameter("email");
String mobile_no = request.getParameter("mobile_no");
String guest_id = request.getParameter("guest_id");

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
	stmt=conn.prepareStatement("insert into guest values(?,?,?,?,?,?,?,?)");
	stmt.clearParameters();
	stmt.setString(1,first_name);
	stmt.setString(2,last_name);
	stmt.setString(3,ic_no);
	stmt.setString(4,passport_no);
	stmt.setString(5,address);
	stmt.setString(6,email);
	stmt.setString(7,mobile_no);
	stmt.setString(8,guest_id);

	//Run the query
	stmt.executeUpdate();
	conn.commit();
	out.println("<p> <b> Guest details saved !</b></p>");

	//Close the database connection
	stmt.close();
	conn.close();
} catch (SQLException ex) {
out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
stmt.close();
conn.close();
} 

%> 