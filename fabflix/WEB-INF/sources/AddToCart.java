import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class AddToCart extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        

	String id = toString(request.getParameter("id"));
	//ShoppingCartStore cart = new ShoppingCartStore();
	//cart.add(id);
    }  
	
}
