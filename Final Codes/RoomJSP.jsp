<%@ page contentType="text/html; charset=iso-8859-1" language="java"
import="java.sql.*" errorPage="" %>
<%
//Create an empty new variable
String message = null;
String Reserve_ID = request.getParameter("Reserve_ID");
String Room_No = request.getParameter("Room_No");
String Price = request.getParameter("Price");
String Bed_Qty = request.getParameter("Bed_Qty");
String Availability = request.getParameter("Availability");
String Description = request.getParameter("Description");
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
stmt=conn.prepareStatement("insert into roomdet values(?,?,?,?,?,?)");
stmt.clearParameters();
stmt.setString(1, Reserve_ID);
stmt.setString(2, Room_No);
stmt.setString(3, Price);
stmt.setString(4, Bed_Qty);
stmt.setString(5, Availability);
stmt.setString(6, Description);
//Run the query
stmt.executeUpdate();
conn.commit();
out.println("<p> <b> Room details saved!</b></p>");
//Close the database connection
stmt.close();
conn.close();
} catch (SQLException ex) {
out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
stmt.close();
conn.close();
}
%>