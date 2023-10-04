<%@ page contentType="text/html; charset=iso-8859-1" language="java" 
import="java.sql.*" errorPage="" %>
<%
//Create an empty new variable 
String message = null;
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
PreparedStatement stmt = null;
Connection conn = null; 
try {
//Connect to the database
Class.forName("oracle.jdbc.driver.OracleDriver");
String hostname = "119.40.117.30";
int port = 1521;
String sid = "fsktm";
String oracleURL = "jdbc:oracle:thin:@"+hostname+":"+port+":"+sid;
String user = "D208199";
String pass = "208199";
conn = DriverManager.getConnection(oracleURL, user, pass);
conn.setAutoCommit(false);

// Make the query
stmt=conn.prepareStatement("insert into payment values(?,?,?,?,?,?,?,?,?,?)");
stmt.clearParameters();
stmt.setString(1, bill_no);
stmt.setString(2, reserve_id);
stmt.setString(3, guest_id);
stmt.setString(4, item_id1);
stmt.setString(5, item_id2);
stmt.setString(6, item_id3);
stmt.setString(7, discount);
stmt.setDate(8, java.sql.Date.valueOf(payment_date));
stmt.setString(9, payment_mode);
stmt.setString(10, total_payment);

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