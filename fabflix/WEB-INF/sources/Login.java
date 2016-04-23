import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class Login extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
        if(checkUser(email, pass))
        {
            RequestDispatcher rs = request.getRequestDispatcher("Main.jsp");
            rs.forward(request, response);
        }
        else
        {
           out.println("Username or Password incorrect");
           RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
           rs.include(request, response);
        }
    }  
	public static boolean checkUser(String email,String pass) 
     {
      boolean st =false;
      try{

	 //loading drivers for mysql
         Class.forName("com.mysql.jdbc.Driver");

 	 //creating connection with the database 
         Connection con=DriverManager.getConnection
                        ("jdbc:mysql://localhost:3306/moviedb","root","Anahit2394!");
         PreparedStatement ps =con.prepareStatement
                             ("select * from customers where email=? and password=?");
         ps.setString(1, email);
         ps.setString(2, pass);
         
         ResultSet rs =ps.executeQuery();
         st = rs.next();
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
         return st;                 
  }   
}
