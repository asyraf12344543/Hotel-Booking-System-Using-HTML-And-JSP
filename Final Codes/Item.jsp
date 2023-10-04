<%@ page contentType="text/html; charset=iso-8859-1" language="java" 
import="java.sql.*" errorPage="" %>
<%
//Create an empty new variable 
String message = null;
String item_id = request.getParameter("item_id");
String item_name = request.getParameter("item_name");
String item_price = request.getParameter("item_price");
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
stmt=conn.prepareStatement("insert into items values(?,?,?)");
stmt.clearParameters();
stmt.setString(1, item_id);
stmt.setString(2, item_name);
stmt.setString(3, item_price);
//Run the query
stmt.executeUpdate();
conn.commit();
out.println("<p> <b> Your info have been submitted !</b></p>");
//Close the database connection
stmt.close();
conn.close();
} catch (SQLException ex) {
out.println("<p><b> Could not be submitted due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
stmt.close();
conn.close();
} 
%>