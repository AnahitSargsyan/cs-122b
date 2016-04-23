<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        	<title>Login</title>
	</head>	

	<body>
		<%
			if(request.getSession(false) != null){
				response.sendRedirect("Main");
			}
		%>

		<section class="loginform cf">
		<form name="login" action="index_submit" method="get" accept-charset="utf-8">

		       <div class="center">
			<input type="user" name="usermail" placeholder="username" required>

			<input type="password" name="password" placeholder="password" required>

		       <input type="submit" value="Login"></div>

		</form>
		</section>

	</body>
</html>