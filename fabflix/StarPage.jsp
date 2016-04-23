<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


	String star_id = request.getParameter("id");
    
  //loading drivers for mysql
    Class.forName("com.mysql.jdbc.Driver");

 //creating connection with the database 
    Connection connection=DriverManager.getConnection
                   ("jdbc:mysql://localhost:3306/moviedb","root","Anahit2394!");
	Statement select = connection.createStatement();
	Statement select_movies = connection.createStatement();
	ResultSet result =select.executeQuery("select * from stars where id = " + star_id);
	result.next();

		String first_name = result.getString("first_name");
		String last_name = result.getString("last_name");
		String photo = result.getString("photo_url");
		
	
	
%>
	
	<img src = "<%out.print(photo);%>" alt = "<%out.print(first_name + last_name);%> poster" style = "width304px;height228px;" style="float:left">
	<div class = "desctription" style="float:right">
	<p3><b><%out.print(first_name + last_name );%></b></p3>
	<p>ID: <%out.print(result.getString("id"));%></p>
	<p>Year: <%out.print(result.getString("dob"));%></p>
		<p>Movies: <%
		ResultSet movie_set =select_movies.executeQuery("select * from stars join stars_in_movies join movies where stars.id=stars_in_movies.star_id and stars_in_movies.movie_id=movies.id and stars.id =" + star_id);
		while(movie_set.next()){
			%><a href = "MoviePage.jsp?id=<% out.print(movie_set.getString("movies.id"));%>" ><% out.print(movie_set.getString("movies.title"));%></a>,  
<%
		}
		movie_set.close();


%></p>
	</div>
<%

%>
</body>
</html>