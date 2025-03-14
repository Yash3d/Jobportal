import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/product_catalog";
    private static final String USER = "root";
    private static final String PASS = "password";

    public static List<Product> getProducts(String search, String category) {
        List<Product> products = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            
            String sql = "SELECT * FROM products WHERE name LIKE ? ";
            if (category != null && !category.isEmpty()) {
                sql += "AND category = ?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + search + "%");
            if (category != null && !category.isEmpty()) {
                stmt.setString(2, category);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getString("category"),
                    rs.getString("image")
                ));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
}
