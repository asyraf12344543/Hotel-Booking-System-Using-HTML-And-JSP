<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String dbUser = "D208181";
	String dbPasswd = "208181";
	String dbURL = "jdbc:oracle:thin:@fsktmdbora.upm.edu.my:1521:FSKTM";
    try{
    	
    	
        String job_ID = request.getParameter("job_ID");   
        String password1 = request.getParameter("password1");
        Class.forName("oracle.jdbc.driver.OracleDriver");  // MySQL database connection
        Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPasswd);    
        PreparedStatement pst = conn.prepareStatement("Select job_ID,password1 from Hotel_Employee where job_ID=? and password1=?");
        pst.setString(1, job_ID);
        pst.setString(2, password1);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) {          
           out.println("Valid login credentials");
        	response.sendRedirect("A_USER.html");
        }
        else
           out.println("Invalid password or username.");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>