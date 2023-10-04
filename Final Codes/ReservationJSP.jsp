<%@ page contentType="text/html; charset=iso-8859-1" language="java"
import="java.sql.*" errorPage="" %>
<%
//Create an empty new variable

String Reserve_ID = request.getParameter("Reserve_ID");
String No_Of_Adult = request.getParameter("No_Of_Adult");
String No_Of_Children = request.getParameter("No_Of_Children");
String Reserve_Date = request.getParameter("Reserve_Date");
String Checkin_Date = request.getParameter("Checkin_Date");
String Checkout_Date = request.getParameter("Checkout_Date");
String Reserve_Time = request.getParameter("Reserve_Time");
String Special_Req = request.getParameter("Special_Req");


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
stmt=conn.prepareStatement("insert into reservedetails values(?,?,?,?,?,?,?,?)");
stmt.setString(1, Reserve_ID);
stmt.setString(2, No_Of_Adult);
stmt.setString(3, No_Of_Children);
stmt.setString(4, Reserve_Date);
stmt.setString(5, Checkin_Date);
stmt.setString(6, Checkout_Date);
stmt.setString(7, Reserve_Time);
stmt.setString(8, Special_Req);
//Run the query
stmt.executeUpdate();
conn.commit();
out.println("<p> <b> Reservation details saved.</b></p>");
//Close the database connection
stmt.close();
conn.close();
} catch (SQLException ex) {
out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
stmt.close();
conn.close();
}
%>