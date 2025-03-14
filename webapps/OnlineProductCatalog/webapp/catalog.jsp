<%@ page import="java.util.List" %>
<%@ page import="Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Catalog</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h2>Product Catalog</h2>

<form method="GET" action="products">
    <input type="text" name="search" placeholder="Search for products">
    <select name="category">
        <option value="">All Categories</option>
        <option value="Electronics">Electronics</option>
        <option value="Clothing">Clothing</option>
        <option value="Footwear">Footwear</option>
    </select>
    <button type="submit">Search</button>
</form>

<table border="1">
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Category</th>
    </tr>

    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null) {
            for (Product product : products) {
    %>
        <tr>
            <td><img src="<%= product.getImage() %>" width="50"></td>
            <td><%= product.getName() %></td>
            <td><%= product.getDescription() %></td>
            <td>$<%= product.getPrice() %></td>
            <td><%= product.getCategory() %></td>
        </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
