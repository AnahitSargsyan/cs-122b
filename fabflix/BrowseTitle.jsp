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
	String letter = "";
	letter = request.getParameter("letter");
    
  //loading drivers for mysql
    Class.forName("com.mysql.jdbc.Driver");

 //creating connection with the database 
    Connection connection=DriverManager.getConnection
                   ("jdbc:mysql://localhost:3306/moviedb","root","Anahit2394!");
    	Statement select = connection.createStatement();
	Statement select_movie = connection.createStatement();
	Statement select_genres = connection.createStatement();
	Statement select_stars = connection.createStatement();

	ResultSet result =select.executeQuery("select * from movies movies where title like \"" + letter +"%\"");
	
	while(result.next()){
		String movie_name = result.getString("title");
		%>
		<p1><b><a href = "MoviePage.jsp?id=<%out.print(result.getString("id") );%>"><%out.println(movie_name );%></a></b></p>
		<p>ID: <%out.print(result.getString("id"));%></p>
		<p>Year: <%out.print(result.getString("year"));%></p>
		<p>Director: <%out.print(result.getString("director"));%></p>
		<p>Genres: <%
		ResultSet genre_set =select_genres.executeQuery("select * from genres join genres_in_movies join movies where genres.id=genres_in_movies.genre_id and genres_in_movies.movie_id=movies.id and movies.id= " + result.getString("id"));
		while(genre_set.next()){
			out.print(genre_set.getString("genres.name"));%>,  <%
		}
		genre_set.close();


%></p>
		<p>Stars: <%
		ResultSet stars = select_stars.executeQuery("select * from stars join stars_in_movies join movies where stars.id=stars_in_movies.star_id and stars_in_movies.movie_id=movies.id and movies.id= "  + result.getString("id"));
		String star_name ="";
		//star_name += stars.getString("stars.first_name") + stars.getString("stars.last_name");		
		while(stars.next()){
			%><a href = "StarPage.jsp?id=<%out.print(stars.getString("stars.id"));%>"><%out.print(stars.getString("stars.first_name")+ stars.getString("stars.last_name"));%></a><%%>,  <%
		}
		stars.close();
		%></p>
`		<form name="Add to Cart" action="AddToCart" method="Get" accept-charset="utf-8">
    
	       <div class="center">
	
		Add to Cart
	       <input name = "id" type = "button" value = "<%out.print(result.getString("id"));%>">
    		<br><br>
<br>
</form>




		<%
	}
    
%>
<form name="Checkout" action="Checkout.jsp" method="Get" accept-charset="utf-8">
    
	       <div class="center">
	
		Add to Cart
	       <input name = "checkout" type = "button" value = "Checkout">
    		<br><br>
<br>
</form>
</body>
</html>