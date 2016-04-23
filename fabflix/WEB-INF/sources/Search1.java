import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Search extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String title = request.getParameter("title");
        String year = request.getParameter("year");
        String director = request.getParameter("director");
        String name = request.getParameter("name");
        
        String firstname = "", lastname = "";
        if(name.contains(" ")){
        	firstname = name.split(" ")[0];
        	lastname = name.split(" ")[1];
        }
        else{
        	lastname = name;
        }
        boolean st =false;
        try{

  	 //loading drivers for mysql
           Class.forName("com.mysql.jdbc.Driver");

   	 //creating connection with the database 
           Connection con=DriverManager.getConnection
                          ("jdbc:mysql://localhost:3306/moviedb","root","Anahit2394!");
           PreparedStatement ps =con.prepareStatement
                               ("select * from customers where title=? and year=? and director =? and firsname =?");
 
           
           ResultSet rs =ps.executeQuery();
           st = rs.next();
          
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        

    }  
}
