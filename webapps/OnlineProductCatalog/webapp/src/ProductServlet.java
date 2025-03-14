import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String search = request.getParameter("search");
        String category = request.getParameter("category");

        if (search == null) search = "";
        
        List<Product> products = ProductDAO.getProducts(search, category);
        
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("catalog.jsp");
        dispatcher.forward(request, response);
    }
}
