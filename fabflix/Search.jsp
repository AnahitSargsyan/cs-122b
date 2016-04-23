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
	String query = "1=1";
	String title = request.getParameter("title");
	if(!title.equals("")){
		query += " and title like \"%" + title +"%\"";
	}
	String year = request.getParameter("year");
	if(!year.equals("")){
		query += " and year like \"%" + year +"%\"";
	}
	String director = request.getParameter("director");
	if(!director.equals("")){
		query += " and director like \"%" + director +"%\"";
	}
	String name = request.getParameter("name");
	String firstname = "", lastname = "";
    if(name.contains(" ")){
    	firstname = name.split(" ")[0];
    	lastname = name.split(" ")[1];
    }
    else{
    	lastname = name;
    }
    if(!name.equals("")){
		query += " and stars.first_name like \"%" + firstname + "%\" and last_name like \"%" + lastname +"%\"";
	}
    
  //loading drivers for mysql
    Class.forName("com.mysql.jdbc.Driver");

 //creating connection with the database 
    Connection connection=DriverManager.getConnection
                   ("jdbc:mysql://localhost:3306/moviedb","root","Anahit2394!");
    Statement select = connection.createStatement();
	ResultSet result =select.executeQuery("select * from stars join stars_in_movies join movies where stars.id=stars_in_movies.star_id and stars_in_movies.movie_id=movies.id and " + query);
	
	while(result.next()){
		String movie_name = result.getString("title");
		out.println(movie_name ); %> <br> <%
	}
    
%>
</body>
</html>