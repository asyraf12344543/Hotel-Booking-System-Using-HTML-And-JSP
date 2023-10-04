<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<link rel = "stylesheet" type="text/css" href="Colour_White.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
        <style>
        	td{
        		border: 1px solid black;
        		cellpadding: 5px;
        		cellspacing: 2px;
        	}
        </style>
    </head>
    <body>
        <form method="post" action="LOG_VALIDATE.jsp">
        			
            <table  >
                <thead>
                	<tr>
                		<th colspan="2"><img src="https://www.linkpicture.com/q/LOGO-pt2-1.png" alt="logo" style="width:50%">
						</th>
                	</tr>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody border="1" cellpadding="5" cellspacing="2">
                    <tr>
                        <td>Job ID</td>
                        <td><input type="text" name="job_ID" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password1" required/></td>
                    </tr>
                    <tr>
                    	<td align="center"><input type="reset" value="Reset" /></td>
                        <td align="center"><input type="submit" value="Login"/>
                            &nbsp;&nbsp;     
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
        </form>
    </body>
</html>