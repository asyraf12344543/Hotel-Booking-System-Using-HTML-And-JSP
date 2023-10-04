<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel = "stylesheet" type="text/css" href="Colour_White.css" />
<title>Logout</title>
</head>
	<body><div class="center">
	<% session.invalidate(); %>
	<h4>You have been successfully logout</h4>
	<br/>
	<form action="LOGIN.jsp" method="GET"><button class= "log_btn">Log In</button></form>				
	</div>
</body>
</html>