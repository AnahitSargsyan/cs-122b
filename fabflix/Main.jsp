<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head> 
<title>Welcome to FABFLIX</title>
</head> 
<body>
<h1>Welcome to FABFLIX</h1>


<form name="Search" action="Search.jsp" method="Get" accept-charset="utf-8">
    
       <div class="center">
        <input type="text" name="title" placeholder="title" ><br>
        <input type="text" name="year" placeholder="year" ><br>
        <input type="text" name="director" placeholder="director" ><br>
        <input type="name" name="name" placeholder="first and/or last name" ><br>
        
       <input type="submit" value="Submit"></div>
    
</form>

<hr><h3>Browse by Name</h3>
<form name="Search" action="Browse.jsp" method="Get" accept-charset="utf-8">
<%
String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
for(int i = 0; i < 26; i++){
	%>
	<a href = "BrowseTitle.jsp?letter=<%out.print(alphabet.charAt(i)); %>" ><% out.print(alphabet.charAt(i));%></a>
	<%
	out.print("   ");
}
%>
</form>
<hr><h3>Browse by Genres</h3>
<% 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/moviedb";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "Anahit2394!");
    if(!connection.isClosed()){
    	Statement select = connection.createStatement();
    	ResultSet result =select.executeQuery("select * from genres");
    	
    	//ResultSetMetaData rsmd = result.getMetaData();
    	//int columnNumber = rsmd.getColumnCount();
    	while(result.next()){
    		String genre_name = result.getString(2);%>
    		<a href = "BrowseGenre.jsp?genre=<% out.print(genre_name);%>" ><% out.print(genre_name);%></a>, 
    		<%
    		out.print("    ");
    	}
    }
    connection.close();
}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>

<form name="Checkout" action="Checkout.jsp" method="Get" accept-charset="utf-8">
    
	       <div class="center">
	
		Add to Cart
	       <input name = "checkout" type = "button" value = "Checkout">
    		<br><br>
<br>
</form>
</font>
</body> 
</html>