<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="WEB-INF/sources/ShoppingCartStore.java" %> 
<%@ page import="java.util.Vector" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
	
    ShoppingCartStore cart = new ShoppingCartStore();
	Vector<String> movies = cart.getMovies();
	
	for(int i = 0; i < movies.size(); i++){
		out.print(movies.get(i));
	}
 
	
	
    
%>
</body>
</html>